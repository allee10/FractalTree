private double fractionLength = .6;
private int smallestBranch = 70;
private double branchAngle = .78;
private int counter = 0;
public void setup()
{
  size(400, 300);
  noLoop();
}
public void draw()
{
  background(255,205,205);
  stroke(255, 0, 0);
  line(200, 300, 200, 200);

  smallestBranch = (int)(smallestBranch * Math.pow(0.7, counter));

  drawBranches(200, 200, 80, 3*PI/2);  //will add later
}

public void mouseClicked() {
  if (counter < 4) {
    counter++;
    redraw();
  }
}

public void drawBranches(float x, float y, double branchLength, double angle)
{
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;

  float endX1 = (float)(x + (branchLength * Math.cos(angle1)));
  float endY1 = (float)(y + (branchLength * Math.sin(angle1)));
  float endX2 = (float)(x + (branchLength * Math.cos(angle2)));
  float endY2 = (float)(y + (branchLength * Math.sin(angle2)));

  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);

  if (branchLength <= smallestBranch)
    return;
  else {
    color(((int)Math.random()*255), ((int)Math.random()*255), ((int)Math.random()*255));
    drawBranches(endX1, endY1, branchLength * fractionLength, angle1);
    drawBranches(endX2, endY2, branchLength * fractionLength, angle2);
  }
}
