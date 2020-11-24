class Map {
  
  ArrayList<TileRow> rowsMap; 
  
   ArrayList<Float> isoA = cartToIso(0, 0);
   ArrayList<Float> isoB = cartToIso(0, 440);
   ArrayList<Float> isoC = cartToIso(440, 440);
   ArrayList<Float> isoD = cartToIso(440, 0);
   
   int baseOffsetX = -40;
   int baseOffsetY = -80;
   float heightRowDepthMod = 0.0000001f;
   
   SpriteSheet sprites;   
   SpriteSheet objects; 
  
   int[][] worldMap =  {
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
   };
   
    int[][] overlayMap =  {
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
     {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
   };
   
  
  Map()
  {

    loadWorld("levels/main.txt");
    loadOverworld("levels/mainObjects.txt");
    
    
    PImage img = new PImage();
    sprites = new SpriteSheet("images/iso_tiles.png", 628, 256, 4, 3, 80, 42 );   
    objects = new SpriteSheet("images/rocks.png", 384, 384, 3, 2, 53, 80);
    rowsMap = new ArrayList<TileRow>();
     
    for(int i = 0; i < 11; i++)
    {
      rowsMap.add( new TileRow() );
      
      for(int j = 0; j < 11; j++)
      {

         
          switch(worldMap[i][j])
          {
           case 0: img = sprites.images.get(0); //Grass
           break;
           case 1: img = sprites.images.get(1); //Grass2
           break;
           case 2: img = sprites.images.get(2); //Dirt
           break;
           case 3: img = sprites.images.get(3); //Dirt2
           break;
           case 4: img = sprites.images.get(4); //Dirt2
           break;
           case 5: img = sprites.images.get(5); //Dirt2
           break;
           case 6: img = sprites.images.get(6); //Dirt2
           break;
           case 7: img = sprites.images.get(7); //Dirt2
           break;
           case 8: img = sprites.images.get(8); //Dirt2
           break;
           case 9: img = sprites.images.get(9); //Dirt2
           break;
           case 10: img = sprites.images.get(10); //Dirt2
           break;
           case 11: img = sprites.images.get(11); //Dirt2
           break;

          }
          
         rowsMap.get(i).tiles.add(new Tile(new PVector(i*40, j*40), img, worldMap[i][j]));
         
      }
    }
      
    for(int i = 0; i < 11; i++)
    {
      
      for(int j = 0; j < 11; j++)
      {
           boolean col = true;
          switch(overlayMap[i][j])
          {
           case 0: img = new PImage(); col = false;
           break;
           case 1: img = objects.images.get(0); 
           break;
           case 2: img = objects.images.get(1); 
           break;
           case 3: img = objects.images.get(2); 
           break;
           case 4: img = objects.images.get(3); 
           break;
           case 5: img = objects.images.get(4); 
           break;
           case 6: img = objects.images.get(5); 

          } 
          
           rowsMap.get(i).tiles.get(j).images.add(img);
           rowsMap.get(i).tiles.get(j).codeObject = overlayMap[i][j];
           if(col)
           {
             rowsMap.get(i).tiles.get(j).isCollidable = true;
             entities.add(rowsMap.get(i).tiles.get(j)); 
           }
           
          
        }

      }
      
               
                     
      
      
   }
    
    
    void loadWorld(String path)
    {
      
      String[] lines = loadStrings(path);
      
      for(int i = 0; i < lines.length; i++)
      {
       
        
        for(int j = 0; j < lines[i].length(); j++)
        {
          
          String s = "";
          s += lines[i].charAt(j);
          
          if(s.charAt(0) == '-')
          {
            s = "10";
          }
          
          if(s.charAt(0) == '=')
          {
            s = "11";
          }
          
          worldMap[i][j] = Integer.parseInt(s);
          
        }
        
        
        
      }
      
    }
    
    void loadOverworld(String path)
    {
      String[] lines = loadStrings(path);
      
      for(int i = 0; i < lines.length; i++)
      {   
        for(int j = 0; j < lines[i].length(); j++)
        {
          
          String s = "";
          s += lines[i].charAt(j);
          
          if(s.charAt(0) == '-')
          {
            s = "10";
          }
          
          if(s.charAt(0) == '=')
          {
            s = "11";
          }
          
          overlayMap[i][j] = Integer.parseInt(s);
          
        }  
      }      
    }
    
    
    void saveOverworld(String path)
    {
      String[] strings = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      };
      
      for(int i = 0; i < 11; i ++)
      {
        
         for(int j = 0; j < 11; j++)
         {
           strings[i] += rowsMap.get(i).tiles.get(j).codeObject;                     
         }  
         
      }

      saveStrings(path, strings);
      
    }
    
    void saveMap(String path)
    {
      
      String[] strings = {
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      };
      
      for(int i = 0; i < 11; i ++)
      {
        
         for(int j = 0; j < 11; j++)
         {
           if(rowsMap.get(i).tiles.get(j).code < 10 )
           strings[i] += rowsMap.get(i).tiles.get(j).code; 
           else
           {
            
             switch(rowsMap.get(i).tiles.get(j).code)
             {
               case 10: strings[i] += '-'; 
               break;
               case 11: strings[i] += '='; 
               break;
     
             }
             
             
           }
           
           
         }
      }
      
      saveStrings(path, strings);
      
    }
    
  
  
  Tile getCell(PVector loc)
  {
    
    
    int i = 0;
    int j = 0;
    
    boolean found = false;
    
    Tile t = null;
    
    
    while(!found)
    {
      
      
      PVector pos = new PVector(rowsMap.get(i).tiles.get(j).pos.x, rowsMap.get(i).tiles.get(j).pos.y); 
      
      
      if( isoToCart(loc.x, loc.y + 20).get(0) >= pos.x + 40
       || isoToCart(loc.x, loc.y + 20).get(0) <= pos.x
       || isoToCart(loc.x, loc.y + 20).get(1) >= pos.y + 40
       || isoToCart(loc.x, loc.y + 20).get(1) <= pos.y)
       {
         

         
       } else {
         
         found = true;
         t = rowsMap.get(i).tiles.get(j);

       }
     
      i++;
      if(i == 11)
      {
        i = 0;
        j++;
        if(j == 11)
        {
         
          found = true;
          
        }
      }
    }
    
    return t;
    
  }
  
  public void displayWorld()
  {

  /*  line(isoA.get(0), isoA.get(1), isoB.get(0), isoB.get(1));
    line(isoB.get(0), isoB.get(1), isoC.get(0), isoC.get(1));
    line(isoC.get(0), isoC.get(1), isoD.get(0), isoD.get(1));
    line(isoD.get(0), isoD.get(1), isoA.get(0), isoA.get(1));*/
    
    if(state == 2)
    {
       int i = 0;
      for(PImage img : sprites.images)
      {
        img.resize(80,42);
        image(img, i * 70 + 180, 50);
        i++;
        
        textSize(15);
        fill(0);
        
        if(i < 10)
        text(i, i*70+110, 100);
        else
        {
         
          switch(i)
          {
           
            case 10: text("0", i*70+110, 100);
            break;
            case 11: text("-", i*70+110, 100);
            break;
            case 12: text("=", i*70+110, 100);
            break;
            
          }
          
        }
        
      }
      
    }
    
    for(TileRow row : rowsMap)
    {
      
     row.display(); 
    
    }
   
  }
  
  public void displayGreater()
  {
    
    for(TileRow row : rowsMap)
    {
       row.displayGreater();     
    }
    
  }
  
    public void displayLower()
  {
    
    for(TileRow row : rowsMap)
    {
       row.displayLower();     
    }
    
  }
  
  
  
  
}
 
