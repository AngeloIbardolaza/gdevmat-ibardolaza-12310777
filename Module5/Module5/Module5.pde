Walker[] walker = new Walker[10];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);  
  
  //heavyWalker.position.y = -50;
  
  for (int i = 0; i < walker.length; i++) 
  {
    int size = 10 - i;
    
    walker[i] = new Walker();
    walker[i].mass = size;
    walker[i].ballsSize = walker[i].mass * 15;
    walker[i].position = new PVector(-500, 200);
  }
}

//Walker heavyWalker = new Walker();
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void draw()
{
  background(80);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].render();
    walker[i].update();
    walker[i].applyForce(wind);
    walker[i].applyForce(gravity);
  
    if (walker[i].position.y < Window.bottom)
    {
      walker[i].velocity.y *= -1;
    }
    else if (walker[i].position.y > Window.top)
    {
      walker[i].velocity.y *= -1;
    }
    else if (walker[i].position.x < Window.left)
    {
     walker[i].velocity.x *= -1;
    }
    else if (walker[i].position.x > Window.right)
    {
     walker[i].velocity.x *= -1;
    }
  }
  
  
  //heavyWalker.update();
  //heavyWalker.render();
  //heavyWalker.applyForce(wind);
  
}
