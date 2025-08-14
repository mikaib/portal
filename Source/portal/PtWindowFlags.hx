package portal;

enum abstract PtWindowFlags(Int) from Int to Int {
    public var PT_WINDOW_FLAGS_NONE:Int = 0;
    public var PT_WINDOW_FLAGS_VSYNC:Int = 1 << 0;
    public var PT_WINDOW_FLAGS_RESIZABLE:Int = 1 << 1;
    public var PT_WINDOW_FLAGS_MAXIMIZED:Int = 1 << 2;
    public var PT_WINDOW_FLAGS_MINIMIZED:Int = 1 << 3;
    public var PT_WINDOW_FLAGS_HIDDEN:Int = 1 << 4;
    public var PT_WINDOW_FLAGS_ALWAYS_ON_TOP:Int = 1 << 5;
    public var PT_WINDOW_FLAGS_NO_TITLEBAR:Int = 1 << 6;
    public var PT_WINDOW_FLAGS_TRANSPARENT:Int = 1 << 7;
    public var PT_WINDOW_FLAGS_FULLSCREEN:Int = 1 << 8;
    public var PT_WINDOW_FLAGS_BORDERLESS:Int = 1 << 9;
    public var PT_WINDOW_FLAGS_CENTERED:Int = 1 << 10;
    public var PT_WINDOW_FLAGS_NO_FOCUS:Int = 1 << 11;
}
