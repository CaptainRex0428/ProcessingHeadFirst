int counting = 0;
int fps = 200;

Particle a,b,c,d,e,f;

void setup() 
{
    size(1000, 600, JAVA2D);
    // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
    frameRate(fps);

    int tailNum = 100;

    a = new Particle(tailNum,new float2(100,100), new float2(1000,500), color(0,255,0),color(255,0,255),30,255,new float2(1000,600));
    b = new Particle(tailNum,new float2(200,100), new float2(-1000,300), color(255,100,0),color(10,255,255),30,255,new float2(1000,600));
    c = new Particle(tailNum,new float2(300,200), new float2(600,-400), color(0,255,0),color(255,0,0),30,255,new float2(1000,600));
    d = new Particle(tailNum,new float2(800,300), new float2(200,-1000), color(255,0,100),color(100,255,255),30,255,new float2(1000,600));
    e = new Particle(tailNum,new float2(600,300), new float2(300,-620), color(100,0,255),color(0,255,0),30,255,new float2(1000,600));
    f = new Particle(tailNum,new float2(500,500), new float2(620,-130), color(100,255,0),color(0,0,255),30,255,new float2(1000,600));

    noStroke();
}

void draw() 
{ 
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % fps;

    float detailedSec = (float)counting/fps;

    float2 pointa = new float2(mouseX,mouseY);

    a.move();
    b.move();
    c.move();
    d.move();
    e.move();
    f.move();

    // fill(30,20);
    // noStroke();
    // rect(0,0,width,height);

    background(30);

    a.draw();
    b.draw();
    c.draw();
    d.draw();
    e.draw();
    f.draw();

}