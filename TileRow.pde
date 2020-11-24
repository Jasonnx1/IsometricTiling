class TileRow 
{
    ArrayList<Tile> tiles; 
  
    TileRow()
    {
     tiles = new ArrayList<Tile>(); 
    }
    
    void display()
    {
      
     for(Tile t : tiles)
     {
       
        t.displayTile(); 
      
     }
      
    }
    
    void displayGreater()
    {
      
            
       for(Tile t : tiles)
       {
        if(cartToIso(t.pos.x, t.pos.y).get(1) < player.pos.y)
         {
             t.displayObject(); 
         }
        
       }
      
    }
    
    void displayLower()
    {
   
       for(Tile t : tiles)
       {
         if(cartToIso(t.pos.x, t.pos.y).get(1) >= player.pos.y)
         {
            t.displayObject(); 
         }       
       }
      
    }
  
  
}
