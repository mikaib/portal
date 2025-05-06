package portal;

@:native('PtInputEventTouchData')
@:unreflective
@:structAccess
extern class PtInputEventTouchData {
    public var finger: Int;
    public var x: Int;
    public var y: Int;
}