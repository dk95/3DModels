$fn = 100;

slotWidth = 5;
slotDepth = 4;

baseWidth = 20;
baseLength = 70;
baseHeight = 3;

sideGap = 10;

armLength = 80;
armDia = 15;


holder();

module holder(){
    
    difference(){
        
        union(){
            base();
            
            translate([0,baseLength/8])
            arm();
        }
        
        translate([0,-baseLength/2-7.5,0])
        screwHole();
        
        translate([0,baseLength/2-7.5,0])
        screwHole();
        
    }
    
}

module base(){
    
    union(){
        cube([baseWidth, baseLength, baseHeight], center = true);
        
        *translate([0,0,-baseHeight + 0.1])
        cube([slotWidth, baseLength - 2 * sideGap, slotDepth], center = true);
        
        
        
    }
    
    
}


module arm(){
    
    union(){
        cylinder(d = armDia, h = armLength);
        
        translate([0,0,armLength-1])
        cylinder(d = armDia+5, h = 3);
    }
    
}

module screwHole(){
    
    translate([0,0,-10])
    hull(){
        
        cylinder(d = 4.5, h = 20);
        
        translate([0,15,0])
        cylinder(d = 4.5, h = 20);
        
    }
    
}