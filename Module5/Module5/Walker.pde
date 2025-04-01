public class Walker
{
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale;
  public float mass = 1;
  
  public color ballsCol;
  public float ballsSize;
  
  public Walker()
  {
    this.position = new PVector(-500, 200);
    this.ballsCol = randomRGB();
    this.mass = mass++;
    this.ballsSize = this.mass * 15;
  }

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }

  public void update()
  {
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); //resets every frame
  }

  public void render()
  {
    fill(ballsCol);
    //noStroke();
    circle(position.x, position.y, ballsSize);
  }
  
  color randomRGB()
  {
    float r = random(256);
    float g = random(256);
    float b = random(256);

    return color(r, g, b);
  }
  
  //float scalingSize()
  // {
  //   float size = 15;
     
  //   while (size + 8 < 150)
  //   {
  //     size += 8;
  //   }
   
   //return size;
   
   
   //float scalingMass()
   //{
   //  float m = 1;
     
   //  while (m < 10)
   //  {
   //    m++;
   //  }
   
   //return m;
   //}
}
