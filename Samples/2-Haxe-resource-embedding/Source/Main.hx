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
import genesis.GsTexture;
import stb.Image;
import haxe.Resource;
import genesis.GsTextureFormat;
import haxe.io.Bytes;
import genesis.GsUniformLocation;

class Main {

    public var vertexData: Array<cpp.Float32> = [
        // x,    y,   z,   r,   g,   b,   a,   u,   v
        -0.5,  0.5, 0.0, 1.0, 1.0, 1.0, 1.0, 0.0, 0.0, // Top-left
        0.5,  0.5, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, // Top-right
        -0.5, -0.5, 0.0, 1.0, 1.0, 1.0, 1.0, 0.0, 1.0, // Bottom-left
        0.5, -0.5, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0  // Bottom-right
    ];

    public var indexData: Array<Int> = [
        0, 1, 2,  // First triangle
        2, 1, 3   // Second triangle
    ];

    #if (android && !GS_ANDROID_GLES2)
     public var vertexShaderSource: String = "#version 320 es
        precision highp float;

        in vec3 aPosition;
        in vec4 aColour;
        in vec2 aTexCoord;
        out vec4 vColour;
        out vec2 vTexCoord;

        uniform float uTime;

        void main() {
            gl_Position = vec4(aPosition, 1.0);
            gl_Position.x += sin(uTime);
            vColour = aColour;
            vTexCoord = aTexCoord;
        }
    ";

    public var fragmentShaderSource: String = "#version 320 es
        precision highp float;

        in vec4 vColour;
        in vec2 vTexCoord;
        out vec4 fragColor;

        uniform sampler2D uTexture;

        void main() {
            fragColor = texture(uTexture, vTexCoord) * vColour;
        }
    ";
    #elseif (emscripten || GS_ANDROID_GLES2)
    public var vertexShaderSource: String = "#version 100
        attribute vec3 aPosition;
        attribute vec4 aColour;
        attribute vec2 aTexCoord;
        varying vec4 vColour;
        varying vec2 vTexCoord;

        uniform float uTime;

        void main() {
            gl_Position = vec4(aPosition, 1.0);
            gl_Position.x += sin(uTime);
            gl_Position.y += cos(uTime) * 0.5;
            vColour = aColour;
            vTexCoord = aTexCoord;
        }
    ";

    public var fragmentShaderSource: String = "#version 100
        precision mediump float;
        varying vec4 vColour;
        varying vec2 vTexCoord;
        uniform sampler2D uTexture;

        void main() {
            gl_FragColor = texture2D(uTexture, vTexCoord) * vColour;
        }
    ";
    #else
        public var vertexShaderSource: String = "#version 460 core

        layout(location = 0) in vec3 aPosition;
        layout(location = 1) in vec4 aColour;
        layout(location = 2) in vec2 aTexCoord;
        out vec4 vColour;
        out vec2 vTexCoord;

        uniform float uTime;

        void main() {
            gl_Position = vec4(aPosition, 1.0);
            gl_Position.x += sin(uTime);
            vColour = aColour;
            vTexCoord = aTexCoord;
        }
    ";

        public var fragmentShaderSource: String = "#version 460 core

        in vec4 vColour;
        in vec2 vTexCoord;
        out vec4 fragColor;

        uniform sampler2D uTexture;

        void main() {
            fragColor = texture(uTexture, vTexCoord) * vColour;
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
    public var texture: GsTexture;
    public var uTexture: GsUniformLocation;
    public var uTime: GsUniformLocation;

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
        layout.add(2, GS_ATTRIB_TYPE_FLOAT, 2);  // texcoord
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

        // texture
        var texBytes = Resource.getBytes("image");
        var texData = Image.load_from_memory(texBytes.getData(), texBytes.length, 4);
        texture = Genesis.createTextureSimple(texData.w, texData.h, GsTextureFormat.GS_TEXTURE_FORMAT_RGBA8);
        texture.setData(Bytes.ofData(texData.bytes));

        // uniforms
        uTexture = program.getUniformLocation("uTexture");
        uTime = program.getUniformLocation("uTime");
    }

    public function destroyGraphics() {
        // destroy resources
        texture.destroy();
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
        commandList.setUniformInt(uTexture, 0);
        commandList.setUniformFloat(uTime, Sys.time() % (Math.PI * 2));
        commandList.clear(GS_CLEAR_COLOR | GS_CLEAR_DEPTH);
        commandList.usePipeline(pipeline);
        commandList.useBuffer(vertexBuffer);
        commandList.useBuffer(indexBuffer);
        commandList.useTexture(texture, 0);
        commandList.drawIndexed(6);
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