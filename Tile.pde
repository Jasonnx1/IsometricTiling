class Tile {
  PVector pos;
  ArrayList<PImage> images;
  int code;
  int codeObject;
  boolean isCollidable;
  
    Tile(PVector _pos, PImage _image, int _code)
    {
        pos = _pos;
        images = new ArrayList<PImage>();
        images.add(_image); 
        code = _code;
        
        
        
        if(code == 6)
        isCollidable = true;
        else
        isCollidable = false;
        

    }
  
  
    void display()
    {
      
  
        imageMode(CENTER); 
        image(images.get(0), cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1) + 20);
        
       
        
        if(state == 2)
        {
          fill(0,0,0,0);
          beginShape();
            vertex(cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1));
            vertex(cartToIso(pos.x+40, pos.y).get(0), cartToIso(pos.x+40, pos.y).get(1));
            vertex(cartToIso(pos.x+40, pos.y+40).get(0), cartToIso(pos.x+40, pos.y+40).get(1));
            vertex(cartToIso(pos.x, pos.y+40).get(0), cartToIso(pos.x, pos.y+40).get(1));
          endShape(CLOSE);
        }
   
    }
    
    void displayObject()
    {
      try
      {
      if(images.get(1) != null)
      {
        imageMode(CENTER); 
        image(images.get(1), cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1));        
      }
      }catch(Exception e){}
            
    }
    
    
    
    
    
    
    
  
}
