public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public PVector direction = new PVector();
  
  public float scale = 15;
  public float velocityLimit = 20;
  
  public color matterColor;
  
  // Random Stuff
  float randScale = random(5, 50);
  float standardDeviation = 1000;
  
  void Properties()
  {
    float gaussianX = randomGaussian();
    float gaussianY = randomGaussian();
    float x = 1000 * gaussianX + 30;
    float y = 1000 * gaussianY + 30;
    
    position = new PVector(x, y);
  }

  public void update()
 {
   this.velocity.add(this.acceleration);
   this.velocity.limit(velocityLimit);
   this.position.add(this.acceleration);
 }

  public Walker() 
  {
      Properties();
      matterColor = randomRGB();
  }

  public void render()
  { 
      fill(matterColor, 80);
      noStroke();
      circle(position.x, position.y, randScale);
  }

   color randomRGB()
  {
    float r = random(256);
    float g = random(256);
    float b = random(256);

    return color(r, g, b);
  }
}
