int fps = 60;
int frameCounting = 0;

void drawDashPoint(float xStart, float yStart, float xEnd, float yEnd, float pointSpan, color InColor, float weight)
{
    stroke(InColor);
    strokeWeight(weight);
    strokeCap(ROUND);

    float fullLength = dist(xStart,yStart,xEnd,yEnd);
    float currentLength = 0;

    while (currentLength < fullLength) 
    {
        float drawX = xStart + (xEnd - xStart)*(currentLength/fullLength);
        float drawY = yStart + (yEnd - yStart)*(currentLength/fullLength);

        currentLength = dist(drawX,drawY,xStart,yStart) + pointSpan;

        point(drawX,drawY);
    }
}

void drawDashLine(float xStart, float yStart, float xEnd, float yEnd, float dashLength, float dashSpan, color InColor, float weight)
{
    stroke(InColor);
    strokeWeight(weight);
    strokeCap(ROUND);

    float fullLength = dist(xStart,yStart,xEnd,yEnd);
    float currentLength = 0;
    float nextPos = 0;

    while (currentLength < fullLength) 
    {
        currentLength = nextPos;

        float drawXStart = xStart + (xEnd - xStart)*(currentLength/fullLength);
        float drawYStart = yStart + (yEnd - yStart)*(currentLength/fullLength);

        currentLength += dashLength;

        float drawXEnd = xStart + (xEnd - xStart)*(currentLength/fullLength);
        float drawYEnd = yStart + (yEnd - yStart)*(currentLength/fullLength);


        nextPos = currentLength + dashSpan;

        line(drawXStart, drawYStart, drawXEnd, drawYEnd);
    }
}

void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);

    drawDashPoint(100, 100, 600, 200, 20, 240, 4);
    drawDashLine(100, 200, 600, 300, 10, 10, 240, 4);

}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}



