public class Walker
{
  public PVector position;
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float velocityLimit = 10;
  public color ballsCol;
  
  public color g;
  public color b;
  
  public float mass = 1; 
  public float scale;
  
  public float gravitationalConstant = 1;
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public Walker()
  {
    this.ballsCol = randomRGB();
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
    fill(ballsCol, 50);
    noStroke();
    circle(position.x, position.y, scale);
  }
  
  color randomRGB()
  {
    float r = random(255);
    float g = random(255);
    float b = random(255);

    return color(r, g, b);
  }
  
  public void checkEdges()
  {
  if (position.y < Window.bottom)
    {
      velocity.y *= -1;
    }
    else if (position.y > Window.top)
    {
      velocity.y *= -1;
    }
    else if (position.x < Window.left)
    {
     velocity.x *= -1;
    }
    else if (position.x > Window.right)
    {
     velocity.x *= -1;
    }
  }
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5, 25);
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
} 
