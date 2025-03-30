class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  
  void render()
  {
    circle(position.x, position.y, 30);
  }
  
  void moveAndBounce()
  {
    position.x += speed.x;
    position.y += speed.y;
    
  
   // Boucning
   if ((position.x > Window.right) || (position.x < Window.left))
   {
     speed.x *= -1;
   }
 
   if ((position.y > Window.top) || (position.y < Window.bottom))
   {
     speed.y *= -1;
   }
 }
}
