$fn = 100;

slots = [4,5,6,7,8];
margin = 12;

length = 35;
height = 2.8;

wallHeight = 30;
wallDepth = 2;

width = sum(slots) + (len(slots) + 1) * margin;
echo(width);


arms();

module arms(){
    
    difference(){
        
        union(){
            
            cube([length, width, height]);
    
            translate([0,0,-wallHeight/3])
            cube([wallDepth, width, wallHeight]);
            
            translate([length,0,0])
            armEnd();
            
            translate([wallDepth-0.1,0,height-0.1])
            difference(){
                cube([5.1,width,5.1]);
                
                translate([5, -1,5])
                rotate([-90,0,0])
                cylinder(d = 10, h = width +  2);
            }
            translate([wallDepth-0.1,0,-4.9])
            difference(){
                cube([5.1,width,5]);
                
                translate([5, -1,0])
                rotate([-90,0,0])
                cylinder(d = 10, h = width +  2);
            }
            
            
        }
        
        for(i = [0 : len(slots)]){
            
            translate([5 + height, margin + sum_to_i(slots, i)  +  i * margin, -1])
            cube([60, slots[i], 10]);
            
        }
        
        translate([-1, 10, 15])
        rotate([0,90,0])
        cylinder(d = 3, h = 10);
        
        translate([-1, width-10, 15])
        rotate([0,90,0])
        cylinder(d = 3, h = 10);
        
    }
    
    
    
    
}

module armEnd(){
    
    translate([-1,0,15])
    difference(){
        
        rotate([-90,0,0])
        cylinder(r = 15, h = width);
        
        translate([2.5,-1,height])
        rotate([-90,0,0])
        cylinder(r = 15, h = width + 2);
        
        translate([-49,-10, -50])
        cube([50, width + 50, 100]);
        
    }
    
}


function sum(v, i=0) = 
    len(v) > i ? v[i] + sum(v, i+1) : 0;


function sum_to_i(v, mx, i=0) = 
    i < mx ? v[i] + sum_to_i(v, mx, i+1) : 0; 


