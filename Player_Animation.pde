enum State { RUN, STAND, ATTACK, DIE }

class Player_Animation
{
     Animation run;
     Animation stand;
     Animation attack;
     Animation die;
     
     Animation current_animation;
     
     
     
     Player_Animation()
     {
       run = new Animation(8);
       stand = new Animation(4);
       current_animation = stand;
       attack = new Animation(6);
       die = new Animation(6);
       
     }
     
     
     void update()
     {
       if(current_animation == stand)
       {
         current_animation.updateStand();
       }
       else
       {
         current_animation.update();          
       }
    
           
     }
  
  
  
    
  
  
  
  
}
