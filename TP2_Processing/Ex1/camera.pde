PImage image;//global variable

 void setup(){
  //size of picture
  size(1000,1000);
  colorMode(RGB,1.f);
  loadPixels();
  
  //iterate every pixel in canvas
  for(int i = 0;i<width;i++)
  {
    for(int j  = 0;j<height;j++)
    {
     pixels[i+width*j] = color((float)i/width,(float)j/height,0); //assigns a color to each pixel
    }
  }
  updatePixels();
  save("colorImage.jpg");
 }
