class Animation {

  int nFrame;
  int frame;
  int speed;
  boolean inc = true;
 
  
  float currenttime;
  float previoustime = 0;
  float deltatime;
  
  float timer;
  
  Animation(int nf)
  {
    nFrame = nf;
    frame = 0;
    speed = 150;
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
      if(frame >= nFrame - 1)
      {
       
        frame = 0;
        
      }
      
    }
    
  }
  
  void updateStand()
  {
    
    currenttime = millis();
    deltatime = currenttime - previoustime;
    previoustime = currenttime;
    
    
    timer += deltatime;
    
    if(timer > speed)
    {
      timer = 0;  
      
      
      if(inc) {
       frame++;
      } else {
       frame--;        
      }
      
      
      if(frame >= nFrame - 1)
      {
        inc = !inc;        
      }
      
      if(frame <= 0 && inc == false)
      {        
        inc = !inc;        
      }
      
    }

  }
  
  
  
}
