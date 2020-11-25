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
    
  
  
}
