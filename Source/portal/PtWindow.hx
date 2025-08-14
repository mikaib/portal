package portal;

@:buildXml('<include name="${haxelib:portal}/Source/Build.xml" />')
@:include('portal.h')
@:native('PtWindow')
@:unreflective
@:structAccess
extern class NativePtWindow {
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

    inline public function setWindowTitle(title: String): Void {
        Portal.setWindowTitle(this, title);
    }

    inline public function setWindowSize(width: Int, height: Int): Void {
        Portal.setWindowSize(this, width, height);
    }

    inline public function setVideoMode(mode: PtVideoMode): Void {
        Portal.setVideoMode(this, mode);
    }

}

typedef PtWindow = cpp.Star<NativePtWindow>;
