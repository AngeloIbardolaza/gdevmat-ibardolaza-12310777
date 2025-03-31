Walker myWalker = new Walker();

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);  
  
  //myWalker.velocity = new PVector(-5, 8);
  //myWalker.acceleration = new PVector(-0.01, 0.1);
  
}

void draw()
{
  background(80);
  
  myWalker.update();
  myWalker.render();
  myWalker.checkEdges();
}
