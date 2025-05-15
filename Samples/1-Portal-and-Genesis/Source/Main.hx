import genesis.Genesis;
import genesis.GsClearFlags;
import genesis.GsBackend;
import genesis.GsConfig;
import genesis.GsCommandList;
import genesis.GsShader;
import genesis.GsProgram;
import genesis.GsVtxLayout;
import genesis.GsPipeline;
import genesis.GsBuffer;
import portal.PtWindow;
import portal.PtConfig;
import portal.PtBackend;
import portal.Portal;

class Main {

    public var vertexData: Array<cpp.Float32> = [
        // x,    y,   z,   r,   g,   b,   a
        0.0,  0.5, 0.0, 1.0, 0.0, 0.0, 1.0,
        -0.5, -0.5, 0.0, 0.0, 1.0, 0.0, 1.0,
        0.5, -0.5, 0.0, 0.0, 0.0, 1.0, 1.0
    ];

    public var indexData: Array<Int> = [
        0, 1, 2
    ];

    #if (emscripten || android)
    public var vertexShaderSource: String = "
        #version 100
        attribute vec3 aPosition;
        attribute vec4 aColour;
        varying vec4 vColour;

        void main() {
            gl_Position = vec4(aPosition, 1.0);
            vColour = aColour;
        }
    ";

    public var fragmentShaderSource: String = "
        #version 100
        precision mediump float;
        varying vec4 vColour;

        void main() {
            gl_FragColor = vColour;
        }
    ";
    #else
        public var vertexShaderSource: String = "
        #version 460 core

        layout(location = 0) in vec3 aPosition;
        layout(location = 1) in vec4 aColour;
        out vec4 vColour;

        void main() {
            gl_Position = vec4(aPosition, 1.0);
            vColour = aColour;
        }
    ";

        public var fragmentShaderSource: String = "
        #version 460 core

        in vec4 vColour;
        out vec4 fragColor;

        void main() {
            fragColor = vColour;
        }
    ";
    #end


    public var window: PtWindow;
    public var ptConfig: PtConfig;
    public var ptBackend: PtBackend;
    public var backend: GsBackend;
    public var config: GsConfig;
    public var commandList: GsCommandList;
    public var pipeline: GsPipeline;
    public var layout: GsVtxLayout;
    public var program: GsProgram;
    public var vertexShader: GsShader;
    public var fragmentShader: GsShader;
    public var vertexBuffer: GsBuffer;
    public var indexBuffer: GsBuffer;

    public function initWindow() {
        trace("Hello from Genesis!");
        ptBackend = Portal.createBackend(Portal.getOptimalBackendType());

        ptConfig = Portal.createConfig();
        ptConfig.backend = ptBackend;

        Portal.init(ptConfig);

        window = Portal.createWindow("Genesis [1 - Hello Triangle]", 600, 600);
        window.useGLContext();
    }

    public function destroyWindow() {
        window.destroy();
        Portal.shutdown();
    }

    public function initGraphics() {
        // backend
        backend = Genesis.createBackend(Genesis.getOptimalBackendType());

        // config
        config = Genesis.createConfig();
        config.backend = backend;

        // init
        Genesis.init(config);

        // cmd list
        commandList = Genesis.createCommandList();

        // shaders
        vertexShader = Genesis.createShader(GS_SHADER_TYPE_VERTEX, vertexShaderSource);
        fragmentShader = Genesis.createShader(GS_SHADER_TYPE_FRAGMENT, fragmentShaderSource);

        // program
        program = Genesis.createProgram();
        program.attachShader(vertexShader);
        program.attachShader(fragmentShader);
        program.build();

        // layout
        layout = Genesis.createLayout();
        layout.add(0, GS_ATTRIB_TYPE_FLOAT, 3);  // position
        layout.add(1, GS_ATTRIB_TYPE_FLOAT, 4);  // color
        layout.build();

        // pipeline
        pipeline = Genesis.createPipeline();
        pipeline.layout = layout;
        pipeline.program = program;
        pipeline.msaa_samples = 4;

        // vertex buffer
        vertexBuffer = Genesis.createBuffer(GS_BUFFER_TYPE_VERTEX, GS_BUFFER_INTENT_DRAW_STATIC);
        vertexBuffer.setData(vertexData);

        // index buffer
        indexBuffer = Genesis.createBuffer(GS_BUFFER_TYPE_INDEX, GS_BUFFER_INTENT_DRAW_STATIC);
        indexBuffer.setData(indexData);
    }

    public function destroyGraphics() {
        // destroy resources
        commandList.destroy();
        pipeline.destroy();
        layout.destroy();
        vertexBuffer.destroy();
        indexBuffer.destroy();
        vertexShader.destroy();
        fragmentShader.destroy();
        program.destroy();

        // shutdown genesis
        Genesis.shutdown();

        // destroy backend & config
        backend.destroy();
        config.destroy();
    }

    public function frame() {
        commandList.begin();
        commandList.setViewport(0, 0, window.getFramebufferWidth(), window.getFramebufferHeight());
        commandList.clear(GS_CLEAR_COLOR | GS_CLEAR_DEPTH);
        commandList.usePipeline(pipeline);
        commandList.useBuffer(vertexBuffer);
        commandList.useBuffer(indexBuffer);
        commandList.drawIndexed(3);
        commandList.end();
        commandList.submit();
    }

    public function loop() {
        if (window.shouldWindowClose()) {
            destroy();
            return;
        }

        frame();

        Genesis.frame();
        window.swapBuffers();
        window.pollEvents();
    }

    public function init() {
        initWindow();
        initGraphics();

        Genesis.startMainloop(loop);
    }

    public function destroy() {
        Genesis.stopMainloop();
        destroyGraphics();
        destroyWindow();
    }

    public static function main() {
        var app = new Main();
        app.init();
    }

    public function new() {}

}