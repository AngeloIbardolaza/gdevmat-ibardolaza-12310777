Walker[] myWalker = new Walker[100];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);  
  
  for (int i = 0; i < myWalker.length; i++) {
    myWalker[i] = new Walker();
  }
  
  //myWalker.velocity = new PVector(-5, 8);
  //myWalker.acceleration = new PVector(-0.01, 0.1);
  
}

void draw()
{
  background(80);
  
  for (int i = 0; i < myWalker.length; i++) 
  {
    myWalker[i].update();
    myWalker[i].render();
    myWalker[i].checkEdges();
  }
}
