class Menu {
 
  int volume;
  PImage title;
  PImage bg;
  ArrayList<Button> buttons;
  PImage arrow;
  int nPlayers = 1;
  
  Menu()
  {
    
    title = loadImage("images/title.png");
    bg = loadImage("images/bg.jpg");
    bg.resize(width, height);
    title.resize(850, 100);
    arrow = loadImage("images/arrow.png");
    arrow.resize(50,50);
    
  }
  
  void display()
  {
    bg.resize(width, height);
    background(bg);
    textSize(48);
    fill(#890009);
    text("Press Enter to begin", width/2 - 210, 300);
    imageMode(CENTER);   
    image(title, width/2, 100);
    text("1 player", width/2 - 100, 400);
    text("2 player", width/2 - 100, 500);
    
    if(nPlayers == 1)
    {
        image(arrow,width/2 - 125, 385);
    }
    else
    {
      image(arrow,width/2 - 125, 485);      
    }
    
   
  }
  
  
  void keyPressed()
  {
    if(keyCode == UP)
    {
     nPlayers = 1; 
      
    }
    
    if(keyCode == DOWN)
    {      
     nPlayers = 2; 
    }
  }
  
  
}
