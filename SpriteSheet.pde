class SpriteSheet{
  
    PImage sheet;
    ArrayList<PImage> images;
    int IWidth = 628;
    int IHeight = 256;
    

    
    SpriteSheet(String path, int w, int h, int nw, int nh)
    {
      sheet = loadImage(path);    
      
      images = new ArrayList<PImage>();
      
      IWidth = w;
      IHeight = h;
      
      for(int i = 0; i < nw; i++ )
      {
       
        for(int j = 0; j < nh; j++)
        {
          
          images.add( sheet.get(i*IWidth/nw, j*IHeight/nh, IWidth/nw, IHeight/nh) );
          
        }
        
      }
      
      
    }
  
  
}
