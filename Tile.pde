class Tile {
  PVector pos;
  ArrayList<PImage> images;
  
    Tile(PVector _pos, PImage _image)
    {
        pos = _pos;
        images = new ArrayList<PImage>();
        images.add(_image); 
        
        for(PImage i : images)
        {
          
          i.resize(80,42);
        }
    
    }
  
  
    void display()
    {
      
  
        imageMode(CENTER);
        
          
        for(PImage i : images)
        {
          
          image(i, cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1) + 20);
        }
        
        fill(0,0,0,0);
        beginShape();
          vertex(cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1));
          vertex(cartToIso(pos.x+40, pos.y).get(0), cartToIso(pos.x+40, pos.y).get(1));
          vertex(cartToIso(pos.x+40, pos.y+40).get(0), cartToIso(pos.x+40, pos.y+40).get(1));
          vertex(cartToIso(pos.x, pos.y+40).get(0), cartToIso(pos.x, pos.y+40).get(1));
        endShape(CLOSE);
        
        
    }
  
}
