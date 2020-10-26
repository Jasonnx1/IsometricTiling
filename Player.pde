public class Player extends GraphicObject
{
  
  
  final int SPEED = 2;
  
  boolean keyUpPressed = false, 
          keyDownPressed = false, 
          keyRightPressed = false,
          keyLeftPressed = false;
          
          
  char keyUp = 'w', 
       keyDown = 's', 
       keyRight = 'd',
       keyLeft = 'a';
          
          
        
  
  
  
  Player()
  {
      loc = new PVector(width/2, height/2);
      vel = new PVector();
      acc = new PVector();  
  }
  
  void update(float deltatime)
  {
    
    if(keyUpPressed){ vel.y -= 1 * SPEED; }
    if(keyDownPressed){ vel.y += 1 * SPEED; }
    if(keyRightPressed){ vel.x += 1 * SPEED; }
    if(keyLeftPressed){ vel.x -= 1 * SPEED; }
    
    
    loc.add(vel);
    vel.mult(0);
    

  }
  
  void display()
  {
    
    fill(255);
    ellipse(loc.x, loc.y, 20,20);
    
  }
  
  
  void keyPressed(char k)
  {
    
    if(k == keyUp){ keyUpPressed = true; }
    if(k == keyDown){ keyDownPressed = true; }
    if(k == keyRight){ keyRightPressed = true; }
    if(k == keyLeft){ keyLeftPressed = true; }
 
  }
  
  
    void keyReleased(char k)
  {
    
    if(k == keyUp){ keyUpPressed = false; }
    if(k == keyDown){ keyDownPressed = false; }
    if(k == keyRight){ keyRightPressed = false; }
    if(k == keyLeft){ keyLeftPressed = false; }
 
  }
  
  
  
  
  
  
}
