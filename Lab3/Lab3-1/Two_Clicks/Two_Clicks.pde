//First to second click.
//Keenan McEntee
PVector mouseClickOne;
PVector mouseClickTwo;
void setup()
{
  mouseClickOne = null;
  mouseClickTwo = null;
}

void draw()
{
  background(255);
  if (mouseClickTwo != null)
    line (mouseClickOne.x,mouseClickOne.y,mouseClickTwo.x,mouseClickTwo.y);
  
}

void mouseClicked()
{
 if (mouseClickOne == null)
 {
  mouseClickOne =  new PVector(mouseX,mouseY);
 }
 else
 {
  mouseClickTwo = new PVector(mouseX,mouseY); 
  
  mouseClickTwo.sub(mouseClickOne);
  mouseClickOne = new PVector(0,0);
 }
  
}