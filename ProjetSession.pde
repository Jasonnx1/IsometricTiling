float currenttime, previoustime, deltatime;

Player player;

void setup()
{
  size(1080, 720, P2D);
  previoustime = 0;
  player = new Player();
}


void draw()
{
  currenttime = millis();
  deltatime = currenttime - previoustime;
  previoustime = currenttime;
  
  display();
  update();
  
}


void update()
{

  player.update(deltatime);
  
}


void display()
{
  background(0);
  player.display();
  
}



void keyPressed()
{
  
  player.keyPressed(key);
  
}

void keyReleased()
{
  
  player.keyReleased(key);
  
}
