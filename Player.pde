class Player {
  
  
  float speed = 1.5;
  
  DIR direction = DIR.RIGHT;
  DIR last_direction = DIR.RIGHT;
    
  char keyUp = 'w';
  char keyDown = 's';
  char keyRight = 'd';
  char keyLeft = 'a';
  
  boolean keyUpIsPressed = false;
  boolean keyDownIsPressed = false;
  boolean keyRightIsPressed = false;
  boolean keyLeftIsPressed = false;
  
    
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
  
  Player(float _x, float _y)
  {
    pos = new PVector(_x, _y);
    dir = new PVector(0,0);
    
    body = new SpriteSheet("images/player/clothes.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    head = new SpriteSheet("images/player/male_head1.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    weapon = new SpriteSheet("images/player/shortsword.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    
    currentBody = body.images.get(0);
    currentHead = head.images.get(0);
    currentWeapon = weapon.images.get(0);
    
    animation = new Player_Animation();
    
  }
  
  void set(float a, float b)
  {
    pos = new PVector(a, b);    
  }
  
  void update()
  {
   
      
      move();
  
     /* if (isoToCart(pos.x, pos.y).get(0) >= 440) {
        set(pos.x, pos.y);
      }
      if (isoToCart(pos.x, pos.y).get(0) <= 0) {
        set(pos.x, pos.y);
      }
      if (isoToCart(pos.x, pos.y).get(1) >= 440) {
        set(pos.x, pos.y);
      }
      if (isoToCart(pos.x, pos.y).get(1) <= 0) {
        set(pos.x, pos.y);
      }*/
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
    
    directionCalc = 0;
    
    boolean tempKeyUp = keyUpIsPressed;
    boolean tempKeyDown = keyDownIsPressed;
    boolean tempKeyRight = keyRightIsPressed;
    boolean tempKeyLeft = keyLeftIsPressed;
    
    if(tempKeyUp && tempKeyDown)
    {
      tempKeyUp = false;
      tempKeyDown = false;
    }
    
    if(tempKeyRight && tempKeyLeft)
    {     
      tempKeyRight = false;
      tempKeyLeft = false;      
    }
    

    if(tempKeyUp)
    {
      
      
      if(isoToCart(pos.x, pos.y).get(1) >= 0)
      if(isoToCart(pos.x, pos.y).get(0) >= 0)
      {        
        
        PVector p = pos.copy();
        p.y -= 0.5*speed + 10;
        Tile t = worldMap.getCell(p);
        
        
        if(t != null)
        {
          if(t.isCollidable == false)
          {
            dir.y -= 0.5 * speed;              
          }

        }
        else
        {
          
         
          p.y -= 0.5*speed;
          t = worldMap.getCell(p);
          if(t != null)
          {
            if(t.isCollidable == false)
            {
              dir.y -= 0.5 * speed;              
            }
  
          }
          
        }

        
            
      }
      
          
      
      
      directionCalc += 1;
    }
    
    if(tempKeyDown)
    {
      if(isoToCart(pos.x, pos.y).get(1) <= 440)
      if(isoToCart(pos.x, pos.y).get(0) <= 440)
      {
        
        PVector p = pos.copy();
        p.y += 0.5*speed + 10;
        Tile t = worldMap.getCell(p);
        
        
        if(t != null)
        {
          if(t.isCollidable == false)
          {
            dir.y += 0.5 * speed;              
          }

        }
        else
        {
          p.y += 0.5*speed;
          t = worldMap.getCell(p);
          if(t != null)
          {
            if(t.isCollidable == false)
            {
              dir.y += 0.5 * speed;              
            }
  
          }   
        }
      }
      
      
      directionCalc += 5;
    }
    
    if(tempKeyRight)
    {      
      if(isoToCart(pos.x, pos.y).get(0) <= 440)
      if(isoToCart(pos.x, pos.y).get(1) >= 0)
      {
        
        PVector p = pos.copy();
        p.x += 1*speed + 10;
        Tile t = worldMap.getCell(p);
        
        
        if(t != null)
        {
          if(t.isCollidable == false)
          {
            dir.x += 1 * speed;              
          }

        }
        else
        {
          p.x += 1*speed;
          t = worldMap.getCell(p);
          if(t != null)
          {
            if(t.isCollidable == false)
            {
              dir.x += 1 * speed;              
            }
  
          }  
        }
      }
     
       
      directionCalc += 10;
    }
     
    if(tempKeyLeft)
    {
     if(isoToCart(pos.x, pos.y).get(0) >= 0)
     if(isoToCart(pos.x, pos.y).get(1) <= 440)
     {
       
       PVector p = pos.copy();
       p.x -= 1*speed + 10;
       Tile t = worldMap.getCell(p);
        
        
        if(t != null)
        {
          if(t.isCollidable == false)
          {
            dir.x -= 1 * speed;              
          }

        }
        else
        {
          p.x -= 1*speed;
          t = worldMap.getCell(p);
          if(t != null)
          {
            if(t.isCollidable == false)
            {
              dir.x -= 1 * speed;              
            }
  
          }  
        } 
     }
   
      directionCalc += 20;
    }
    
    if(direction != DIR.STAND)
    last_direction = direction;
    
    switch(directionCalc)
    {
      case 1: direction = DIR.UP; animation.current_animation = animation.run;
      break;
      case 5: direction = DIR.DOWN; animation.current_animation = animation.run;
      break;
      case 10: direction = DIR.RIGHT; animation.current_animation = animation.run;
      break;
      case 20: direction = DIR.LEFT; animation.current_animation = animation.run;
      break;
      case 11: direction = DIR.UPRIGHT; animation.current_animation = animation.run;
      break;
      case 21: direction = DIR.UPLEFT; animation.current_animation = animation.run;
      break;
      case 15: direction = DIR.DOWNRIGHT; animation.current_animation = animation.run;
      break;
      case 25: direction = DIR.DOWNLEFT; animation.current_animation = animation.run;
      break;
      default: direction = DIR.STAND; animation.current_animation = animation.stand;
      break;
    }
  
   // println(direction);
   
        
    /*if((this.pos.x != this.dir.x) || (this.pos.y != this.dir.y)) { 
     
      if (this.pos.x - this.dir.x <= 2 && this.pos.y - this.dir.y <= 2 && -2 <= this.pos.x - this.dir.x && -2 <= this.pos.y - this.dir.y) {
        this.pos.x = this.dir.x;
        this.pos.y = this.pos.y;
      } else {
        PVector movementVect = new PVector(
         this.dir.x - this.pos.x,
         this.dir.y - this.pos.y
      );
      
      PVector vectorDir = new PVector(
         movementVect.x / (sqrt(sq(movementVect.x) + sq(movementVect.y))),
         movementVect.y / (sqrt(sq(movementVect.x) + sq(movementVect.y)))
      );

      this.pos.x = round(this.pos.x + vectorDir.x * this.speed);
      this.pos.y = round(this.pos.y + vectorDir.y * this.speed);  
      }      
    }*/

    
    
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
  
  
  void keyPressed(char k)
  {
    
      if(k == keyUp)
      {
          keyUpIsPressed = true;
      }
      
      if(k == keyDown)
      {
          keyDownIsPressed = true;
      }
      
      if(k == keyRight)
      {
          keyRightIsPressed = true;
      }
      
      if(k == keyLeft)
      {
          keyLeftIsPressed = true;
      }
  
  }
  
  void keyReleased(char k)
  {
    
      if(k == keyUp)
      {
          keyUpIsPressed = false;
      }
      
      if(k == keyDown)
      {
          keyDownIsPressed = false;
      }
      
      if(k == keyRight)
      {
          keyRightIsPressed = false;
      }
      
      if(k == keyLeft)
      {
          keyLeftIsPressed = false;
      }
    
    
  }
  
  
}
