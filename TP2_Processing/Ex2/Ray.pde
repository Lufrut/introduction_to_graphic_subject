Camera camera;
Ray ray;

class Ray {
    protected PVector O;
    protected PVector D;

    // constructeur pour creer un rayon a partir d'une origine et d'une direction
    Ray(PVector O, PVector D) {
        this.O = O;
        this.D = D;
    }

}
    // Question 5
    void setup() {
        size(500, 500, P3D);
        //fix the fov at 90 degrees
        camera = new Camera(width, height, 90);
        colorMode(RGB, 1.f);
    }

//creating Rayon
void draw()
{
   loadPixels();
    for (int x=0; x<width; x++) 
  {
    for (int y=0; y<height; y++) 
    {
     ray = camera.generateRay((float)y/(float)(width),(float)x/(float)(height));
     //P = _vC + _vU * p_x - _vV * p_y.
      pixels[width*x+y] = color((((float)(ray.D.x) + 1.f)*0.5f),(((float)(ray.D.y) + 1.f)*0.5f),(((float)(ray.D.z) + 1.f)*0.5f));
    }
  } 
  updatePixels();

}
