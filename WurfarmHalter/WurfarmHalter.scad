$fn = 50;

armWidth = 40;
armThickness = 10;
holderLength = 80;
holderThickness = 10;
shellWidth = 2;

holeOuterDia = 10;
holeInnerDia = 9.5;

screwHoleDia = 7;

firstHoleDist = 15.5;
screwHoleDist = 36;
secondHoleDist = 66;

wurfarmHalter();

module wurfarmHalter(){
    
    
    
    base();
    
    translate([-shellWidth - armWidth/2,8,4])
    rotate([70,0,0])
    holder();
    
}

module base(){
    
    
    union(){
         
        rotate([0,0,0])
        baseArm();
        
        
        rotate([0,0,90])
        baseArm();
        
        rotate([0,0,180])
        baseArm();
        
        rotate([0,0,270])
        baseArm();
           
           
    }
    
    
    
}

module baseArm(){
    
    difference(){
        hull(){
                    cylinder(d = 40, h = 10);
                    
                    translate([40,0,0])
                    cylinder(d = 20, h = 10);
                   
        }
        
        translate([40,0,-1])
        cylinder(d = 5, h = 15);
        
    }
    
}



module holder(){
    
    difference(){
        cube([armWidth + 2* shellWidth, holderLength + shellWidth * 2, holderThickness + armThickness]);
        
        translate([shellWidth, shellWidth*2, holderThickness])
        cube([armWidth, holderLength  + shellWidth, holderThickness + armThickness]);
        
        translate([armWidth/2 + shellWidth*2, shellWidth + firstHoleDist, shellWidth])
        hole();
        
        translate([armWidth/2 + shellWidth*2, shellWidth + secondHoleDist, shellWidth])
        hole();
        
        translate([armWidth/2 + shellWidth*2, shellWidth + screwHoleDist, -1])
        cylinder(d = screwHoleDia, h = 20);
        
    }
    
    
}

module hole(){
    
    difference(){
        
        cylinder(d = holeOuterDia, h = 15);
        
        *translate([0,0,-1])
        cylinder(d = holeInnerDia, h = 20);
        
    }
    
}