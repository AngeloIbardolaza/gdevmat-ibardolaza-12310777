Walker[] matter = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  for (int i = 0; i < matter.length; i++)
  {
    float posX = random(-640, 640);
    float posY = random(-360, 360);
    float randMass = random(2, 20);

    matter[i] = new Walker();
    matter[i].position = new PVector(posX, posY);
    matter[i].mass = randMass;
    matter[i].scale = matter[i].mass * 10;
  }
}

void draw()
{
  background(255);

  for (int i = 0; i < matter.length; i++)
  {
    for (int j = 0; j < matter.length; j++)
    {
      if (i != j)
      {
        PVector force = matter[j].calculateAttraction(matter[i]);
        matter[i].applyForce(force);

        //smallMatter.applyForce(bigMatter.calculateAttraction(smallMatter));
        //bigMatter.applyForce(smallMatter.calculateAttraction(bigMatter));
      }
    }
  }

  for (Walker m : matter)
  {
    m.update();
    m.render();
  }
}
