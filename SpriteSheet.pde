class SpriteSheet{
  
    PImage sheet;
    ArrayList<PImage> images;
    

    
    SpriteSheet(String path, int w, int h, int nw, int nh, int rw, int rh)
    {
      sheet = loadImage(path);    
      
      images = new ArrayList<PImage>();
      

      
      for(int i = 0; i < nw; i++ )
      {
       
        for(int j = 0; j < nh; j++)
        {
          
          images.add( sheet.get(i*w/nw, j*h/nh, w/nw, h/nh) );
          
          
        }
        
      }
      
        for(PImage i : images)
        {          
            i.resize(rw,rh);
        }
 
    }
  
  
}
