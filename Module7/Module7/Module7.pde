Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] myWalker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < myWalker.length; i++) 
  {
    int size = 10 - i;
    int posX = 0;
    
    myWalker[i] = new Walker();
    posX = 2 * (Window.windowWidth / 10)  * (i - 4);
    myWalker[i].position = new PVector(posX, 300);
    myWalker[i].mass = size;
    myWalker[i].scale = myWalker[i].mass * 10;
  }
}

PVector wind = new PVector(0.1, 0);

void draw()
{
  background(255);

  ocean.render();
  
  for (Walker w : myWalker)
  {
    w.update();
    w.render();

    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);
    w.applyForce(wind);

    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    //F =  -uNv

    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));

    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
