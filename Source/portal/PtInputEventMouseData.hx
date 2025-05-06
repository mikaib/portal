package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')

@:native('PtInputEventMouseData')
@:unreflective
@:structAccess
extern class PtInputEventMouseData {
    public var button: Int;
    public var modifiers: Int;
    public var x: Int;
    public var y: Int;
    public var dx: Int;
    public var dy: Int;
}
