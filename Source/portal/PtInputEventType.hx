package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
@:native('PtInputEventType')
private extern class NativePtInputEventType {}

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
extern enum abstract PtInputEventType(NativePtInputEventType) {
    @:native('PT_INPUT_EVENT_KEYUP')
    public var PT_INPUT_EVENT_KEYUP;

    @:native('PT_INPUT_EVENT_KEYDOWN')
    public var PT_INPUT_EVENT_KEYDOWN;

    @:native('PT_INPUT_EVENT_KEYPRESS')
    public var PT_INPUT_EVENT_KEYPRESS;

    @:native('PT_INPUT_EVENT_TEXT')
    public var PT_INPUT_EVENT_TEXT;

    @:native('PT_INPUT_EVENT_MOUSEUP')
    public var PT_INPUT_EVENT_MOUSEUP;

    @:native('PT_INPUT_EVENT_MOUSEDOWN')
    public var PT_INPUT_EVENT_MOUSEDOWN;

    @:native('PT_INPUT_EVENT_MOUSEMOVE')
    public var PT_INPUT_EVENT_MOUSEMOVE;

    @:native('PT_INPUT_EVENT_MOUSEWHEEL')
    public var PT_INPUT_EVENT_MOUSEWHEEL;

    @:native('PT_INPUT_EVENT_TOUCHUP')
    public var PT_INPUT_EVENT_TOUCHUP;

    @:native('PT_INPUT_EVENT_TOUCHDOWN')
    public var PT_INPUT_EVENT_TOUCHDOWN;

    @:native('PT_INPUT_EVENT_TOUCHMOVE')
    public var PT_INPUT_EVENT_TOUCHMOVE;
}
