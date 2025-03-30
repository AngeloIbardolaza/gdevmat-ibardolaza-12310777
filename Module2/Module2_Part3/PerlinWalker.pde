class PerlinWalker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  // Scale Variable
  public float t = 2000;
  
  // RGB Variables
  public float tr = 4000;
  public float tg = 5000;
  public float tb = 6000;
  public float r;
  public float g;
  public float b;
  
  void render()
  {
    circle(x, y, perlinScale());
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
  color perlinRGB()
  {
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    
    tr += 0.05f;
    tg += 0.05f;
    tb += 0.05f;
    return color(r, g, b);
  }
  
  float perlinScale()
  {
    t += 0.02f;
    return map(noise(t), 0, 1, 5, 150);
  }
}
