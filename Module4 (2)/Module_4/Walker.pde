public class Walker
{
 public PVector position = new PVector(); 
 public PVector velocity = new PVector();
 public PVector acceleration = new PVector();
 //public float scale = 50;
 float randScale = random(50);
 
 public float velocityLimit = 10;
 
 public Walker()
 {
   float randX = random(-540, 540);
   float randY = random(-360, 360);
   
   position = new PVector(randX, randY);
 }
 
 public void update()
 {
   PVector mouse = mousePos();
   PVector direction = PVector.sub(mouse, this.position); 
   direction.normalize();
   
   this.acceleration = direction.mult(0.2);
   this.velocity.add(this.acceleration);
   this.velocity.limit(velocityLimit);
   this.position.add(this.velocity);
 }
 
 public void render()
 {
   //noStroke();
   circle(position.x, position.y, randScale);
 }
 
 public void checkEdges()
 {
  if (this.position.x > Window.right)
  {
    this.position.x = Window.left;
  }
   else if (this.position.x < Window.left)
  {
    this.position.x = Window.right;
  }
   else if (this.position.y > Window.top)
  {
    this.position.y = Window.bottom;
  }
   else if (this.position.y < Window.bottom)
  {
    this.position.y = Window.top;
  }
 }
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}
