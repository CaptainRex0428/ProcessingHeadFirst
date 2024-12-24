class ParticleSystem
{
    float rootX, rootY;
    ArrayList<Particle> Particles = new ArrayList<Particle>();
    
    ParticleSystem(float posX, float posY, int particleCount, float boundX, float boundY)
    {
        this.rootX = posX;
        this.rootY = posY;

        for (int idx = 0 ; idx < particleCount; ++idx)
        {
            Particle p = new Particle(posX , posY, boundX, boundY, 0.02);
            p.size = lerp(5,12,random(1));
            
            color a = color(255,255,0);
            color b = color(100,120,255);
            p.c = lerpColor(a, b, random(1));
            
            p.velX = lerp(-8,12,random(1));
            p.velY = lerp(-12,8,random(1));
            Particles.add(p);
        }
    }

    void display()
    {
        for (Particle p : Particles)
        {
            p.update();
            p.display();
        }
    }
}