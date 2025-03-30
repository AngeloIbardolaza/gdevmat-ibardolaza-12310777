void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  PVector mouse = mousePos();
  mouse.normalize().mult(200);

  // Outer Glow Effect
  strokeWeight(10);
  stroke(206, 74, 62);

  line(0, 0, mouse.x, mouse.y);
  println("magnitude: " + mouse.mag());
  line(0, 0, -mouse.x - 5, -mouse.y); // -5 to straighten

  // Inner Glow / Saber Beam
  strokeWeight(5);
  stroke(219, 205, 192);

  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x - 5, -mouse.y);
  
  // Black Handle
  strokeWeight(7.5f);
  stroke(0);
  mouse.normalize().mult(40);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
}
