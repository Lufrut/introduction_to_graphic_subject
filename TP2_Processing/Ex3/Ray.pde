class Ray{

Ray generateRay(float p_x, float p_y) {
        PVector P = PVector.sub(PVector.add(_vC, (PVector.mult(_vU, p_x))), PVector.mult(_vV, p_y));
        MyRay = new Ray(_position, P);
        updateViewPort();
        return MyRay;
}
