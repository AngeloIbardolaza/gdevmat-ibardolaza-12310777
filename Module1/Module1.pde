int time = 10000;
float freq = 20.;
float amp = 100.;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);

  //circle(0, 0, 50);

  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawCircle();
  drawLinearFunction2();
  drawSinWave();
  
  time += 5;
}

void drawCartesianPlane()
{
  strokeWeight(5);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(0, -300, 0, 300);
  line(-300, 0, 300, 0);

  // Cartesian Plane Lines
  for (int i = -300; i <= 300; i = i + 50)
  {
    line( i, -20, i, 20);
    line( -20, i, 20, i);
  }
}

void drawLinearFunction()
{
  // f(4) = x + 2;

  color red = color(255, 0, 0);
  fill(red);
  noStroke();

  for (int x = -300; x <= 300; x++)
  {
    circle(x, x + 2, 5);
  }
}

void drawQuadraticFunction() // Parabola
{
  color green = color(0, 255, 0);
  fill(green);
  stroke(green);

  for (float x = -300; x <= 300; x += 0.1f)
  {
    // Math.pow(x, 2) == (x * x) == x^2
    // Math.pow(x, 2) + (x * 2) - 5 == f(x) = x^2 + 2x - 5
    circle(x * 10, ((float)Math.pow(x, 2) + (x * 2) - 5), 5);
  }
}

void drawCircle()
  // 1. f(x) = x^2 - 15x - 3
{
  color yellow = color(255, 255, 0);
  noFill();
  stroke(yellow);
  //float radius = 50;

  for (int x = 0; x < 1; x++)
  {
    circle(x * 10, (x * x) + (x * 15) - 3, 200);
  }
}

void drawLinearFunction2()
  // 2. f(x) = -5x + 30
{
  color purple = color(255, 0, 255);
  fill(purple);
  stroke(purple);

  for (int x = -250; x < 250; x++)
  {
    circle(x, (x * -5) + 30, 5);
  }
}

void drawSinWave()
{
  color navyBlue = color(0, 0, 128);
  fill(navyBlue);
  stroke(navyBlue);
  for (int x = -300; x <= 300; x++)
  {
    circle(x * 1.5, amp * ((float)Math.sin((x + time)/freq)), 5);
  }
  
  keyPressed();
}

void keyPressed()
{
 if (key == CODED) 
 {
   if (keyCode == RIGHT) 
   {
     freq = 50.;
   }
   else if (keyCode == LEFT) 
   {
     freq = 20.;
   }
   else if (keyCode == UP) 
   {
     amp = 130.;
   }
   else if (keyCode == DOWN) 
   {
     amp = 100.;
   }
 }
}
