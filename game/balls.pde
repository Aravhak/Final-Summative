

class balls
{
  
  float x;
  float y;
  float z;
  
  int w;
  
  int R;
  int G;
  int B;
  
  
  balls()
  {
   x=random(-195,195);
   
   y=random(-195,195);
   
   z=random(-195,195);
   
   w=(int)random(2,10);
   
   R=(int)random(0,255);
   
   G=(int)random(0,255);
   
   B=(int)random(0,255);
  }
  
  void render()
  {
    translate(x,y,z);
    
    fill(R,G,B);
    
    sphere(w);
    
    translate(-x,-y,-z);
    
    if(x==-1000)
    {
      x=random(-200,200);
      y=random(-200,200);
      z=random(-200,200);
    }

   
    
    
  }
  
  
  
  
  
}