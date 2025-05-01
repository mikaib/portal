package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
@:native('PtBackendKind')
private extern class NativePtBackendKind {}

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
extern enum abstract PtBackendKind(NativePtBackendKind) {
    @:native('PT_BACKEND_KIND_DESKTOP')
    public var PT_BACKEND_KIND_DESKTOP;

    @:native('PT_BACKEND_KIND_MOBILE')
    public var PT_BACKEND_KIND_MOBILE;
}
