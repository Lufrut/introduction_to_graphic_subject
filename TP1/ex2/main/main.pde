Camera camera;
Goat goat;
Podium podium;
Ground ground;
void setup() {
  size(800, 800, P3D);
  camera = new Camera(this);
  camera.setPosition(new PVector(0, -3, 10));
  goat = new Goat();
  podium = new Podium();
  ground = new Ground();
}

void draw() {
  background(0);
  goat.drawGoat();
  podium.drawPodium();
  ground.drawGround();
}
