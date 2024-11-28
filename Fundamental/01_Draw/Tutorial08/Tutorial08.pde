float angle = 0;  // 初始角度
float amplitude = 100;  // 正弦波振幅
float frequency = 0.05;  // 正弦波频率
int waveLength = 500;  // 波形宽度（单位：像素）
int xPos = 0;  // 当前绘制的 x 坐标位置

float[][] CoordArray = new float[0][2];

void setup() {
  size(1200, 800);  // 设置画布大小
  frameRate(60);   // 设置帧率为 30，控制绘制速度
}

void draw() 
{
  // 计算当前的 y 值
  float y = amplitude * sin(frequency * xPos);
  CoordArray =  (float[][])append(CoordArray, new float[] {xPos, y});
  xPos++;
  
  background(30);
  noFill();
  stroke(255);
  strokeWeight(2);

  beginShape();
  
  for(int i = 0; i < CoordArray.length; ++i)
  {
    curveVertex(CoordArray[i][0], CoordArray[i][1] + 400);
  }

  endShape();

}