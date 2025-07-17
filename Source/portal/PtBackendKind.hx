package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('genesis.h')
@:native('cpp.Struct<PtBackendKind>')
private extern class NativePtBackendKind {}

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
extern enum abstract PtBackendKind(NativePtBackendKind) {
    @:native('PT_BACKEND_KIND_DESKTOP')
    public var PT_BACKEND_KIND_DESKTOP;

    @:native('PT_BACKEND_KIND_MOBILE')
    public var PT_BACKEND_KIND_MOBILE;

    @:native('PT_BACKEND_KIND_HEADLESS')
    public var PT_BACKEND_KIND_HEADLESS;
}
