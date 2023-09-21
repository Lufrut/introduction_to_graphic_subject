/**
 * class goat make ground from ground.obj shape
 * also load textures and draw ground by using shape()
 * @autor Lufrut
 * @version 1.0
 */
public class Ground {
  PShape ground;
  PImage texture;
  /**
   * Here we create ground by loading shape, texture
   * also we scale obj to make it bigger than podium
   */
  Ground() {
    ground = loadShape("ground.obj");
    texture = loadImage("snow_texture.png");
    ground.setTexture(texture);
    ground.scale(30);
  }
  /**
   * there we draw ground,
   * I prefer don't use draw() naming, cuz draw() is reserved by prolog
   */
  void drawGround() {
    shape(ground);
  }
}
