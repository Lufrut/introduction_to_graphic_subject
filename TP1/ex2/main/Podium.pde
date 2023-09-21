/**
 * class Podium make podium from podium.obj shape
 * @autor Lufrut
 * @version 1.0
 */
public class Podium {
  PShape podium;
  PImage texture;
  Podium() {
    podium = loadShape("podium.obj");
  }
  void drawPodium() {
    shape(podium);
  }
}
