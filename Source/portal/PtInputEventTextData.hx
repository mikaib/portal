package portal;

@:native('PtInputEventTextData')
@:unreflective
@:structAccess
extern class NativePtInputEventTextData {
    public var text: cpp.ConstCharStar;
}
typedef PtInputEventTextData = cpp.Star<NativePtInputEventTextData>;