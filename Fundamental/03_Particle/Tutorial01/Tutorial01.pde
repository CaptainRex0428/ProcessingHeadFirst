int counting = 0;
int fps = 60;

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

    public boolean isFull() {
		return fullCount >= this.tailNum;
	}

    public boolean isEmpty() {
		return this.headIdx == -1;
	}

    public void addQueue(float[] point) 
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

    public void draw()
    {

    }
}

void setup() 
{
    size(1000, 600, JAVA2D);
    // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
    frameRate(fps);

    noStroke();
}

void draw() 
{ 
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % fps;

    float detailedSec = (float)counting/fps;




}