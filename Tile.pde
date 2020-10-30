class Tile {
  PVector pos;
  ArrayList<PImage> images;
  int code;
  
    Tile(PVector _pos, PImage _image, int _code)
    {
        pos = _pos;
        images = new ArrayList<PImage>();
        images.add(_image); 
        code = _code;

    }
  
  
    void display()
    {
      
  
        imageMode(CENTER);
        
          
        for(PImage i : images)
        {
          if(i != null)
          image(i, cartToIso(pos.x, pos.y).get(0), cartToIso(pos.x, pos.y).get(1) + 20);
        }
        
        
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
  
}
