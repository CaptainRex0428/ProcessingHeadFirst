class Particle
{
    float posX, posY;
    float velX, velY;
    float accX, accY;
    float size;

    float damping;

    color c;
    float opacity;

    float boundX, boundY;

    Particle(float posX, float posY, float boundX, float boundY, float damping)
    {
        this.posX = posX;
        this.posY = posY;

        this.c = color(255);
        this.opacity = 255;
        this.size = 10;

        this.accY = 0.98;
        this.velX = 10;

        this.boundX = boundX;
        this.boundY = boundY;

        this.damping = min(0.5,max(0,damping));
    }

    void update()
    {
        this.velX += this.accX;
        this.velY += this.accY;
        this.posX += this.velX;
        this.posY += this.velY;

        this.velX *= max(0,(1-random(this.damping)));
        this.velY *= max(0,(1-random(this.damping)));

        if (this.boundX != -1 && (this.posX < 0 || this.posX > this.boundX))
        {
            this.posX = max(0,min(this.boundX,this.posX));
            this.velX *= -1;
        }

        if (this.boundY != -1 && (this.posY < 0 || this.posY > this.boundY))
        {
            this.posY = max(0,min(this.boundY,this.posY));
            this.velY *= -1;
        }
    }

    void display()
    {
        noStroke();
        fill(this.c,this.opacity);
        circle(this.posX,this.posY,this.size);
    }

}