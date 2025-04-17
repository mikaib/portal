package portal;

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
    public static function createWindow(title: String, width: Int, height: Int): PtWindow;

    @:native('pt_destroy_window')
    public static function destroyWindow(window: PtWindow): Void;

    @:native('pt_should_window_close')
    public static function shouldWindowClose(window: PtWindow): Int;

    @:native('pt_swap_buffers')
    public static function swapBuffers(window: PtWindow): Void;

    @:native('pt_poll_events')
    public static function pollEvents(window: PtWindow): Void;

    @:native('pt_use_gl_context')
    public static function useGLContext(window: PtWindow): Int;

    @:native('pt_init')
    public static function init(config: PtConfig): Void;

    @:native('pt_shutdown')
    public static function shutdown(): Void;
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

    public static function init(config: PtConfig): Void {
        NativePortal.init(config);
    }

    public static function shutdown(): Void {
        NativePortal.shutdown();
    }
}
typedef Portal = _Portal;
#end