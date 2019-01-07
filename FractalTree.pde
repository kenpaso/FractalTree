private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .3567;  
public void setup() 
{   
	size(640,480);    
	//noLoop(); 
} 
public void draw() 
{   
	background(255,255,255);   
	stroke(0,255,0);   
	line(320,380,320,480);   
	branchAngle=mouseY/(280/.25);
	//drawBranches(320,380,100,3*Math.PI/2);  
	drawBranches(mouseX,mouseY,100,3*Math.PI/2);  

	if((mouseY > 380) && (mouseX < 325) && (mouseX > 315))
	{
		background(0);
		drawBranches(mouseX,mouseY,100,3*Math.PI/2); 
		textSize(10);
 		fill(255);
 		text("now click",20,450);

		if(mousePressed == true)
 		{
 		background(0);
		drawBranches(mouseX,mouseY,100,3*Math.PI/2); 

 		textSize(25);
 		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 		text("Downloading Data",20,450);

 		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 		ellipse(245, 448, 5, 5);
 		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 		ellipse(255, 448, 5, 5);
 		fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
 		ellipse(265, 448, 5, 5);
 
 		}	
	}
	

} 

public void drawBranches(int x,int y, double branchLength, double angle) 
{   	
	stroke(0,(int)(Math.random()*255),0);
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchLength = branchLength * fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);

	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);

	if(branchLength > smallestBranch)
	{
		drawBranches(endX1,endY1,branchLength,angle1);
		drawBranches(endX2,endY2,branchLength,angle2);
	}
} 
