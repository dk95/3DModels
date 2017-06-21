$fn = 100;

handleHeight = 35;
handleLength = 100;
handleWidth = 19;
handleThickness = 6;

nutDia = 5.8;
nutHeight = 3.5;

chamfer = 5;

thing();

module thing(){
    
    union(){
        
        handle();
        
        translate([handleWidth/2,handleWidth/2,handleThickness/2])
        pillar();
        
        
        translate([handleWidth/2,handleLength-handleWidth/2,handleThickness/2])
        rotate([0,0,180])
        pillar();
        
        
    }
    
}

module handle(){
    
    translate([chamfer/2,chamfer/2,chamfer/2])
    minkowski(){
        
        cube([handleWidth - chamfer, handleLength - chamfer, handleThickness - chamfer]);
        
        sphere(d = chamfer);   
        
    }
    
}

module pillar(){
    
    difference(){
        
        cylinder(d = handleWidth-chamfer, h = handleHeight);
        
        translate([0,0,handleHeight-18])
        cylinder(d = 4, h = 20);
        
        translate([-nutDia/2,-nutDia/2-0.5, handleHeight-8])
        cube([nutDia,15,nutHeight]);
        
    }
    
}

