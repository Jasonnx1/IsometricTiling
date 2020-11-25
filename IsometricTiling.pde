import java.util.Arrays;
import java.util.Comparator;

Player player;
Player player2;
Map worldMap;
Cursor cursor;
PImage bg;
ArrayList<IDrawable> entities;

enum DIR {
   RIGHT,
   LEFT,
   UP,
   DOWN,
   DOWNRIGHT,
   DOWNLEFT,
   UPRIGHT,
   UPLEFT,
   STAND
  }

int state = 0; // 0: Game, 1: Debug, 2: Level Editor,


void setup()
{
  
  size(1080, 720, P3D);
 // fullScreen();
  
  entities = new ArrayList<IDrawable>();
  player2 = new Player(cartToIso(200, 400).get(0), cartToIso(200, 400).get(1));
  player = new Player(cartToIso(360, 50).get(0), cartToIso(360, 50).get(1));
  worldMap = new Map();
  cursor = new Cursor();
  noCursor();
  bg = loadImage("images/bg.png");
  bg.resize(width,height);
  
  player2.setCommand('i','j','k','l');
  
  
  entities.add(player);
  entities.add(player2);
  
  
  
  
  player2.body = new SpriteSheet("images/player/steel_armor.png", 4096,1024, 32, 8, 4096/32, 1024/8);
  player2.head = new SpriteSheet("images/player/male_head1.png", 4096,1024, 32, 8, 4096/32, 1024/8);
  player2.weapon = new SpriteSheet("images/player/staff.png", 4096,1024, 32, 8, 4096/32, 1024/8);
  
 
}


void draw()
{
   update();
   display();
}


public void sort(ArrayList<IDrawable> drawables)
{
  
  int i = 0;
  boolean done = false;
  while(!done)
  {
    done = true;
    
    for(i = 0; i < drawables.size(); i++)
    {
      if(i != drawables.size() - 1)
      {
        if(drawables.get(i).getY() > drawables.get(i+1).getY())
        {
          IDrawable temp = drawables.get(i);
          drawables.set(i, drawables.get(i+1));
          drawables.set(i+1, temp);
          
          done = false; 
        }
      
      }
      
    }
     
  }

}

void update()
{
  if(state == 0)
  {
    player.update();
    player2.update();
  }
  
  if(mousePressed && mouseButton == LEFT)
  {  
      Tile t = worldMap.getCell(new PVector(mouseX, mouseY));
      
      
      if(state == 2)
      {
        if(t != null)
        {
          
          if(cursor.currentCode == 12)
          {  
              t.images.add(1, cursor.currentSprite);
              t.codeObject = 1;
              t.isCollidable = true;
              entities.add(t);
          }
          else
          {              
              t.images = new ArrayList<PImage>();
              t.images.add(cursor.currentSprite);  
              t.code = cursor.currentCode;
              t.codeObject = 0;
              entities.remove(t);
              if(t.code == 6)
              {
               t.isCollidable = true; 
              }
              else
              {
               
                t.isCollidable = false;
                
              }
          }
        }
      }
        
      
      if(state == 0)
      {      
        if(t != null)
        {
          player.set(cartToIso(t.pos.x + 20, t.pos.y + 20).get(0),cartToIso(t.pos.x + 20, t.pos.y + 20).get(1));    
          player2.set(cartToIso(t.pos.x + 20, t.pos.y + 20).get(0),cartToIso(t.pos.x + 20, t.pos.y + 20).get(1));    
        }        
      }


    }
  
}


void display()
{  
  background(bg);
  
  worldMap.displayWorld();
  
  sort(entities);
  for(IDrawable e : entities)
  {
   e.display(); 
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

  
}

void keyPressed()
{
  if(key == '#')
  {
    
    if(state == 0)
    {
      state = 2;
    } else
    { 
      if(state == 2)
      {    
        worldMap.saveMap("levels/main.txt");
        worldMap.saveOverworld("levels/mainObjects.txt");
        state = 0;      
      }
    }
    
  }
  else
  {
    cursor.keyPressed(key); 
    player.keyPressed(key);
    player2.keyPressed(key);
  }

  
}

void keyReleased()
{
  player.keyReleased(key);
  player2.keyReleased(key);
}
