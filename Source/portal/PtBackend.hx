package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
@:native('PtBackend')
@:unreflective
@:structAccess
extern class NativePtBackend {
    public var type: PtBackendType;

    inline public function destroy(): Void{
        Portal.destroyBackend(this);
    }
}

typedef PtBackend = cpp.Star<NativePtBackend>;
