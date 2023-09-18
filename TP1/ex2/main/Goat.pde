/**
 * class goat make  goat from goat.obj shape
 * also load textures and draw goat
 * @autor Lufrut
 * @version 1.1
 */
public class Goat {
  /** value of shift goat to prevent it staying in podium */
  public static final float SHIFT_OF_GOAT_AXIS_Y = -1.2;
  PShape goat;
  PImage texture;

  /** Constructor where we make goat, load texture, set appropriate position */
  Goat() {
    goat = loadShape("goat.obj");
    goat.rotateX(PI);
    texture = loadImage("goat_texture.png");
    goat.setTexture(texture);
    goat.translate(0, SHIFT_OF_GOAT_AXIS_Y, 0);
  }

  /**
   * there we draw goat,
   * I prefer don't use draw() naming, cuz draw() is reserved by prolog
   */
  void drawGoat() {
    shape(goat);
  }
}
