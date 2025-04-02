Walker[] walker = new Walker[8];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);  
  
  //heavyWalker.position.y = -50;
  
  for (int i = 0; i < walker.length; i++) 
  {
    int size = 10 - i;
    int posY = 0;
    
    walker[i] = new Walker();
    walker[i].mass = size;
    walker[i].ballsSize = walker[i].mass * 15;
    posY = 2 * (Window.windowHeight / 8)  * (i - 3);
    walker[i].position = new PVector(-450, posY);
  }
}

//Walker heavyWalker = new Walker();
//PVector wind = new PVector(0.15, 0);

void draw()
{
  background(80);
  
  for (int i = 0; i < walker.length; i++)
  {
    float mew = 0.01f;
    
    if (walker[i].position.x >= 0)
    {
      mew = 0.4f;
    }
    
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = walker[i].velocity.copy();
    friction.mult(-1); 
    friction.normalize();
    friction.mult(frictionMagnitude);
    walker[i].applyForce(friction);
    
    walker[i].render();
    walker[i].update();
    //walker[i].applyForce(wind);
    //PVector gravity = new PVector(0, -0.15 * walker[i].mass);
    PVector acceleration = new PVector(0.2, 0);
    walker[i].applyForce(acceleration);
  
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
  
  mouseClicked();
}

void mousePressed() {
    setup();
}
