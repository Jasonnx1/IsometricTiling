class Button
{
  int type;
  PVector loc;
  PVector size;
  color c = color(255);
  String text;
  
  Button(PVector _loc, PVector _size, String _text)
  {
    loc = _loc;
    size = _size;  
    text = _text;
  }
 
  
  void display()
  {
    
    fill(c);
    rectMode(CENTER);
    rect(loc.x, loc.y, size.y, size.x);
    
    
    textSize(20);
    fill(0);
    text(text, loc.x - 20, loc.y);  
   
   
    
  }
  
}
