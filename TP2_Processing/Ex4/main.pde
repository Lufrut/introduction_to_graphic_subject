Camera Cam;
Ray myR;

//declaration sphere + Couleur
Sphere mySphere;
color myCouleur = #808080 ;
//declaration test
float testIntersection = 0.0,minimumInsterction;
//declaration liste de sphere
ArrayList<Sphere> listeSpheres;

  void setup() {
    size(500,500, P3D);
    // creation camera avec un fov de 60
    Cam = new Camera(width, height, 60);
    Cam.setPosition(0, 0,-2);
    colorMode(RGB, 1.f);
    //ajout les autres spheres
    listeSpheres = new ArrayList<Sphere>();
    listeSpheres.add(new Sphere(new PVector(0,0,3), 1, color(1,1,1))); 
    //sphere rouge
    listeSpheres.add(new Sphere(new PVector(0,-205,0), 200, color(255,0,0))); 
    //sphere blue
    listeSpheres.add(new Sphere(new PVector(0,205,0), 200, color(0,0,255))); 
    // sphere magenta
    listeSpheres.add(new Sphere(new PVector(-205,0,0), 200, color(255,0,255)));  
    // sphere jeune
    listeSpheres.add(new Sphere(new PVector(205,0,0), 200, color(255, 255, 0)));  
    // sphere cyan 5
    listeSpheres.add(new Sphere(new PVector(0,0,210), 200, color(0, 255, 0))); 
    // sphere verte
    listeSpheres.add(new Sphere(new PVector(0,0,510), 200, color(0, 255, 0))); 
    
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
      //valeur max
      minimumInsterction = 0x7FFFFFFF;
      for (int i = 0 ;i<listeSpheres.size();i++)
    {
        testIntersection = listeSpheres.get(i).intersect(myR,0,1000);
        
        if (testIntersection != -1.0 && testIntersection < minimumInsterction){
          myCouleur = listeSpheres.get(i).couleurSphere;
          minimumInsterction = testIntersection;
          pixels[x * width + y] = myCouleur;
        }
        
      }
}
}
  updatePixels();
}
