package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('genesis.h')
@:native('cpp.Struct<PtBackendType>')
private extern class NativePtBackendType {}

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
extern enum abstract PtBackendType(NativePtBackendType) {
    @:native('PT_BACKEND_NOOP')
    public var PT_BACKEND_NOOP;

    @:native('PT_BACKEND_GLFW')
    public var PT_BACKEND_GLFW;

    @:native('PT_BACKEND_ANDROID')
    public var PT_BACKEND_ANDROID;
}
