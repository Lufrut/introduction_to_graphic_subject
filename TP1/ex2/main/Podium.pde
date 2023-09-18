public class Podium {
  PShape podium;
  PImage texture;
  Podium() {
    podium = loadShape("podium.obj");
  }
  void drawPodium(){
    shape(podium);
  }
}
