package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('genesis.h')
@:native('PtVideoMode')
private extern class NativePtVideoMode {}

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
extern enum abstract PtVideoMode(NativePtVideoMode) {
    @:native('PT_VIDEO_MODE_FULLSCREEN')
    public var PT_VIDEO_MODE_FULLSCREEN;

    @:native('PT_VIDEO_MODE_WINDOWED')
    public var PT_VIDEO_MODE_WINDOWED;

    @:native('PT_VIDEO_MODE_BORDERLESS')
    public var PT_VIDEO_MODE_BORDERLESS;

    @:native('PT_VIDEO_MODE_MAXIMIZED')
    public var PT_VIDEO_MODE_MAXIMIZED;
}
