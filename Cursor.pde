class Cursor
{

 SpriteSheet sheet;
 PImage currentCursor;
 PImage currentSprite; // For Level Editing;
 int currentCode;
 
 
 
 Cursor() {
   
   sheet = new SpriteSheet("images/cursors.png", 625, 178, 9, 2, 625/9, 178/2);   
   currentCursor = sheet.images.get(0);
   currentCursor.resize((int)(69/1.1), (int)(89/1.1));
   currentSprite = worldMap.sprites.images.get(0);
   currentCode = 0;

 }
 
 
 void display()
 {
   
   imageMode(CENTER);
   image(currentCursor, mouseX, mouseY);
   
 }
   

  
  void keyPressed(char k)
  {
    
    switch(k)
    {
           case '1': currentSprite = worldMap.sprites.images.get(0);
                     currentCode = 0;
           break;
           case '2': currentSprite = worldMap.sprites.images.get(1);
                     currentCode = 1;
           break;
           case '3': currentSprite = worldMap.sprites.images.get(2);
                     currentCode = 2;
           break;
           case '4': currentSprite = worldMap.sprites.images.get(3);
                     currentCode = 3;
           break;
           case '5': currentSprite = worldMap.sprites.images.get(4);
                     currentCode = 4;
           break;
           case '6': currentSprite = worldMap.sprites.images.get(5);
                     currentCode = 5;
           break;
           case '7': currentSprite = worldMap.sprites.images.get(6);
                     currentCode = 6;
           break;
           case '8': currentSprite = worldMap.sprites.images.get(7);
                     currentCode = 7;
           break;
           case '9': currentSprite = worldMap.sprites.images.get(8);
                     currentCode = 8;
           break;
           case '0': currentSprite = worldMap.sprites.images.get(9);
                     currentCode = 9;
           break;
           case '-': currentSprite = worldMap.sprites.images.get(10);
                     currentCode = 10;
           break;
           case '=': currentSprite = worldMap.sprites.images.get(11);
                     currentCode = 11;
           break;          
           case 'q': currentSprite = worldMap.objects.images.get(0);
                     currentCode = 12;
           break;
    }
    
    
    
    if(currentCode == 12)
    {
     
      currentSprite.resize(53,80);
      
    }
    else
    {      
      currentSprite.resize(80,42);
    }
    
    if(keyCode == ENTER)
    {
      
     worldMap.saveMap("levels/main.txt"); 
     worldMap.saveOverworld("levels/mainObjects.txt");
      
    }
    
  }
  
  
  
}
