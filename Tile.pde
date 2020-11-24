class Tile implements IDrawable {
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
    
    
    public float getY()
    {
       return cartToIso(pos.x, pos.y).get(1);  
    }
  
  
    void display()
    {

      displayObject();
 
    }
    
    
    void displayTile()
    {

        imageMode(CENTER); 
        image(images.get(0), cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1));
        
       
        
        if(state == 2)
        {
          fill(0,0,0,0);
          beginShape();
            vertex(cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1) - 20);
            vertex(cartToIso(pos.x, pos.y).get(0) + 40, cartToIso(pos.x, pos.y).get(1));
            vertex(cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1) + 20);
            vertex(cartToIso(pos.x, pos.y).get(0) - 40, cartToIso(pos.x, pos.y).get(1));            
            
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
        image(images.get(1), cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1) - 20);        
      }
      }catch(Exception e){}
            
    }
    
    
    
    
    
    
    
  
}
