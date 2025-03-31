Walker[] matter = new Walker[150];
PVector holePosition;
PVector mouse = mousePos();

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
  background(0);

  for (int i = 0; i < matter.length; i++) {
    matter[i] = new Walker();
  }
  
  float randX = random(-540, 540);
  float randY = random(-360, 360);
  holePosition = new PVector(randX, randY);
  
}

void draw()
{
  background(0);
  mouse.normalize().mult(200);
  
  
  for (int i = 0; i < matter.length; i++) {
    matter[i].direction = PVector.sub(holePosition, matter[i].position);
    matter[i].direction.normalize();
    
    matter[i].velocity = new PVector(0.2, 0.2);
    matter[i].acceleration = new PVector(0.1, 0.1);
    matter[i].velocity.add(matter[i].acceleration);
    matter[i].velocity.add(matter[i].direction);
    matter[i].velocity.limit(matter[i].velocityLimit);
    
    matter[i].position.add(matter[i].velocity);
    matter[i].render();
  }

  blackHole();
  
  int frameLimit = 300;

  if (frameCount % frameLimit == 0)
  {
    background(0);
  }
}

void blackHole()
{
  holePosition.set(mouseX - Window.windowWidth, -(mouseY - Window.windowHeight));
  fill(255);
  circle(holePosition.x, holePosition.y, 50);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}
