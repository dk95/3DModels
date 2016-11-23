$fn = 30;

boxWidth = [50,100,150];
boxHeight = [50,100];
boxDepth = [100,150,200];


cornerRadius = 5;
wallThickness = 1.6;
tolerance = 0.5;


box(1,1,1,cornerRadius);

translate([boxWidth[1],0,0])
box(2,0,1,cornerRadius);

translate([boxWidth[1],0,boxHeight[0]])
box(1,0,1,cornerRadius);

translate([boxWidth[1] + boxWidth[1],0,boxHeight[0]])
box(0,0,1,cornerRadius);


module box(w, h, d, r){
    
    boxFrame(w, h, d, r);

    
    union(){
        boxTray(w, h, d, r-wallThickness);
        
        translate([boxWidth[w]/2,1,boxHeight[h]/2])
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

module boxFrame(w, h, d, r){
    
    union(){
        difference(){
            
            frameBlock(w, h, d, r);
            
            translate([0, -wallThickness, 0])
            frameBlock(w, h, d, r-wallThickness);
            
            for(j = [0 : (boxDepth[d]/50)-1]){
                for( i = [0 : (boxWidth[w]/50)-1]){
                    translate([19.5 + i*50,19.5+ j * 50, boxHeight[h]-2])
                    cube([11,11,10]);
                }
                for( i = [0 : (boxHeight[h]/50)-1]){
                    translate([boxWidth[w]-2,19.5 + j * 50, 19.5 + i * 50])
                    cube([10,11,11]);
                }
            }
            
        }
        
        for(j = [0 : (boxDepth[d]/50)-1]){
            for( i = [0 : (boxWidth[w]/50)-1]){
                translate([20 + i*50,20 + j * 50, -2])
                cube([10,10,3]);
            }
            for( i = [0 : (boxHeight[h]/50)-1]){
                translate([-2,20 + j * 50, 20 + i * 50])
                cube([3,10,10]);
            }
        }
        
    }
        
}


module slider(d, r){
    
    s = 2;
    
    linear_extrude(height = 2, convexity = 10, scale=[s,1])
    translate([(-(r/s)/2),0,0])
    square([r/s,boxDepth[d]]);
    
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
