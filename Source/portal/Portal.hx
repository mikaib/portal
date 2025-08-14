package portal;
import genesis.GsClearFlags;
import genesis.GsCommandList;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
#if (PT_STUB)
extern class NativePortal {
#else
extern class Portal {
#end

    @:native('PT_VERSION_MAJOR')
    public static var versionMajor: Int;

    @:native('PT_VERSION_MINOR')
    public static var versionMinor: Int;

    @:native('PT_VERSION_PATCH')
    public static var versionPatch: Int;

    inline public static function getVersionString(): String {
        return versionMajor + '.' + versionMinor + '.' + versionPatch;
    }

    @:native('pt_create_config')
    public static function createConfig(): PtConfig;

    @:native('pt_destroy_config')
    public static function destroyConfig(config: PtConfig): Void;

    @:native('pt_create_backend')
    public static function createBackend(type: PtBackendType): PtBackend;

    @:native('pt_destroy_backend')
    public static function destroyBackend(backend: PtBackend): Void;

    @:native('pt_get_optimal_backend_type')
    public static function getOptimalBackendType(): PtBackendType;

    @:native('pt_create_window')
    private static function nativeCreateWindow(title: String, width: Int, height: Int, flags: PtWindowFlags): PtWindow;
    public static inline function createWindow(title: String, width: Int, height: Int, flags: PtWindowFlags = PT_WINDOW_FLAGS_NONE): PtWindow {
        return nativeCreateWindow(title, width, height, untyped __cpp__("(PtWindowFlags){0}", flags));
    }

    @:native('pt_destroy_window')
    public static function destroyWindow(window: PtWindow): Void;

    @:native('pt_should_window_close')
    public static function shouldWindowClose(window: PtWindow): Int;

    @:native('pt_swap_buffers')
    public static function swapBuffers(window: PtWindow): Void;

    @:native('pt_poll_events')
    public static function pollEvents(window: PtWindow): Void;

    // Window dimensions = the size of the window (which the platform *may* scale)
    // Framebuffer dimensions = the *full* size of the framebuffer
    // Usable dimensions = framebuffer dimensions in which nothing should obstruct what is drawn (e.g phone cutouts)

    @:native('pt_get_window_width')
    public static function getWindowWidth(window: PtWindow): Int;

    @:native('pt_get_window_height')
    public static function getWindowHeight(window: PtWindow): Int;

    @:native('pt_get_framebuffer_width')
    public static function getFramebufferWidth(window: PtWindow): Int;

    @:native('pt_get_framebuffer_height')
    public static function getFramebufferHeight(window: PtWindow): Int;

    @:native('pt_get_usable_width')
    public static function getUsableWidth(window: PtWindow): Int;

    @:native('pt_get_usable_height')
    public static function getUsableHeight(window: PtWindow): Int;

    @:native('pt_get_usable_xoffset')
    public static function getUsableXOffset(window: PtWindow): Int;

    @:native('pt_get_usable_yoffset')
    public static function getUsableYOffset(window: PtWindow): Int;

    @:native('pt_use_gl_context')
    public static function useGLContext(window: PtWindow): Int;

    @:native('pt_init')
    public static function init(config: PtConfig): Void;

    @:native('pt_shutdown')
    public static function shutdown(): Void;

    @:native('pt_get_input_event_count')
    public static function getInputEventCount(window: PtWindow): Int;

    @:native('pt_pull_input_event')
    public static function pullInputEvent(window: PtWindow): PtInputEventData;

    @:native('pt_enable_throttle')
    public static function enableThrottle(fps: Int): Void;

    @:native('pt_disable_throttle')
    public static function disableThrottle(): Void;

    @:native('pt_sleep')
    public static function sleep(seconds: Float): Void;

    @:native('pt_get_time')
    public static function getTime(): Float;

    @:native('pt_get_window_handle')
    public static function getWindowHandle(window: PtWindow): cpp.Star<cpp.Void>;

    @:native('pt_set_window_title')
    public static function setWindowTitle(window: PtWindow, title: cpp.ConstCharStar): Void;

    @:native('pt_set_window_size')
    public static function setWindowSize(window: PtWindow, width: Int, height: Int): Void;

    @:native('pt_set_video_mode')
    public static function setVideoMode(window: PtWindow, mode: PtVideoMode): Void;

    @:native('pt_show_window')
    public static function showWindow(window: PtWindow): Void;

    @:native('pt_hide_window')
    public static function hideWindow(window: PtWindow): Void;

    @:native('pt_minimize_window')
    public static function minimizeWindow(window: PtWindow): Void;

    @:native('pt_maximize_window')
    public static function maximizeWindow(window: PtWindow): Void;

    @:native('pt_restore_window')
    public static function restoreWindow(window: PtWindow): Void;

    @:native('pt_focus_window')
    public static function focusWindow(window: PtWindow): Void;

    @:native('pt_is_window_maximized')
    public static function isWindowMaximized(window: PtWindow): Int;

    @:native('pt_is_window_minimized')
    public static function isWindowMinimized(window: PtWindow): Int;

    @:native('pt_is_window_focused')
    public static function isWindowFocused(window: PtWindow): Int;

    @:native('pt_is_window_visible')
    public static function isWindowVisible(window: PtWindow): Int;
}

#if (PT_STUB)
@:unreflective
class _Portal {
    public static function getVersionString(): String {
        return NativePortal.getVersionString();
    }

    public static function createConfig(): PtConfig {
        return NativePortal.createConfig();
    }

    public static function destroyConfig(config: PtConfig): Void {
        NativePortal.destroyConfig(config);
    }

    public static function createBackend(type: PtBackendType): PtBackend {
        return NativePortal.createBackend(type);
    }

    public static function destroyBackend(backend: PtBackend): Void {
        NativePortal.destroyBackend(backend);
    }

    public static function getOptimalBackendType(): PtBackendType {
        return NativePortal.getOptimalBackendType();
    }

    public static function createWindow(title: String, width: Int, height: Int, flags: PtWindowFlags = PT_WINDOW_FLAGS_NONE): PtWindow {
        return NativePortal.createWindow(title, width, height, flags);
    }

    public static function destroyWindow(window: PtWindow): Void {
        NativePortal.destroyWindow(window);
    }

    public static function shouldWindowClose(window: PtWindow): Int {
        return NativePortal.shouldWindowClose(window);
    }

    public static function swapBuffers(window: PtWindow): Void {
        NativePortal.swapBuffers(window);
    }

    public static function pollEvents(window: PtWindow): Void {
        NativePortal.pollEvents(window);
    }

    public static function getWindowWidth(window: PtWindow): Int {
        return NativePortal.getWindowWidth(window);
    }

    public static function getWindowHeight(window: PtWindow): Int {
        return NativePortal.getWindowHeight(window);
    }

    public static function getFramebufferWidth(window: PtWindow): Int {
        return NativePortal.getFramebufferWidth(window);
    }

    public static function getFramebufferHeight(window: PtWindow): Int {
        return NativePortal.getFramebufferHeight(window);
    }

    public static function getUsableWidth(window: PtWindow): Int {
        return NativePortal.getUsableWidth(window);
    }

    public static function getUsableHeight(window: PtWindow): Int {
        return NativePortal.getUsableHeight(window);
    }

    public static function getUsableXOffset(window: PtWindow): Int {
        return NativePortal.getUsableXOffset(window);
    }

    public static function getUsableYOffset(window: PtWindow): Int {
        return NativePortal.getUsableYOffset(window);
    }

    public static function useGLContext(window: PtWindow): Int {
        return NativePortal.useGLContext(window);
    }

    public static function init(config: PtConfig): Void {
        NativePortal.init(config);
    }

    public static function shutdown(): Void {
        NativePortal.shutdown();
    }

    public static function getInputEventCount(window: PtWindow): Int {
        return NativePortal.getInputEventCount(window);
    }

    public static function pullInputEvent(window: PtWindow): PtInputEventData {
        return NativePortal.pullInputEvent(window);
    }

    public static function enableThrottle(fps: Int): Void {
        NativePortal.enableThrottle(fps);
    }

    public static function disableThrottle(): Void {
        NativePortal.disableThrottle();
    }

    public static function sleep(seconds: Float): Void {
        NativePortal.sleep(seconds);
    }

    public static function getTime(): Float {
        return NativePortal.getTime();
    }

    public static function getWindowHandle(window: PtWindow): cpp.Star<cpp.Void> {
        return NativePortal.getWindowHandle(window);
    }

    public static function setWindowTitle(window: PtWindow, title: String): Void {
        NativePortal.setWindowTitle(window, title);
    }

    public static function setWindowSize(window: PtWindow, width: Int, height: Int): Void {
        NativePortal.setWindowSize(window, width, height);
    }

    public static function setVideoMode(window: PtWindow, mode: PtVideoMode): Void {
        NativePortal.setVideoMode(window, mode);
    }

    public static function showWindow(window: PtWindow): Void {
        NativePortal.showWindow(window);
    }

    public static function hideWindow(window: PtWindow): Void {
        NativePortal.hideWindow(window);
    }

    public static function minimizeWindow(window: PtWindow): Void {
        NativePortal.minimizeWindow(window);
    }

    public static function maximizeWindow(window: PtWindow): Void {
        NativePortal.maximizeWindow(window);
    }

    public static function restoreWindow(window: PtWindow): Void {
        NativePortal.restoreWindow(window);
    }

    public static function focusWindow(window: PtWindow): Void {
        NativePortal.focusWindow(window);
    }

    public static function isWindowMaximized(window: PtWindow): Int {
        return NativePortal.isWindowMaximized(window);
    }

    public static function isWindowMinimized(window: PtWindow): Int {
        return NativePortal.isWindowMinimized(window);
    }

    public static function isWindowFocused(window: PtWindow): Int {
        return NativePortal.isWindowFocused(window);
    }

    public static function isWindowVisible(window: PtWindow): Int {
        return NativePortal.isWindowVisible(window);
    }
}
typedef Portal = _Portal;
#end