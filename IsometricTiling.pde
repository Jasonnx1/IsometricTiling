Player player;
Map worldMap;
Cursor cursor;

int stat = 2; // 0: Game, 1: Debug, 2: Level Editor,


void setup()
{
  
  size(1080, 720);
  player = new Player(cartToIso(60,60).get(0), cartToIso(60,60).get(1));
  worldMap = new Map();
  cursor = new Cursor();
  noCursor();
}


void draw()
{
   update();
   display();
}

void update()
{
  player.update();
  
  
  if(mousePressed && mouseButton == LEFT)
  {  
      Tile t = worldMap.getCell(new PVector(mouseX, mouseY));
      
      
      if(stat == 2)
      {
        if(t != null)
        {
          t.images = new ArrayList<PImage>();
          t.images.add(cursor.currentSprite);      
        }
      }
        
      
      if(stat == 0)
      {      
        if(t != null)
        {
          player.set(cartToIso(t.pos.x + 20, t.pos.y + 20).get(0),cartToIso(t.pos.x + 20, t.pos.y + 20).get(1));        
        }        
      }


    }
  
}


void display()
{  
  
  background(100);
  worldMap.display();
  
  if(stat == 0)
  {
    player.display();
  }
  
  
  cursor.display();
  
}

ArrayList<Float> cartToIso(float x, float y){
  
      ArrayList<Float> array = new ArrayList<Float>();
      array.add(x-y + width/2);
      array.add((x+y)/2 + 150);

     return array;
}

ArrayList<Float> isoToCart(float x, float y){
  
      ArrayList<Float> array = new ArrayList<Float>();
      array.add((2*(y - 150) + (x - width/2))/2);
      array.add((2*(y - 150) - (x - width/2))/2);

      
      return array;
}


void mousePressed()
{
   cursor.mousePressed(); 
  
}

void keyPressed()
{
   cursor.keyPressed(key); 
  
}
