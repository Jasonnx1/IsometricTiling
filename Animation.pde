class Animation {

  int nFrame;
  int frame;
  int speed;
  
  float currenttime;
  float previoustime = 0;
  float deltatime;
  
  float timer;
  
  Animation(int nf)
  {
    nFrame = nf;
    frame = 0;
    speed = 100;
    timer = 0;    
  }
  
  
  
  void update()
  {
    currenttime = millis();
    deltatime = currenttime - previoustime;
    previoustime = currenttime;
    
    
    timer += deltatime;
    
    if(timer > speed)
    {
      timer = 0;
      frame++;
      if(frame >= nFrame)
      {
       
        frame = 0;
        
      }
      
    }
    
  }
  
  
  
}
