class Walker
{
  float x;
  float y;
  
  void render()
  {
    fill(randomRGB());
    stroke(randomAlpha());
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y+=10;
    }
    else if (rng == 1)
    {
      y-=10;
    }
    else if (rng == 2)
    {
      x+=10;
    }
    else if (rng == 3)
    {
      x-=10;
    }
    else if (rng == 4)
    {
      x-=10;
      y+=10;
    }
    else if (rng == 5)
    {
      x+=10;
      y+=10;
    }
    else if (rng == 6)
    {
      x-=10;
      y-=10;
    }
    else if (rng == 7)
    {
      x+=10;
      y-=10;
    }
  }
  
  void randomWalkBiased()
  {
    float rngBiased = random(1);
    
    if (rngBiased <= 0.4)
    {
      x+=10;
    }
    else if (rngBiased <= 0.6)
    {
      x-=10;
    }
    else if (rngBiased <= 0.8)
    {
      y+=10;
    }
    else
    {
      y-=10;
    }
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
   return random(101);
  }
}
