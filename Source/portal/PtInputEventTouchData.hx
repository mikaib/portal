package portal;

@:native('PtInputEventTouchData')
@:unreflective
@:structAccess
extern class NativePtInputEventTouchData {
    public var finger: Int;
    public var x: Int;
    public var y: Int;
}
typedef PtInputEventTouchData = cpp.Star<NativePtInputEventTouchData>;