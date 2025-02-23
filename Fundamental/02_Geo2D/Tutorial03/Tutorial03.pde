int fps = 60;
int frameCounting = 0;

// float[] pointsA = {1,2,3,4};
// pointsA[0]; // 1
// pointsA[1]; // 2
// pointsA[2]; // 3
// pointsA[3]; // 4

// float[][] pointsB =  {{1, 2}, {3, 4}};
// pointsB[0]; // {1,2}
// pointsB[0][0]; // 1
// pointsB[0][1]; // 1
// pointsB[1]; // {3,4}
// pointsB[1][0]; // 3
// pointsB[1][1]; // 4

// float[][][] pointsC = {{{1,2},{3,4}},{{5,6},{7,8}}};
// pointsC[0]; // {{1,2},{3,4}}

// pointsC[0][0]; // {1,2}
// pointsC[0][0][0]; // 1
// pointsC[0][0][1]; // 2

// pointsC[0][1]; // {3,4}
// pointsC[0][1][0]; // 3
// pointsC[0][1][1]; // 4 

// pointsC[1]; // {{5,6},{7,8}}
// pointsC[1][0]; // {5,6}
// pointsC[1][1]; // {7,8}

float[][][] points = 
{
  {{50, 200}, {150, 100}, {600, 300}, {300, 400}},
  {{320, 200}, {550, 300}, {650, 150}, {750, 250}},
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

