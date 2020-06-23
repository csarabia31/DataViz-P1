

class Barchart extends Frame {

  Table data;
  String useColumn;

  Barchart( Table _data, String _useColumn ) {
    data = _data;
    useColumn = _useColumn;
  }
  
  void setColumn( String _useColumn ){
    useColumn = _useColumn;
  }

  void draw() { 
    
    //background color almost white (light gray)
    background(255);
    
    //creating font to be used later
    PFont f;
    f = createFont("Arial", 16, true);
    textFont(f,16);
    
    //color for the text to be used
    fill(85);
    
    
    //counter variable to be used later, years defined for x axis
    int j = 1;
    int years = 1992;
    
    //Chart title
    textFont(f,20);
    text("SATV SCORES", width/3 ,height-50);
    
    //getting row count 
    int rowCount = myTable.getRowCount();
    
     PVector[] positions = new PVector[rowCount];
    //array for all values
    int[] values = new int[rowCount]; 
    for(int i = 0;i<rowCount; i++)
    {
      values[i] = myTable.getInt(i,1);
    }
    
    int max = max(values);
    int min = min(values);
    fill(0,0,255);
    text("0", 1, 600);
    text(max, 5, 60);
    
    
    for(int i = 0; i<rowCount; i++)
    {
      
      
      stroke(0,0,255);
      line(12,70,12,600);
      line(12,600,width-5,600);
      //multiplier to make bar chart bigger, for better visibility
      int multiplier = 50;
      
      //defining the width of the rectangles
      float rectWidth = (width/rowCount)-1;
      
      //ypos of rectangles (making them start from the bottom)
      float ypos = 860-myTable.getFloat(i,1); //para hacer el graph desde abajo
      
      
      
      
      
      
      stroke(0);
      //x-axis
      //line(60, 70, 60, 530);
    //  line(55, ypos,60, ypos);
      //y-axis
     // line(60, 530, 590, 530);
      
      //adding numbers to barchart
      fill(0);
      textFont(f,10);
      //text(myTable.getFloat(i,1), (rectWidth*(j*1.2) + 9), ypos - 10);
      
      //adding years to x axis
      textFont(f,16);
     // text(years, (rectWidth*(j*1.2) + 9) , 550);
      years = years + 4;
      
      //getting row count
     
      //println(rowCount);
      
      
      //if party is democ

        fill(0);
        noStroke();
        //rectMode(CORNERS);
       float rectHeight=600-ypos;
       positions[i] = new PVector(rectWidth*(j*1.8)+15, ypos);
       rect(positions[i].x, positions[i].y, rectWidth, rectHeight);
       fill(255,0,0);
       text("SATM:", width/2, height-40); 
       text("SATV:", width/2, height-55); 
       text("ACT:", width/2, height-70); 
       text("GPA:", width/2, height-85);
       //float d = dist(mouseX, mouseY, positions[i].x, positions[i].y);
       //println(d);
       if (mouseX>positions[i].x && mouseX<positions[i].x+rectWidth && mouseY>positions[i].y && mouseY<positions[i].y+rectHeight) 
       {
               fill(255,0,0);
               rect(positions[i].x, positions[i].y, rectWidth, rectHeight);
               //text("SATM:", width/2, height-40); 
               text(myTable.getInt(i,0), (width/2)+50, height-40);
               //text("SATV:", width/2, height-55); 
               text(myTable.getInt(i,1), (width/2)+50, height-55);
               //text("ACT:", width/2, height-70); 
               text(myTable.getInt(i,2), (width/2)+50, height-70);
               //text("GPA:", width/2, height-85); 
               text(myTable.getFloat(i,3), (width/2)+50, height-85);
               
       }
        //rectWidth*(j*3.65)
      
      //icrease j  
      j++;
      
    }
    
    
   //text(myTable.getFloat(0,1), 10, 100);
  }

  void mousePressed() { 
    //if(mousePressed)
       // ellipse(200,200,200,200);
  }

  void mouseReleased() {   }
  
}
