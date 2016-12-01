$fn = 50;

slots = [4,4,5,6,7,8];

gap = 12;

height = 2.8;

wallDepth = 2;
wallHeight = 30;

tipDia = 15;
conDia = 7.5;

width = 35;
length = sum(slots, len(slots)) + (len(slots) + 1) * gap;
echo(length);

rotate([0,-90,0])
holder();


module holder(){
    
    difference(){
    
        union(){
            arm();
            
            translate([-wallDepth + 0.1,0, - wallHeight/3])
            cube([wallDepth,length,wallHeight]);
            
            translate([-0.1,0,height-0.1])
            difference(){
                
                cube([conDia,length,conDia]);
                
                translate([conDia,-1,conDia])
                rotate([-90,0,0])
                cylinder(r = conDia, h = length +2);
                
            }
            
            translate([-0.1,0,-conDia+0.1])
            difference(){
                
                cube([conDia,length,conDia]);
                
                translate([conDia,-1,0])
                rotate([-90,0,0])
                cylinder(r = conDia, h = length +2);
                
            }
            
        }
        
        translate([-5,10, wallHeight/3+3])
        rotate([0,90,0])
        cylinder(d = 3, h = 10);
        
        translate([-5,length - 10, wallHeight/3+3])
        rotate([0,90,0])
        cylinder(d = 3, h = 10);
    }
    
}


module arm(){
    
    difference(){
        armBlock();
        
        for(i = [0:len(slots)]){
            
            translate([7,gap + sum(slots,i) + gap * i,-1])
            cube([width + 20, slots[i], 10]);
            
        }
        
    }
    
}


module armBlock(){
    
    
    union(){
        
        cube([width, length, height]);
        
        translate([width-1,0,tipDia/2])
        difference(){
            
            rotate([-90,0,0])
            cylinder(d = tipDia, h = length);
            
            translate([1,-1,height])
            rotate([-90,0,0])
            cylinder(d = tipDia, h = length+2);
            
            translate([-20,-1,-20])
            cube([21,length + 2, 40]);
            
        }
        
    }
}


function sum(v, to, i = 0) =
    (i < to ? v[i] + sum(v, to, i+1) : 0);

