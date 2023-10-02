// All public for simplicity
class Camera {
  Camera(int p_imgWidth, int p_imgHeight, float p_fov) {
    _position = new PVector(0.f, 0.f, 0.f);
    // The camera coordinate system (_u, _v, _w) is fixed in this exercise!
    _u = new PVector(1.f, 0.f, 0.f);
    _v = new PVector(0.f, 1.f, 0.f);
    _w = new PVector(0.f, 0.f, -1.f);

    _aspectRatio = (float) p_imgWidth / p_imgHeight;
    _fov = p_fov;

    updateViewPort();
  }

  void setPosition(float p_x, float p_y, float p_z) {
    _position.x = p_x;
    _position.y = p_y;
    _position.z = p_z;
    updateViewPort();
  }

  void updateViewPort() {
    float h = 2.f * tan(radians(_fov * 0.5f));
    float w = h * _aspectRatio;

    _vU = PVector.mult(_u, w);
    _vV = PVector.mult(_v, h);
    _vC = PVector.sub(PVector.add(PVector.sub(_position, PVector.mult(_vU, 0.5f)), PVector.mult(_vV, 0.5f)), _w);
  }

  // methode que j'ai ajouter
  Ray generateRay(float p_x, float p_y) {
    PVector P = PVector.sub(PVector.add(_vC, (PVector.mult(_vU, p_x))), PVector.mult(_vV, p_y));
    myR = new Ray(_position, P);
    updateViewPort();
    return myR;
  }

  // ==================================

  PVector _position;

  // Camera coordinate system
  PVector _u;
  PVector _v;
  PVector _w;

  // Viewport vectors
  // _vC _vU
  // *---------->
  // |
  // _vV |
  // |
  // V
  PVector _vU;
  PVector _vV;
  PVector _vC; // Top left corner

  float _aspectRatio; // ratio width/height
  float _fov; // field of view
  Ray myR;
}

// class Ray Exercice 2
class Ray {
  public PVector O;
  public PVector D;

  // constructeur pour creer un rayon a partir d'une origine et d'une direction
  Ray(PVector O, PVector D) {
    this.O = O;
    this.D = D;
  }
}

// class Sphere Exercice 3
class Sphere {
  PVector p_centre;
  float rayon;
  color couleurSphere;

  // constructeur
  Sphere(PVector c, float r, color couleur) {
    p_centre = c;
    rayon = r;
    couleurSphere = couleur;
  }

  // methode intesect
  float intersect(Ray p_ray, float p_tMin, float p_tMax) {
    // Calcule le discriminant(le delta) pour trouver la distance "minimal"
    // tous les a tous les b tous les c
    float a = pow(p_ray.D.x, 2) + pow(p_ray.D.y, 2) + pow(p_ray.D.z, 2);
    float b = -2 * (PVector.dot(p_ray.D, p_ray.O) - PVector.dot(p_ray.D, p_centre));
    float c = PVector.dot(p_ray.O, p_ray.O) - (2 * PVector.dot(p_ray.O, p_centre)) + PVector.dot(p_centre, p_centre)
        - pow(rayon, 2);

    // ∆ = b2 −4ac
    float delta = pow(b, 2) - (4 * a * c);
    // pas d'intersection
    if (delta < 0) {
      return -1;
    }
    // Si Δ > 0, alors l'équation admet deux solutions réelles notées x1 et x2
    float x1 = (-b + sqrt(delta)) / (2 * a);
    float x2 = (-b - sqrt(delta)) / (2 * a);
    // la racine la plus petite comprise entre p_tMin et p_tMax
    float solution = min(x1, x2);
    if (solution > p_tMin && solution < p_tMax) {
      return solution;
    } else {
      return -1.0;
    }
  }
}
