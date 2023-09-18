Camera camera;

void setup(){
  size(800,800,P3D);
  
  camera = new Camera(this);
  camera.setPosition(new PVector(0,0,5));
}
void draw(){
  background(0);
  fill(0xFF,0,0);
  stroke(0xFF,0xFF,0);
  strokeWeight(3);
  pointLight(0xFF,0xFF,0xFF, 0,-2,2);
  box(1);
}
