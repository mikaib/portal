package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
@:native('PtBackendType')
private extern class NativePtBackendType {}

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
extern enum abstract PtBackendType(NativePtBackendType) {
    @:native('PT_BACKEND_GLFW')
    public var PT_BACKEND_GLFW;

    @:native('PT_BACKEND_ANDROID')
    public var PT_BACKEND_ANDROID;
}
