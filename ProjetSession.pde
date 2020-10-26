float currenttime, previoustime, deltatime;


void setup()
{
  size(1080, 720, P2D);
  previoustime = 0;
}


void draw()
{
  
  display();
  update();
  
}


void update()
{
  currenttime = millis();
  deltatime = currenttime - previoustime;
  previoustime = currenttime;
  
}


void display()
{
  
  
}
