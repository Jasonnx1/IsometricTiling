class Map {
  
  ArrayList<TileRow> rows; 
  
   ArrayList<Float> isoA = cartToIso(0, 0);
   ArrayList<Float> isoB = cartToIso(0, 400);
   ArrayList<Float> isoC = cartToIso(400, 400);
   ArrayList<Float> isoD = cartToIso(400, 0);
   
   SpriteSheet sprites;
  
   int[][] worldMap =  {
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 1, 1, 0, 0, 0, 0, 2, 1, 0},
     {0, 1, 0, 0, 0, 0, 0, 0, 2, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 2, 0, 0, 0, 0, 0, 0, 1, 0},
     {0, 1, 2, 0, 0, 0, 0, 1, 1, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
   };
  
  Map()
  {
 
    PImage img = new PImage();
    sprites = new SpriteSheet("images/iso_tiles.png", 628, 256, 4, 3);    
    rows = new ArrayList<TileRow>();
     
    for(int i = 0; i < 10; i++)
    {
      
      
      rows.add( new TileRow());
      
      for(int j = 0; j < 10; j++)
      {

         
          switch(worldMap[i][j])
          {
           case 0: img = sprites.images.get(0);
           break;
           case 1: img = sprites.images.get(1);
           break;
           case 2: img = sprites.images.get(2);
           break;
           case 3: img = sprites.images.get(3);
           break;
           case 4: img = sprites.images.get(4);
           break;
           case 5: img = sprites.images.get(5);
           break;
           case 6: img = sprites.images.get(6);
           break;
           case 7: img = sprites.images.get(7);
           break;
           case 8: img = sprites.images.get(8);
           break;
           case 9: img = sprites.images.get(9);
           break;
           case 10: img = sprites.images.get(10);
           break;
           case 11: img = sprites.images.get(11);
           break;
          }
          
         rows.get(i).tiles.add(new Tile(new PVector(i*40, j*40), img));
      }
      
      
    }
    
    
  }
  
  public void display()
  {

  /*  line(isoA.get(0), isoA.get(1), isoB.get(0), isoB.get(1));
    line(isoB.get(0), isoB.get(1), isoC.get(0), isoC.get(1));
    line(isoC.get(0), isoC.get(1), isoD.get(0), isoD.get(1));
    line(isoD.get(0), isoD.get(1), isoA.get(0), isoA.get(1));*/
    
    for(TileRow row : rows)
    {
      
     row.display(); 
      
    }
   
    
  }
  
  
}
