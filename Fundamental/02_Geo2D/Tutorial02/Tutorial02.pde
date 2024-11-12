int fps = 60;
int frameCounting = 0;

float[][][] points = 
{
  {{50, 200}, {150, 100}, {250, 300}, {350, 100}},
  {{450, 200}, {550, 300}, {650, 150}, {750, 250}},
  {{800, 320}, {600, 420}, {410, 50}, {350, 820}}
};

void continuousCurve(float[][][] points, color InColor, float InStrokeWeight)
{
    stroke(InColor);
    strokeWeight(InStrokeWeight);
    strokeCap(ROUND);
    //SQUARE PROJECT
    noFill();

    // 使用多个 bezier()和curve() 函数连接曲线段
    for (int i = 0; i < points.length; ++i) 
    {
        
        if (i > 0)
        {
            println("DrawCurve");
            curve(points[i-1][2][0],points[i-1][2][1],
                  points[i-1][3][0],points[i-1][3][1],
                  points[i][0][0],points[i][0][1],
                  points[i][1][0],points[i][1][1]);
        }
        
        println("DrawBezeir");
        bezier(points[i][0][0], points[i][0][1], 
               points[i][1][0], points[i][1][1], 
               points[i][2][0], points[i][2][1], 
               points[i][3][0], points[i][3][1]);
   }
}

void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);
    

    continuousCurve(points,240,6);
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;

    
}
