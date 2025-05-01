package portal;

@:native('PtInputEventData')
@:unreflective
@:structAccess
extern class NativePtInputEventData {
    // Common data
    public var type: PtInputEventType;
    public var timestamp: cpp.Float64;

    // Event data
    public var key: PtInputEventKeyData;
    public var mouse: PtInputEventMouseData;
    public var touch: PtInputEventTouchData;
    public var text: PtInputEventTextData;
}
typedef PtInputEventData = cpp.Star<NativePtInputEventData>;