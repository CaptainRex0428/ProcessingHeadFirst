int counting = 0;
int fps = 200;

class Particle
{
    private float[][] points;
    private float[] headPos;
    private int tailNum;

    private int headIdx;
    private int fullCount;

    Particle(int tailNum, float[] headPos)
    {
        this.tailNum = tailNum;
        points = new float[this.tailNum][2];
        this.headPos = headPos;
        headIdx = -1;
        fullCount = 0;

    }

    private boolean isFull() 
    {
		return fullCount >= this.tailNum;
	}

    private boolean isEmpty() 
    {
		return this.headIdx == -1;
	}

    private void addQueue(float[] point) 
    {
        if (!this.isFull())
        {
            fullCount++;
        }

        this.headIdx += 1;
        this.headIdx = this.headIdx % this.tailNum;

        this.points[this.headIdx] = point;
        this.headPos = point;
	}

    public void move(float[] direct, float span)
    {
        
        float VLen = (float)Math.sqrt(direct[0] * direct[0] + direct[1] * direct[1]);
        float scale = span/VLen;
        
        float[] Direct = new float[2];
        

        Direct[0] = direct[0]*scale;
        Direct[1] = direct[1]*scale;

        float[] point = new float[2];
        point[0] = this.headPos[0] + Direct[0];
        point[1] = this.headPos[1] + Direct[1];

        this.addQueue(point);
    }

    private void drawCircle(float[] pos, float extent, color c, float opacity)
    {
        noStroke();
        fill(c, opacity);
        circle(pos[0], pos[1], extent);
    }

    public void move(float[] point)
    {
        this.addQueue(point);
    }

    public void draw()
    {
        int max = this.isFull() ? this.tailNum : this.fullCount;
        int drawCount = 0;
        float initExtent = 50;
        float initOpacity = 60;
        float scaleExSpan = initExtent / max;
        float scaleOpSpan = initExtent / max;

        color colorHead = color(255,0,0);
        color colorTail = color(0,0,255);

        if (this.isFull())
        {
            for (int idx = headIdx+1; idx < tailNum; ++idx)
            {
                float extent = drawCount * scaleExSpan;
                float opacity = drawCount * scaleOpSpan;

                color c = lerpColor(colorTail,colorHead, drawCount /(float) max);
                // System.out.format("(%f,%f)",points[idx][0],points[idx][1]);
                this.drawCircle(points[idx],extent,c,opacity);

                ++drawCount;
            }
        }

        for (int idx = 0; idx <= headIdx; ++idx)
        {
            float extent = drawCount * scaleExSpan;
            float opacity = drawCount * scaleOpSpan;

            color c = lerpColor(colorTail,colorHead, drawCount /(float) max);
            // System.out.format("(%f,%f)",points[idx][0],points[idx][1]);
            this.drawCircle(points[idx],extent,c,opacity);
            
            ++drawCount;
        }

        // System.out.print("\n");
        
    }
}

Particle a;

void setup() 
{
    size(1000, 600, JAVA2D);
    // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
    frameRate(fps);
    
    a = new Particle(100,new float[]{200.f,200.f});

    noStroke();
}

void draw() 
{ 
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % fps;

    float detailedSec = (float)counting/fps;

    float[] pointa = new float[]{mouseX,mouseY};

    a.move(pointa);
    background(30);
    a.draw();

}