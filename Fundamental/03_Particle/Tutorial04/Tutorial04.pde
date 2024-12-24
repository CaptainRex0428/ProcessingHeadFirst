int counting = 0;
int fps = 60;

ArrayList<ParticleSystem> PSList = new ArrayList<ParticleSystem>();

void setup() 
{
  size(1000, 800, JAVA2D);
  background(30);
  frameRate(fps);
}

void draw() 
{
  ++counting;
  int sec = counting/fps;
  int frameRest = counting % fps;

  float detailedSec = (float)counting/fps;

  fill(30, 20);
  noStroke();
  rect(0, 0, width, height);

  for(ParticleSystem ps : PSList)
  {
    ps.display();
  }
}

void mousePressed()
{
  ParticleSystem ps = new ParticleSystem(mouseX,mouseY,20,width,height-5);
  PSList.add(ps);
}