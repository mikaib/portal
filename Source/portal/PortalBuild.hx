package portal;
using StringTools;

import haxe.macro.Context;
import sys.io.Process;
import haxe.macro.Compiler;
import haxe.io.Path;
import sys.FileSystem;

class PortalBuild {

    public static macro function init(): Void {
        if (Sys.systemName() == "Linux") {
            var useWayland = Context.defined("PT_WAYLAND");
            var useX11 = Context.defined("PT_X11");

            if (!useWayland && !useX11) {
                var waylandCheckPs = new Process("echo", ["$WAYLAND_DISPLAY"]);
                waylandCheckPs.exitCode(true);

                var waylandCheckOut = waylandCheckPs.stdout.readAll().toString();
                if (waylandCheckOut.length > 0) {
                    Compiler.define("PT_WAYLAND");
                    useWayland = true;

                    Sys.println("[portal] Auto-detected Wayland!");
                } else {
                    Compiler.define("PT_X11");
                    useX11 = true;

                    Sys.println("[portal] No Wayland detected, falling back to X11!");
                }
            }

            if (useWayland && !Context.defined("PT_NO_GLFW")) {
                var paths = Context.getClassPath();
                paths.sort((a, b) -> b.length - a.length);

                var path = "";
                for (p in paths) {
                    var merged = Path.join([p, "portal", "Portal.hx"]);

                    if (FileSystem.exists(merged)) {
                        path = Path.join([p, ".."]);
                        break;
                    }
                }

                if (path.length == 0) {
                    Sys.println("[portal] Could not find the portal installation!");
                    return;
                }

                var glfwSource = Path.join([path, "Native", "glfw", "src"]);
                if (!FileSystem.exists(glfwSource)) {
                    Sys.println("[portal] Could not find GLFW!");
                    return;
                }

                var waylandTestFile = Path.join([glfwSource, "wayland-client-protocol.h"]);
                if (FileSystem.exists(waylandTestFile) && !Context.defined("PT_WAYLAND_REGEN")) {
                    return;
                }

                Sys.println("[portal] Updating wayland files for GLFW...");
                var tmpDir = "/tmp";

                Sys.println("[portal] Temporary dir: " + tmpDir);
                Sys.println("[portal] GLFW source dir: " + glfwSource);

                if (!FileSystem.isDirectory(glfwSource)) {
                    Sys.println("Error: GLFW path does not exist: " + glfwSource);
                    Sys.exit(1);
                }

                var files: Map<String, String> = [
                    "stable/xdg-shell/xdg-shell" => "xdg-shell-client-protocol",
                    "staging/fractional-scale/fractional-scale-v1" => "fractional-scale-v1-client-protocol",
                    "staging/xdg-activation/xdg-activation-v1" => "xdg-activation-v1-client-protocol",
                    "unstable/xdg-decoration/xdg-decoration-unstable-v1" => "xdg-decoration-unstable-v1-client-protocol",
                    "stable/viewporter/viewporter" => "viewporter-client-protocol",
                    "unstable/relative-pointer/relative-pointer-unstable-v1" => "relative-pointer-unstable-v1-client-protocol",
                    "unstable/pointer-constraints/pointer-constraints-unstable-v1" => "pointer-constraints-unstable-v1-client-protocol",
                    "unstable/idle-inhibit/idle-inhibit-unstable-v1" => "idle-inhibit-unstable-v1-client-protocol"
                ];

                Sys.println("[portal] Checking and removing old files...");

                var coreFiles = [
                    "wayland-client-protocol.h",
                    "wayland-client-protocol-code.h"
                ];
                for (file in coreFiles) {
                    var path = Path.join([glfwSource, file]);
                    if (FileSystem.exists(path)) {
                        Sys.println("[portal] rm: " + path);
                        FileSystem.deleteFile(path);
                    }
                }

                // Remove all protocol-generated files
                for (f in files.keys()) {
                    var fv = files.get(f);
                    var header = Path.join([glfwSource, fv + ".h"]);
                    var code = Path.join([glfwSource, fv + "-code.h"]);

                    if (FileSystem.exists(header)) {
                        Sys.println("[portal] rm: " + header);
                        FileSystem.deleteFile(header);
                    }

                    if (FileSystem.exists(code)) {
                        Sys.println("[portal] rm: " + code);
                        FileSystem.deleteFile(code);
                    }
                }

                var cwd = Sys.getCwd();
                Sys.setCwd(tmpDir);

                Sys.println("[portal] Cloning Wayland repository...");
                new Process("git", ["clone", "--depth", "1", "https://gitlab.freedesktop.org/wayland/wayland.git"]).exitCode(true);

                Sys.println("[portal] Cloning Wayland protocols repository...");
                new Process("git", ["clone", "--depth", "1", "https://gitlab.freedesktop.org/wayland/wayland-protocols.git"]).exitCode(true);

                var waylandXml = Path.join([tmpDir, "wayland/protocol/wayland.xml"]);
                var waylandHeader = Path.join([glfwSource, "wayland-client-protocol.h"]);
                var waylandCode = Path.join([glfwSource, "wayland-client-protocol-code.h"]);

                Sys.println("[portal] wayland-scanner client-header (core): " + waylandHeader);
                new Process("wayland-scanner", ["client-header", waylandXml, waylandHeader]).exitCode(true);

                Sys.println("[portal] wayland-scanner private-code (core): " + waylandCode);
                new Process("wayland-scanner", ["private-code", waylandXml, waylandCode]).exitCode(true);

                for (f in files.keys()) {
                    var fv = files.get(f);
                    var header = Path.join([glfwSource, fv + ".h"]);
                    var code = Path.join([glfwSource, fv + "-code.h"]);
                    var xml = Path.join([tmpDir, "wayland-protocols", f + ".xml"]);

                    Sys.println("[portal] wayland-scanner client-header: " + header);
                    new Process("wayland-scanner", ["client-header", xml, header]).exitCode(true);

                    Sys.println("[portal] wayland-scanner private-code: " + code);
                    new Process("wayland-scanner", ["private-code", xml, code]).exitCode(true);
                }

                Sys.setCwd(cwd);
            }
        }
    }

}