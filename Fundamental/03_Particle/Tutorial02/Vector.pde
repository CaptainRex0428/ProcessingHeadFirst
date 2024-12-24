class float2
{
    float x, y;

    float2(){this.x = 0; this.y = 0;}

    float2(float x, float y){this.x = x; this.y = y;}

    float2 add(float2 other) 
    {
        return new float2(this.x + other.x, this.y + other.y);
    }

    float2 subtract(float2 other)
    {
        return new float2(this.x - other.x, this.y - other.y);
    }

    float2 multiply(float scalar) {
        return new float2(this.x * scalar, this.y * scalar);
    }

    float2 divide(float scalar) 
    {
        if (scalar == 0) 
        {
            throw new IllegalArgumentException("Cannot divide by zero.");
        }

        return new float2(this.x / scalar, this.y / scalar);
    }

    float dot(float2 other) 
    {
        return this.x * other.x + this.y * other.y;
    }

    public String toString() 
    {
        return "(" + this.x + ", " + this.y + ")";
    }


}