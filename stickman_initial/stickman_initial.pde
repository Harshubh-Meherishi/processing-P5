Table table;
void setup(){
 size(900,100); 
table = loadTable("data.csv","header");
 
}
 
float x;
float y;
float w;
float h;
float headX=30;
float headY=20;
float hipX;
float hipY;
float len=20;
float torsolength=35;
float a1,a2,a3,a4;
float speed;
int i =0;
 
void draw(){
if(i<99)
{
TableRow row = table.getRow(i);
x = row.getFloat("RH FE");
y = row.getFloat("LH FE");
w = row.getFloat("RK FE");
h = row.getFloat("LK FE");
}
else
{
  exit();
}
System.out.println(x+" " + y + " " + w + " " + h);
 strokeWeight(5);
 background(255);
 hipX=headX;
 hipY=headY+torsolength;
 line (headX,headY,hipX,hipY);
 line (headX,headY+15,headX+35,headY);
 line (headX,headY+15,headX-35,headY);
 ellipse(headX,headY,20,20);
 a1=sin(x);
 a2=sin(y);
 a3=sin(w);
 a4=sin(h);
 float leftKneeX=hipX+sin(a1)*len;

 float leftKneeeY=hipY+cos(a1)*len;
 float rightKneeX=hipX+sin(a3)*len;
 float rightKneeY=hipY+cos(a3)*len;
 float leftAnkleX=leftKneeX+sin(a2)*len;
 float leftAnkleY=leftKneeeY+cos(a2)*len;
 float rightAnkleX=rightKneeX+sin(a4)*len;
 float rightAnkleY=rightKneeY+cos(a4)*len;
 stroke(147,58,22);

 line (hipX,hipY,leftKneeX,leftKneeeY);
 line (leftKneeX,leftKneeeY,leftAnkleX,leftAnkleY);
 stroke(0);
 line (hipX,hipY,rightKneeX,rightKneeY);
 line (rightKneeX,rightKneeY,rightAnkleX,rightAnkleY);
i+=1;
 headX+=((x+y+w+h)/20);
 delay(100);
}
