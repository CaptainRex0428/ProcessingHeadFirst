float angleOffset = 0;
color[] palette = {#8A4FFF, #00FFD1, #FF00AA, #FFD700}; // 限定配色方案

void setup() {
  size(800, 800);
  background(0);
  colorMode(HSB, 360, 100, 100);
  noFill();
  frameRate(30);
  blendMode(ADD); // 使用叠加混合模式
}

void draw() {
  // 更慢的拖影效果
  fill(0, 20);
  noStroke();
  rect(0, 0, width, height);

  translate(width/2, height/2);
  angleOffset += 0.015; // 减慢全局旋转速度

  generateSpiralWaves(5);  // 新增螺旋波
  generateCurves(10);
  generateQuantumDots(50); // 新增量子点效果
  // generateCircles(8);
}

void generateCurves(int count) {
  for (int i = 0; i < count; i++) {
    float hue = (angleOffset*50 + i*30) % 360;
    float sat = map(sin(angleOffset), -1, 1, 70, 90);
    
    // 使用限定色板中的颜色
    color c = lerpColor(palette[i%palette.length], palette[(i+1)%palette.length], noise(angleOffset));
    stroke(c, 120);
    strokeWeight(map(noise(i, angleOffset), 0, 1, 0.5, 3));
    
    // 更复杂的贝塞尔曲线
    float x = cos(angleOffset + i) * 300;
    float y = sin(angleOffset + i*0.5) * 300;
    bezier(
      x, y,
      x + cos(angleOffset)*200, y + sin(angleOffset)*200,
      x + cos(angleOffset+PI/2)*200, y + sin(angleOffset+PI/2)*200,
      x + noise(angleOffset)*100, y + noise(angleOffset+100)*100
    );
  }
}

void generateCircles(int count) {
  for (int i = 0; i < count; i++) {
    float size = map(noise(i, angleOffset*0.2), 0, 1, 50, 300);
    color c = lerpColor(palette[i%palette.length], palette[(i+1)%palette.length], 0.5);
    
    stroke(c, 80);
    strokeWeight(map(sin(angleOffset + i), -1, 1, 1, 4));
    ellipse(
      cos(angleOffset + i*0.5) * 250,
      sin(angleOffset + i*0.5) * 250,
      size * 0.8,
      size * 0.8
    );
  }
}

// 新增螺旋波效果
void generateSpiralWaves(int count) {
  for (int i = 0; i < count; i++) {
    float spiralRadius = map(i, 0, count, 100, 400);
    float angle = angleOffset * 0.5 + i * 0.2;
    color c = palette[i%palette.length];
    
    stroke(c, 100);
    strokeWeight(1.5);
    beginShape();
    for (float t = 0; t < TWO_PI; t += 0.1) {
      float r = spiralRadius + 50 * sin(angle*2 + t*5);
      vertex(r * cos(t + angle), r * sin(t + angle));
    }
    endShape(CLOSE);
  }
}

// 新增量子点效果
void generateQuantumDots(int count) {
  for (int i = 0; i < count; i++) {
    float x = cos(angleOffset + i*0.1) * map(noise(i), 0, 1, 100, 400);
    float y = sin(angleOffset + i*0.1) * map(noise(i+100), 0, 1, 100, 400);
    color c = palette[i%palette.length];
    
    fill(c, 80);
    noStroke();
    ellipse(x, y, 3, 3);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (isLooping()) {
      noLoop();
    } else {
      loop();
    }
  }
}