class Player {
  
  
  float speed = 5;
  
  PVector dir;
  PVector pos;
  
  Player(float _x, float _y)
  {
    pos = new PVector(_x, _y);
    dir = new PVector(_x, _y);
  }
  
  void set(float a, float b)
  {
    dir = new PVector(a,b);    
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
    
    if((this.pos.x != this.dir.x) || (this.pos.y != this.dir.y)) {
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
    
  }
  
  void display()
  {
    
    
  fill(200, 200, 50);
  ellipse(pos.x, pos.y, 20, 20);
    
  }
  
  
}
