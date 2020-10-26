public abstract class GraphicObject
{
 
    PVector loc;
    PVector vel;
    PVector acc;
    
    abstract void update(float deltatime); 
    abstract void display();  
  
  
}
