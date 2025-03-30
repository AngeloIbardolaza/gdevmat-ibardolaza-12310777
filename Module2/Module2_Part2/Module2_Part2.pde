void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{ 
  int frameLimit = 300;
  
  if(frameCount % frameLimit == 0)
  {
  background(0);
  }
  
  float gaussian = randomGaussian();
  float y = random(-360, 360);
  //println(gaussian);
  
  float standardDeviation = 1000;
  float mean = 30;
  float x = standardDeviation * gaussian + mean;
  
  // Circle Gaussian
  float circleGauss = randomGaussian();
  float circleMean = 10;
  float circleSD = 60;
  float circleScale = circleSD * circleGauss + circleMean;
  noStroke();
  
  fill (randomRGB(), randomAlpha());
  circle(x, y, circleScale);
}

color randomRGB()
{
   float r = random(256);
   float g = random(256);
   float b = random(256);
   
   return color(r, g, b);
}
  
float randomAlpha()
{
   return random(10, 101);
}
