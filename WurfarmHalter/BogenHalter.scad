$fn =100;

firstHoleDist = 36;
secondHoleDist = 67;
thirdHoleDist = 86;
margin = 5;

holeHeigth = 5;

holeDia = 9;
secondHoleDia = 10;

tilt = 17;

holderLength = 100;
holderWidth = 20;
holderThickness = 10;

bowHolder();

module bowHolder(){
    
    base();
    
    translate([0,-10,6])
    rotate([90-tilt,0,0])
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


module holder(){
    
    difference(){
        
        union(){
        
            hull(){
                
                translate([-holderWidth/2,0,-10])
                cube([holderWidth, 1, holderThickness+10]);
                
                translate([0,holderLength - holderWidth/2, 0])
                cylinder(d = holderWidth, h = holderThickness);
                
                
            }
            
            translate([0,firstHoleDist + margin,holderThickness-1])
            cylinder(d = holeDia, h = holeHeigth);
        
            translate([0,thirdHoleDist + margin,holderThickness-1])
            cylinder(d = holeDia, h = holeHeigth);
        
        }
        
        translate([0,secondHoleDist + margin,-5])
        cylinder(d = secondHoleDia, h = 20);
        
        
        
        
    }
    
}

module baseArm(){
    
    difference(){
        hull(){
                    cylinder(d = 40, h = 10);
                    
                    translate([50,0,0])
                    cylinder(d = 20, h = 10);
                   
        }
        
        translate([50,0,-1])
        cylinder(d = 5, h = 15);
        
    }
    
}