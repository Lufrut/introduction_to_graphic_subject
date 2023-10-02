Camera Cam;
Ray myR;

//declaration sphere + Couleur
Sphere mySphere;
color myCouleur;
//declaration test
float testIntersection = 0.0;



  void setup() {
    size(500,500, P3D);
    // creation camera avec un fov de 60
    Cam = new Camera(width, height, 60);
    Cam.setPosition(0, 0,-2);
    colorMode(RGB, 1.f);
    //generation Sphere rouge en position(0,0,3)
    mySphere = new Sphere(new PVector(0,0,3),1.0,color(1,0,0));
  }

  // Exemple creation Rayon
void draw()
{
   loadPixels();
   
    for(int x = 0; x < width; x++)
  {
    for(int y = 0; y < height; y++)
    {
      //generation Rayon
      myR = Cam.generateRay((float)x/(float)width,(float)y/(float)height);
      myCouleur=color(1.0, 1.0, 1.0);
      //test Intersection
      testIntersection = mySphere.intersect(myR,0,1000);
      if (testIntersection !=-1.0)
      {
        myCouleur = mySphere.couleurSphere;
      }
      //le reste en blanc
        pixels[x * width + y] = myCouleur;

}
}
  updatePixels();
}
