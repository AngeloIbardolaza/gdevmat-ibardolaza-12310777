void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

Walker vectorWalker = new Walker();

void draw()
{
  // Flushes screen with white BG
  background(255);
  
  // Movement using vectors 
  vectorWalker.moveAndBounce();
   
 // Render Circle  
 fill(182, 52, 100);
 vectorWalker.render();
}
