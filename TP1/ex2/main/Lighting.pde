/**
 * class Lighting create set of lights
 * also switch mode to disco
 * @autor Luiza
 * @version 1.0
 */
class Lighting {
  // that float with help of that we rotate light witch specific
  //angle if it overflow it just get minus value which not inpact for rotate
  //stability
  float lightRotation = 0;
  boolean discoSwicher = false;

  void drawLights() {
    if (discoSwicher) discoMode();
    else dayMode();
  }
  //general lighting nothing special here
  void dayMode() {
    directionalLight(255, 255, 255, -2, 3, -2);
    ambientLight(50, 50, 50);
  }

  //here we switch swicher, 109 it's value of m key in ASCII
  void modeSwitcher(char value) {
    if (value == 109) {
      discoSwicher = !discoSwicher;
    }
  }
  //Ok so there is disco mode function which make and rotate lights
  void discoMode() {
    //here we save state of all scene
    pushMatrix();
    //rotate lights by angle which is slowly increase
    rotateY(lightRotation);
    lightRotation += 0.5;
    //there was a lot of calculation to determine position of lights
    // I have used triangles and projection for X,Y axis to calclulate them
    // about spot lights
    // first 3 numbers it's color
    // next 3 it's position of light
    // next 3 it's direction of light that shoud be pointed to goat
    // to get that we just make opposite vector, and remember the fact that goat
    // located not in 0,0,0 but in 0,1,0 so instead y = 20 use 19
    // other values is determinated in TP requirements
    spotLight(
      255, 0, 0,
      20, -20, 0,
      -20, 19, 0,
      PI/4, 400
      );

    spotLight(
      0, 255, 0,
      10, -20, 10*sqrt(3),
      -10, 19, -10*sqrt(3),
      PI/4, 400
      );

    spotLight(
      0, 0, 255,
      -10, -20, 10*sqrt(3),
      10, 19, -10*sqrt(3),
      PI/4, 400
      );

    spotLight(
      255, 255, 0,
      -20, -20, 0,
      20, 19, 0,
      PI/4, 400
      );

    spotLight(
      255, 0, 255,
      -10, -20, -10*sqrt(3),
      10, 19, 10*sqrt(3),
      PI/4, 400
      );

    spotLight(
      0, 255, 255,
      10, -20, -10*sqrt(3),
      -10, 19, 10*sqrt(3),
      PI/4, 400
      );

    popMatrix();
  }
}
