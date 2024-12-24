int counting = 0;
int fps = 60;

Particle p;
ParticleSystem ps;

void setup() 
{
  size(1000, 800, JAVA2D);
  background(30);
  frameRate(fps);

  p = new Particle(width/2,50,width,height-5,0.02);
  
  ps = new ParticleSystem(width/2,50,20,width,height-5);
}

void draw() 
{
  ++counting;
  int sec = counting/fps;
  int frameRest = counting % fps;

  float detailedSec = (float)counting/fps;

  p.update();

  // background(30,30,30,20);

  fill(30, 20);
  noStroke();
  rect(0, 0, width, height);

  p.display();

  ps.display();
}