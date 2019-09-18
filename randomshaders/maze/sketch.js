//this variable will hold our shader object
let simpleShader;
let clicked = false;

function preload() {
    // a shader is composed of two parts, a vertex shader, and a fragment shader
    // the vertex shader prepares the vertices and geometry to be drawn
    // the fragment shader renders the actual pixel colors
    // loadShader() is asynchronous so it needs to be in preload
    // loadShader() first takes the filename of a vertex shader, and then a frag shader
    // these file types are usually .vert and .frag, but you can actually use anything. .glsl is another common one
    simpleShader = loadShader('10.vert', '10.glsl');
}

function setup() {
    // shaders require WEBGL mode to work

    createCanvas(windowWidth, windowHeight, WEBGL);
    noStroke();

}

function draw() {
    // shader() sets the active shader with our shader
    shader(simpleShader);

    simpleShader.setUniform("u_resolution", [width, height]);
    simpleShader.setUniform("u_time", millis() / 1000.0); // we divide millis by 1000 to convert it to seconds
    simpleShader.setUniform("u_mouse", [mouseX, map(mouseY, 0, height, height, 0)]); // we flip Y so it's oriented properly in our shader
    /*
    if (clicked === true) {
        simpleShader.setUniform("clicked", 1.0);
    } else {
        simpleShader.setUniform("clicked", 0.0);
    }
    */
    // rect gives us some geometry on the screen
    rect(0, 0, width, height);
}

function windowResized() {
    resizeCanvas(windowWidth, windowHeight);
}

function mouseClicked() {
    clicked = !clicked;
}