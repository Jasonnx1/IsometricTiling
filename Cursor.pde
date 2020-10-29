class Cursor
{

 SpriteSheet sheet;
 PImage currentCursor;
 
 
 Cursor() {
   
   sheet = new SpriteSheet("images/cursors.png", 625, 178, 9, 2);   
   currentCursor = sheet.images.get(0);
   currentCursor.resize((int)(69/1.1), (int)(89/1.1));
   
   
   
 }
 
 
 void display()
 {
   
   imageMode(CENTER);
   image(currentCursor, mouseX, mouseY);
   
 }
  
 
  void mousePressed()
  {
    if(mouseButton == RIGHT)currentCursor = sheet.images.get(12);
    if(mouseButton == LEFT)currentCursor = sheet.images.get(0);
    currentCursor.resize((int)(69/1.1), (int)(89/1.1));
  }
  
}
