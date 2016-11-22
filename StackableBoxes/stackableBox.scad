$fn = 30;

boxDepth = [100,150,200,250];
boxWidth = [50,100,150];
boxHeight = [25,50,75];

cornerRadius = 5;
wallThickness = 1.6;
tolerance = 0.5;


box(1,1,1,cornerRadius);


module box(w, h, d, r){
    
    *boxFrame(w, h, d, r);

    
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
    
    difference(){
        
        frameBlock(w, h, d, r);
        
        translate([0, -wallThickness, 0])
        frameBlock(w, h, d, r-wallThickness);
        
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
    depth = 10;
    
    translate([-width/2+ height/2,0,0])
    rotate([90,0,0])
    hull(){
        
        cylinder(d = height, h = depth);
        
        translate([width-height,0,0])
        cylinder(d = height, h = depth);
        
    }
    
}
