
int counting = 0;
int fps = 60;

int speed = -100;
int speedScale = 2;

int arrowNum = 4;
float arrowpos = 0;
float limitMin = -300;
color arrowColor;

float buttonX;
float buttonY;
float buttonSize = 20;

PImage pic;

void arrow(float posX, float posY, color customColor)
{
  fill(customColor);
  noStroke();

  push();//将当前的图形状态（包括样式和变换）保存到堆栈中。之后，你可以自由修改这些状态，而不会影响到其他图形。

  translate(posX,posY);
  rotate(PI/4);

  rect(0, -300, 100, 200);
  rect(0, -100, 300, 100);

  pop();// 用于将保存的图形状态从堆栈中取出并恢复。每次调用 push() 后，通常会对应一个 pop()，这样可以确保所有的状态都被正确恢复。
}

void button(float posX, float posY, float size, color customColor)
{
    fill(customColor);
    noStroke();

    ellipse(posX, posY, size,size);
}

float poslimit(float posIn,float posMin,float posMax)
{
    float span = posMax - posMin;

    if (posIn > posMax)
    {
        float distance = posIn - posMax;
        float redirect = ((distance / span)%1) * span;
        return redirect + posMin;
    } 

    if (posIn < posMin)
    {  
        float distance = posMin - posIn;
        float redirect = ((distance / span)%1) * span;
        return posMax - redirect;      
    }

    return posIn;
}

void setup() 
{
  size(900, 600, JAVA2D);
  // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
  
  frameRate(fps);

  pic = loadImage("pic.png");

  arrowColor = color(210,0,0);
  buttonX = width/2;
  buttonY = height -50;
}

void draw() 
{
  ++counting;
  int sec = counting/fps;
  int frameRest = counting % fps;

  float detailedSec = (float)counting/fps;

  background(10);

  float posSpan = (width - limitMin)/arrowNum;

  arrowpos += speed/frameRate;

  for (int idx = 0; idx < arrowNum; ++idx)
  {
    float pos = arrowpos + idx * posSpan;
    float limitPos = poslimit(pos,limitMin,width);
    arrow(limitPos,height/2, arrowColor);
  }

  image(pic,0,0,width,height);

  button(buttonX,buttonY,buttonSize,color(210,176,100));
}

void mousePressed()
{
    if (dist(mouseX,mouseY,buttonX,buttonY) < buttonSize)
    {
        speed *= speedScale * -1;
        arrowColor = color(0,210,0);
    }
}

void mouseReleased() 
{
       
    if (dist(mouseX,mouseY,buttonX,buttonY) < buttonSize)
    {
        speed /= speedScale * -1; 
        arrowColor = color(210,0,0);
    }
     
}