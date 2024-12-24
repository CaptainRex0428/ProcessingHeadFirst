class Particle
{
    private float2[] points;
    private float2 headPos;
    private int tailNum;

    private int headIdx;
    private int fullCount;

    private float2 bound;
    private float2 speed;

    private color colorHead;
    private color colorTail;
    private float initExtent;
    private float initOpacity;

    Particle(int tailNum)
    {
        this.tailNum = tailNum;
        points = new float2[this.tailNum];
        
        headIdx = -1;
        fullCount = 0;

        this.headPos = new float2(0,0);
        this.bound = new float2(-1,-1);
        this.speed = new float2(0,0);

        this.colorHead = color(255,0,0);
        this.colorTail = color(0,0,255);
        this.initExtent = 20;
        this.initOpacity = 100;
    }

    Particle(int tailNum, float2 InitPos, float2 speed, color colorHead, color colorTail, float initExtent, float initOpacity, float2 bound)
    {
        this.tailNum = tailNum;
        points = new float2[this.tailNum];
        
        headIdx = -1;
        fullCount = 0;
        
        this.headPos = InitPos;
        this.bound = bound;
        this.speed = speed;

        this.colorHead = colorHead;
        this.colorTail = colorTail;
        this.initExtent = initExtent;
        this.initOpacity = initOpacity;
    }

    private boolean isFull() 
    {
		return fullCount >= this.tailNum;
	}

    private boolean isEmpty() 
    {
		return this.headIdx == -1;
	}

    private void addQueue(float2 point) 
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

    private void drawCircle(float2 pos, float extent, color c, float opacity)
    {
        noStroke();
        fill(c, opacity);
        circle(pos.x, pos.y, extent);
    }

    public void move()
    {
        float2 frameSpeed = this.speed.divide(fps);

        float2 predictPoint = this.headPos.add(frameSpeed);
        float2 resultPoint = new float2();
        
        if (this.bound.x != -1 && (predictPoint.x < 0 || predictPoint.x > this.bound.x))
        {
            resultPoint.x = min(this.bound.x,max(0,predictPoint.x));
            this.speed.x *= -1;
        }
        else
        {
            resultPoint.x = predictPoint.x;
        }

        if ( this.bound.y != -1 && (predictPoint.y < 0 || predictPoint.y > this.bound.y))
        {
            resultPoint.y = min(this.bound.y,max(0,predictPoint.y));
            this.speed.y *= -1;
        }
        else
        {
            resultPoint.y = predictPoint.y;
        }

        this.addQueue(resultPoint);
    }

    public void move(float2 direct, float span)
    {
        
        float VLen = (float)Math.sqrt(direct.x * direct.x + direct.y * direct.y);
        float scale = span/VLen;

        float2 point = this.headPos.add(direct.multiply(scale));

        this.addQueue(point);
    }

    public void move(float2 point)
    {
        this.addQueue(point);
    }

    public void draw()
    {
        int max = this.isFull() ? this.tailNum : this.fullCount;
        int drawCount = 0;

        float scaleExSpan = this.initExtent / max;
        float scaleOpSpan = this.initOpacity / max;

        if (this.isFull())
        {
            for (int idx = headIdx+1; idx < tailNum; ++idx)
            {
                float extent = drawCount * scaleExSpan;
                float opacity = drawCount * scaleOpSpan;

                color c = lerpColor(this.colorTail,this.colorHead, drawCount /(float) max);
            
                this.drawCircle(points[idx],extent,c,opacity);

                ++drawCount;
            }
        }

        for (int idx = 0; idx <= headIdx; ++idx)
        {
            float extent = drawCount * scaleExSpan;
            float opacity = drawCount * scaleOpSpan;

            color c = lerpColor(colorTail,colorHead, drawCount /(float) max);
           
            this.drawCircle(points[idx],extent,c,opacity);
            
            ++drawCount;
        }

        // System.out.println(drawCount);
        
    }
}