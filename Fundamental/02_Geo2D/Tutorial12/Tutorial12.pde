int fps = 60;
int frameCounting = 0;

int patternNum = 8;
float extern = 280.f;
float intern = 180.f;

void setup() 
{
    size(1200, 600, JAVA2D);
    background(30);
    frameRate(fps);
    
    
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;

    stroke(255);
    strokeWeight(10);
    noFill();

    background(30);

    push();

    translate(width/2, height/2);
    beginShape();
    
    for (int i = 0; i < patternNum * 2 + 3; ++i)
    {
        float angle = i * TWO_PI / (patternNum*2);

        if (i % 2 == 0)
        {
            float x = intern * cos(angle + timer * 0.2);
            float y = intern * sin(angle + timer * 0.2);
            curveVertex(x,y);
            continue;            
        }
        
        float x = extern * cos(angle - timer);
        float y = extern * sin(angle - timer);
        curveVertex(x,y);
    }

    endShape(CLOSE);

    pop();
}
