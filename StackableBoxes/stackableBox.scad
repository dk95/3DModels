$fn = 30;

boxWidth = [50,100,150];
boxHeight = [50,100,150];
boxDepth = [100,150,200];

bottom = 0;
middle = 1;
top = 2;
topbottom = 3;
left = 0;
right = 2;
leftright = 3;


cornerRadius = 5;
wallThickness = 1.2;
tolerance = 0.5;




box(1,1,1,cornerRadius,left,topbottom);

translate([boxWidth[1],0,0])
box(2,0,1,cornerRadius,right,bottom);

translate([boxWidth[1],0,boxHeight[0]])
box(1,0,1,cornerRadius,middle,top);

translate([boxWidth[1] + boxWidth[1],0,boxHeight[0]])
box(0,0,1,cornerRadius, right, top);


module box(w, h, d, r, horizontal, vertical){
    
    boxFrame(w, h, d, r, horizontal, vertical);

    
    union(){
        boxTray(w, h, d, r-wallThickness);
        
        translate([boxWidth[w]/2,1,boxHeight[h]/3])
        knob();
    }
    
    
}

module boxTray(w, h, d, r){
    
    difference(){
        
        trayBlock(boxWidth[w] - 2*cornerRadius, boxHeight[h] - 2*cornerRadius, boxDepth[d]/2 - wallThickness, r-tolerance);
        
        translate([wallThickness, wallThickness, wallThickness])
        trayBlock(boxWidth[w] - 2*cornerRadius - 2*wallThickness, boxHeight[h], boxDepth[d]/2 - 2*wallThickness, r-tolerance);
        
    }
    
}

module boxFrame(w, h, d, r, horizontal, vertical){
    
    union(){
        difference(){
            
            frameBlock(w, h, d, r);
            
            translate([0, -wallThickness, 0])
            frameBlock(w, h, d, r-wallThickness);
            
            for(j = [0 : (boxDepth[d]/50)-1]){
                
                if((vertical == middle) || (vertical == bottom)){
                    for( i = [0 : (boxWidth[w]/50)-1]){
                        translate([19.5 + i*50,19.5+ j * 50, boxHeight[h]-2])
                        cube([11,11,10]);
                    }
                }
                if ((horizontal == left) || (horizontal == middle)){
                    for( i = [0 : (boxHeight[h]/50)-1]){
                        translate([boxWidth[w]-2,19.5 + j * 50, 19.5 + i * 50])
                        cube([10,11,11]);
                    }
                }
            }
            
        }
        
        for(j = [0 : (boxDepth[d]/50)-1]){
            if((vertical == top) || (vertical == middle)){
                for( i = [0 : (boxWidth[w]/50)-1]){
                    translate([20 + i*50,20 + j * 50, -wallThickness])
                    cube([10,10,1+wallThickness]);
                }
            }
            if ((horizontal == right) || (horizontal == middle)){
                for( i = [0 : (boxHeight[h]/50)-1]){
                    translate([-wallThickness,20 + j * 50, 20 + i * 50])
                    cube([1+wallThickness,10,10]);
                }
            }
        }
        
    }
        
}



    

module frameBlock(w, h, d, r){
   if( (w < len(boxWidth)) && (h < len(boxHeight)) && (d < len(boxDepth))){
        translate([cornerRadius, 0, cornerRadius])
        minkowski(){
            
            cube([boxWidth[w] - 2*cornerRadius, boxDepth[d]/2, boxHeight[h]-2*cornerRadius]);
        
            rotate([-90,0,0])
            cylinder(r = r, h = boxDepth[d]/2);   
        }
    }else{
        echo("Please choose valid parameter for width, height & depth");
    } 
}

module trayBlock(w, h, d, r){
    translate([cornerRadius, 0, cornerRadius])
    minkowski(){
            
        cube([w,d,h]);

        rotate([-90,0,0])
        cylinder(r = r, h = d);   
    }
}




module knob(){
    
    width = 30;
    height = 7;
    depth = 15;
    
    translate([-width/2+ height/2,0,0])
    rotate([90,0,0])
    hull(){
        
        cylinder(d = height, h = depth);
        
        translate([width-height,0,0])
        cylinder(d = height, h = depth);
        
    }
    
}
