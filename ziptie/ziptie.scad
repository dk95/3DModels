$fn = 30;

height = 0.6;
cornerDia = 2;
headLength = 8;
headWidth = 8;

tailLength = 70;
tailWidth = 4;
numOfTips = 35;


head();
translate([headLength,headWidth/2-tailWidth/2,0])
tail();
module head(){
    
    difference(){
    
        hull(){
            
            translate([cornerDia/2,cornerDia/2,0])
            cylinder(d = cornerDia, h = height);
            
            translate([cornerDia/2,headWidth-cornerDia/2,0])
            cylinder(d = cornerDia, h = height);
            
            translate([headLength-cornerDia/2,headWidth-cornerDia/2,0])
            cylinder(d = cornerDia, h = height);
            
            translate([headLength-cornerDia/2,cornerDia/2,0])
            cylinder(d = cornerDia, h = height);
            
        }
        
        
        translate([headLength/2+1,headWidth/2- tailWidth/2-1,-0.5])
        cube([height*1.5, tailWidth+2, 2]);
        
        translate([headLength/2-2,headWidth/2- tailWidth/2-1,-0.5])
        cube([3.5,0.6, 2]);
        
        translate([headLength/2-2,headWidth/2 + tailWidth/2+0.4,-0.5])
        cube([3.5,0.6, 2]);
    
    }
    
}

module tail(){
    union(){
        hull(){
            
            cube([1,tailWidth,height]);
            
            translate([tailLength,cornerDia/2,0])
            cylinder(d = cornerDia, h = height);
            
            translate([tailLength,tailWidth-cornerDia/2,0 ])
            cylinder(d = cornerDia, h = height);
            
        }
        
        
        for(i = [1: numOfTips -1]){
            
            translate([i * tailLength / numOfTips,tailWidth,height])
            rotate([90,0,0])
            cylinder(d=1, h = tailWidth);
            
        }
    }
    
}