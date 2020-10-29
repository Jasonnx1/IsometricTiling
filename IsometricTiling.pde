Player player;
Map worldMap;
Cursor cursor;


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
    
      if (isoToCart(mouseX, mouseY).get(0) >= 400
       || isoToCart(mouseX, mouseY).get(0) <= 0
       || isoToCart(mouseX, mouseY).get(1) >= 400
       || isoToCart(mouseX, mouseY).get(1) <= 0) {   
      } else {
        player.set(mouseX, mouseY);
      }    
      
      for (int i = 0 ; i < 400 ; i += 40) {
        for (int j = 0 ; j < 400 ; j += 40) {
          if (isoToCart(mouseX, mouseY).get(0) < i + 40 && i < isoToCart(mouseX, mouseY).get(0)) {
            if (isoToCart(mouseX, mouseY).get(1) < j + 40 && j < isoToCart(mouseX, mouseY).get(1)) {
              player.set(cartToIso(i + 20, j + 20).get(0), cartToIso(i + 20, j + 20).get(1));
            }
          }
        }
      }    
    }
  
}


void display()
{  
  
  background(100);
  worldMap.display();
  player.display();
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
