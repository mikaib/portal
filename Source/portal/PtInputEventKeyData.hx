package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')

@:native('PtInputEventKeyData')
@:unreflective
@:structAccess
extern class NativePtInputEventKeyData {
    public var key: Int;
    public var modifiers: Int;
}
typedef PtInputEventKeyData = cpp.Star<NativePtInputEventKeyData>;
