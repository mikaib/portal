package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
@:native('PtConfig')
@:unreflective
@:structAccess
extern class NativePtConfig {
    public var backend: PtBackend;

    inline public function destroy(): Void{
        Portal.destroyConfig(this);
    }
}

typedef PtConfig = cpp.Star<NativePtConfig>;
