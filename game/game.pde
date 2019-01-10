import processing.sound.*;
SoundFile file;
import queasycam.*;
QueasyCam cam;
int Scene=0;
int count=10;
float Score=0;
int StartTime;
int EndTime;
balls[] balls = new balls[count];


void setup() {
  size(1000, 1000, P3D);
  background(0);
  cam = new QueasyCam(this);
  cam.speed = 3;              // default is 3
  cam.sensitivity = 1;      // default is 2


  for (int i=0; i<count; i++)
  {
    balls[i] = new balls();
  }
}



void draw() {

  if (Scene==0)
  {
    Starting();
  }

  if (Scene==1)
  {
    endless();
  }

  if (Scene==2)
  {
    timed();
  }

  if (Scene==3)
  {
    ending();
  }
}


void Starting()
{
  background(0);

  fill(135, 206, 250);

  pushMatrix();
  rotateY(-PI/2);
  translate(-100, -100, -200);
  fill(255, 255, 255);
  quad(0, 0, 0, 200, 200, 200, 200, 0);
  popMatrix();

  pushMatrix();
  rotateY(-PI/2);
  textSize(50);
  fill(0);
  translate(-15, -130, -199);
  rotateZ(PI/2);
  text("Timed", 50, 50);
  popMatrix();

  pushMatrix();
  rotateY(-PI/2);
  translate(-100, -100, -199);
  stroke(15);
  line(100, 0, 100, 200);
  popMatrix();

  pushMatrix();
  rotateY(-PI/2);
  textSize(50);
  fill(0);
  translate(-115, -230, -199);
  rotateZ(-PI/2);
  text("Endless", -325, 175);
  popMatrix();

  if (cam.position.x>175)
  {

    if (cam.position.z>0)
    {
      Scene=1;
      StartTime=millis();
    }

    if (cam.position.z<0)
    {
      Scene=2;
      StartTime=millis();
    }
  }
}

void endless()
{

  if (cam.position.z>195)
  {
    cam.position.z=195;
  }

  if (cam.position.z<-195)
  {
    cam.position.z=-195;
  }

  if (cam.position.y>195)
  {
    cam.position.y=195;
  }

  if (cam.position.y<-195)
  {
    cam.position.y=-195;
  }

  if (cam.position.x>195)
  {
    cam.position.x=195;
  }

  if (cam.position.x<-195)
  {
    cam.position.x=-195;
  }



  background(0);
  fill(0, 255, 0);
  translate(0, 0, 0);
  box(400);



  for (int i=0; i<count; i++)
  {
    balls[i].render();
  }

  if (keyCode==' ')
  {
    Scene=3;
    EndTime=millis();
  }
  
  for (int i=0; i<count; i++)
  {

    if (dist(cam.position.x, cam.position.y, cam.position.z, balls[i].x, balls[i].y, balls[i].z)<balls[i].w)
    {

      Score=Score+(11-balls[i].w);
      println("yeet");
      balls[i].x=-1000;
    }
  }
}

void timed()
{
  
  
  if(millis()-StartTime>60000)
  {
    Scene=3;
    EndTime=millis();
    
  }

  background(0);
  
  fill(255, 0, 0);
  box(400);

  for (int i=0; i<count; i++)
  {

    balls[i].render();
  }

  if (cam.position.z>195)
  {
    cam.position.z=195;
  }

  if (cam.position.z<-195)
  {
    cam.position.z=-195;
  }

  if (cam.position.y>195)
  {
    cam.position.y=195;
  }

  if (cam.position.y<-195)
  {
    cam.position.y=-195;
  }

  if (cam.position.x>195)
  {
    cam.position.x=195;
  }

  if (cam.position.x<-195)
  {
    cam.position.x=-195;
  }

  for (int i=0; i<count; i++)
  {

    if (dist(cam.position.x, cam.position.y, cam.position.z, balls[i].x, balls[i].y, balls[i].z)<balls[i].w) //<>//
    {

      Score=Score+(11-balls[i].w);
      println("yeet");
      balls[i].x=-1000;
    }
  }
}

void ending()
{
  background(0);
  fill(255);
  translate(-500, -250, -500);
  text("Score:", width/3, height/3);
  text(Score, width/3*2, height/3);

  text("Time:                   seconds", width/3, height/3*2);
  text((EndTime-StartTime)/1000, width/3*2, height/3*2);

  cam.position.x=0;
  cam.position.y=0;
  cam.position.z=0;
}