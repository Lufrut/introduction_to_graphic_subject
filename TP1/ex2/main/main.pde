//make all object that we need
Camera camera;
Goat goat;
Podium podium;
Ground ground;
Lighting light;
void setup() {
  //init all the objects
  size(800, 800, P3D);
  camera = new Camera(this);
  camera.setPosition(new PVector(0, -3, 10));
  goat = new Goat();
  podium = new Podium();
  ground = new Ground();
  light = new Lighting();
}

//draw all draw function from classes
void draw() {
  background(0);
  light.drawLights();
  goat.drawGoat();
  podium.drawPodium();
  ground.drawGround();
}

//keyboard input
void keyPressed() {
  light.modeSwitcher(key);
}
