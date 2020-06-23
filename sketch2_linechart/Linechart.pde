

class Linechart extends Frame {

  Table data;
  String useColumn;
  
  //creating a positions vector 
  PVector[] positions = new PVector[myTable.getRowCount()];
  
  //values to be used for min and max values
  int min, max, min2,max2;
  
  //margin to determine size of chart
  int yMargin = 150;
  int xMargin = 150;
  
  float m, l;
  
  Linechart( Table _data, String _useColumn ) {
    data = _data;
    useColumn = _useColumn;
  }
  
  void setColumn( String _useColumn ){
    useColumn = _useColumn;
  }

  void draw() {
    
    //creating font
    PFont f;
    f = createFont("Arial", 16, true);
    
    
    //background and coloring
    background(0);
    fill(200);



      
    //chart title
    textFont(f,20);
    text("SATM vs SATV", width/2, 20);
    textFont(f,12);
    
    //array of values
    int value1[] = new int[myTable.getRowCount()]; 
    int value2[] = new int[myTable.getRowCount()]; 
    int multiplier = 50;
    
    //getting values
    for(int i=0; i< value1.length; i++)
    {
        value1[i] = myTable.getInt(i,0);
        value2[i] = myTable.getInt(i,1);
    }
    
    value1 = sort(value1);
    //min and max
    min = min(value1);
    max = max(value1);
    min2 = min(value2);
    max2 = max(value2);
    
    
    //determining the height of the graph with margins
    int graphHeight = (height - yMargin) - yMargin;
    
    //space of x axis and space between points
    int xWidth = (width - yMargin) - yMargin;
    float xSpace = xWidth / (value1.length)  + 0.5;
    
    
   
    
    for(int i = 0;i<value1.length;i++)
    {
        
       //getting adjusted values, yposition and xposition
       float adjValue = map(value1[i], min, max, 0, width);
       float yPos = height - (myTable.getFloat(i,1)-yMargin) ;
       if(myTable.getInt(i,0) == min)
         m=yPos;
       else if (myTable.getInt(i,0) == max)
         l=yPos;
       float xPos = yMargin + (xSpace * i) + 10;
       positions[i] = new PVector(map(value1[i],min,max,xMargin,width-xMargin), yPos);
       if(i>0)
        {
           stroke(200);
         //drawing lines between the points
       
          line(positions[i].x, positions[i].y, positions[i-1].x, positions[i-1].y);
       
       }
       //getting values
       //text(myTable.getInt(i,2), positions[i].x, positions[i].y-15);
       
       //if(mouseX>positions[i].x && mouseX<positions[i].x+3 && mouseY>positions[i].y && mouseY<positions[i].y+3 )
       float d = dist(mouseX, mouseY, positions[i].x, positions[i].y);
       if (d < 2.5) 
       {
               text("SATM:", width-80, height-50); 
               text(myTable.getInt(i,0), width-40, height-50);
               text("SATV:", width-80, height-65); 
               text(myTable.getInt(i,1), width-40, height-65);
               text("ACT:", width-80, height-80); 
               text(myTable.getInt(i,2), width-40, height-80);
               text("GPA:", width-80, height-95); 
               text(myTable.getFloat(i,3), width-40, height-95);
               
       }
       
    }
    
    //if democrat color blue, else color red
    for(int i = 0;i < positions.length; i++)
    {
      //if(myTable.getString(i,3).equals("DEM"))
         // fill(0,0,255);
      //else 
          fill(255,0,0);
      ellipse(positions[i].x, positions[i].y , 5, 5);
      
     
      
    }  
    
    for(int i = value1.length-1; i>0;i--)
    {
       
       stroke(200);
       //drawing lines between the points
       
      //line(value1[i]-xMargin, height - (value2[i]-yMargin),value1[i-1]-xMargin, height - (value2[i-1]-yMargin));
       
   
      
      
    }
    //calling function
    drawGUI();
    
  }

void drawGUI(){
 
  
  for(int i=0; i<positions.length;i++)
  {
     //drawing lines in graph 
     stroke(200,100);
//     line(positions[i].x, margin, positions[i].x, height-margin); 
     fill(255);
     //getting years in x-axis
     
     
     
     
     //showing min and max value
     text(max2, xMargin/2, height-(max2-yMargin));
     text(min2, xMargin/2, height-(min2-yMargin));
     //y axis
     text(max, width-xMargin, height-75);
     text(min, xMargin, height-75);
    // println(l);
     //println(m);
  }
  
}
  void mousePressed() { 
    
   for(int i = 0; i<positions.length;i++)
   {
      //if(mouseX>positions[i].x && mouseX<positions[i].x+3 && mouseY>positions[i].y && mouseY<positions[i].y+3 )
      //         text(myTable.getString(i,3), positions[i].x, positions[i].y-30);
   }
  }
  

  void mouseReleased() {   }
  
}
