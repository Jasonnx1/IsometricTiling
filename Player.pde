class Player {
  
  
  float speed = 5;
  
    
  boolean isMoving = false;
  
  SpriteSheet body;
  SpriteSheet head;
  SpriteSheet weapon;
  
  PImage currentBody;
  PImage currentHead;
  PImage currentWeapon;
  
  
  
  Animation animation;
  
  int direction = 0; // entre 0 et 7     0 = <-  {tourne sens horaire}
  
  PVector dir;
  PVector pos;
  
  Player(float _x, float _y)
  {
    pos = new PVector(_x, _y);
    dir = new PVector(_x, _y);
    
    body = new SpriteSheet("images/player/clothes.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    head = new SpriteSheet("images/player/male_head1.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    weapon = new SpriteSheet("images/player/staff.png", 4096,1024, 32, 8, 4096/32, 1024/8);
    
    currentBody = body.images.get(0);
    currentHead = head.images.get(0);
    currentWeapon = weapon.images.get(0);
    
    animation = new Animation(4);
    
  }
  
  void set(float a, float b)
  {
    dir = new PVector(a, b);    
  }
  
  void update()
  {
   
      
      move();
  
      if (isoToCart(pos.x, pos.y).get(0) >= 440) {
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
      }
    
  }
  
  void move()
  {
    
    
        
    isMoving = false;
     
    
    if((this.pos.x != this.dir.x) || (this.pos.y != this.dir.y)) {
      
       isMoving = true;   
     
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
    }
    
    if(isMoving)
    {
      
        animation.update();
        switch(direction)
        {
         case 0: currentBody = body.images.get(animation.frame*8 + 24);
                 currentHead = head.images.get(animation.frame*8 + 24);
                 currentWeapon = weapon.images.get(animation.frame*8 + 24);
         break;
          
        }
  
    } else  {
          
      currentBody = body.images.get(0);
      currentHead = head.images.get(0);
      currentWeapon = weapon.images.get(0);
          
     }
    
    
  }
  
  void display()
  {
    
    
  fill(200, 200, 50);
  imageMode(CENTER);
  image(currentBody, pos.x, pos.y - 27);
  image(currentHead, pos.x, pos.y - 27);
  image(currentWeapon, pos.x, pos.y - 27);
    
  }
  
  
}
