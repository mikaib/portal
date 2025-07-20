package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
@:native('PtWindow')
@:unreflective
@:structAccess
extern class NativePtWindow {
    public var backend: PtBackend;

    inline public function swapBuffers(): Void {
        Portal.swapBuffers(this);
    }

    inline public function pollEvents(): Void {
        Portal.pollEvents(this);
    }

    inline public function useGLContext(): Bool {
        return Portal.useGLContext(this) == 1;
    }

    inline public function shouldWindowClose(): Bool {
        return Portal.shouldWindowClose(this) == 1;
    }

    inline public function destroy(): Void {
        Portal.destroyWindow(this);
    }

    inline public function getWindowWidth(): Int {
        return Portal.getWindowWidth(this);
    }

    inline public function getWindowHeight(): Int {
        return Portal.getWindowHeight(this);
    }

    inline public function getUsableWidth(): Int {
        return Portal.getUsableWidth(this);
    }

    inline public function getUsableHeight(): Int {
        return Portal.getUsableHeight(this);
    }

    inline public function getUsableXOffset(): Int {
        return Portal.getUsableXOffset(this);
    }

    inline public function getUsableYOffset(): Int {
        return Portal.getUsableYOffset(this);
    }

    inline public function getFramebufferWidth(): Int {
        return Portal.getFramebufferWidth(this);
    }

    inline public function getFramebufferHeight(): Int {
        return Portal.getFramebufferHeight(this);
    }

    inline public function getInputEventCount(): Int {
        return Portal.getInputEventCount(this);
    }

    inline public function pullInputEvent(): PtInputEventData {
        return Portal.pullInputEvent(this);
    }
}

typedef PtWindow = cpp.Star<NativePtWindow>;
