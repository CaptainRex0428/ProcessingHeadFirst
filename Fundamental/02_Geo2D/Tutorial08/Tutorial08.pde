int fps = 60;
int frameCounting = 0;

int rowNum = 5;
int columnNum = 10;
float rowHeight = 80.f;
float columnWidth = 100.f;
float startX = 100.f;
float startY = 100.f;

void drawTable(
    int rowNum,
    int columnNum,
    float rowHeight,
    float columnWidth,
    float startX,
    float startY,
    color strokeColor,
    color fillColor,
    boolean bFill)
{
    stroke(strokeColor);
    fill(fillColor);

    if (!bFill)
    {
        noFill();
    }

    for (int i = 0; i < columnNum+1; ++i)
    {
        line(startX+i*columnWidth,startY,startX+i*columnWidth,startY+rowHeight*rowNum);
    }

    for (int i = 0; i < rowNum+1; ++i)
    {
        line(startX,startY+i*rowHeight,startX+columnWidth*columnNum,startY+rowHeight*i);
    }
}

void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);

    drawTable( rowNum, columnNum, rowHeight, columnWidth, startX, startY, color(70,144,255), color(0,0,0), false);
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}



