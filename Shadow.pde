class Shadow extends Ennemy implements IDrawable{
  
  float speed = 1.5;  
  DIR direction = DIR.RIGHT;
  DIR last_direction = DIR.RIGHT;
   
  SpriteSheet body;
  SpriteSheet head;
  SpriteSheet weapon;
  
  PImage currentBody;
  PImage currentHead;
  PImage currentWeapon;
  
  Player_Animation animation;
  
  int directionCalc = 0; // entre 0 et 7     0 = <-  {tourne sens horaire}
  
  PVector dir;
  PVector pos;
  
  Shadow(float _x, float _y)
  {
    pos = new PVector(_x, _y);
    dir = new PVector(0,0);
    
    body = new SpriteSheet("images/player/steel_armor.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    head = new SpriteSheet("images/player/male_head1.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    weapon = new SpriteSheet("images/player/staff.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    
    currentBody = body.images.get(0);
    currentHead = head.images.get(0);
    currentWeapon = weapon.images.get(0);
    
    animation = new Player_Animation();
    
  }
  
  void set(float a, float b)
  {
    pos = new PVector(a, b);    
  }    
  
  public float getY()
  {
    return pos.y;   
  }
  
  void update()
  {
   
 
      move();
  
      animation.update();

      
      if(direction == DIR.STAND)
      {
        
          switch(last_direction)
          {
            case UP:            currentBody = body.images.get(2 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(2 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(2 + (animation.current_animation.frame * 8));
            break;
            
            
            case DOWN:            currentBody = body.images.get(6 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(6 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(6 + (animation.current_animation.frame * 8));
            break;
            
            
            case RIGHT:              currentBody = body.images.get(4 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(4 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(4 + (animation.current_animation.frame * 8));
            break;
            
            
            case LEFT:                currentBody = body.images.get(0 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(0 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(0 + (animation.current_animation.frame * 8));
            break;
            
            
            case UPRIGHT:             currentBody = body.images.get(3 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(3 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(3 + (animation.current_animation.frame * 8));
            break;
            
            
            case UPLEFT:              currentBody = body.images.get(1 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(1 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(1 + (animation.current_animation.frame * 8));
            break;
            
            
            case DOWNLEFT:             currentBody = body.images.get(7 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(7 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(7 + (animation.current_animation.frame * 8));
            break;
            
            
            case DOWNRIGHT:              currentBody = body.images.get(5 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(5 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(5 + (animation.current_animation.frame * 8));
            break;    
            
            
          }

      }
      
      if(direction != DIR.STAND)
      {
        switch(direction)
          {
            
            case UP:            currentBody = body.images.get(34 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(34 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(34 + (animation.current_animation.frame * 8));
            break;
            
            
            case DOWN:          currentBody = body.images.get(38 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(38 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(38 + (animation.current_animation.frame * 8));
            break;
            
            
            case RIGHT:         currentBody = body.images.get(36 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(36 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(36 + (animation.current_animation.frame * 8));
            break;
            
            
            case LEFT:          currentBody = body.images.get(32 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(32 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(32 + (animation.current_animation.frame * 8));
            break;
            
            
            case UPRIGHT:       currentBody = body.images.get(35 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(35 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(35 + (animation.current_animation.frame * 8));
            break;
            
            
            case UPLEFT:        currentBody = body.images.get(33 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(33 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(33 + (animation.current_animation.frame * 8));
            break;
            
            
            case DOWNLEFT:      currentBody = body.images.get(39 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(39 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(39 + (animation.current_animation.frame * 8));
            break;
            
            
            case DOWNRIGHT:     currentBody = body.images.get(37 + (animation.current_animation.frame * 8));
                                currentHead = head.images.get(37 + (animation.current_animation.frame * 8));
                                currentWeapon = weapon.images.get(37 + (animation.current_animation.frame * 8));
            break;        
          }
        
        
      }
    

        
      pos.add(dir);
      dir.mult(0);
      
    
  }
  
  void move()
  {
    
  }
  
  
  void display()
  {
    

  imageMode(CENTER);
  image(currentBody, pos.x, pos.y - 27);
  image(currentHead, pos.x, pos.y - 27);
  image(currentWeapon, pos.x, pos.y - 27);
  //fill(255,0,0,100);
  //ellipse(pos.x, pos.y, 20,20);

    
  }
  
  
  
}


  
  
