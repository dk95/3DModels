$fn = 200;

length = 37;
dia = 13;
thickness = 5;


holeDia = 4.5;

spacer();

module spacer(){
    
    difference(){
        
        
        hull(){
            cylinder(d = dia + 3, h = thickness+1);
        
            translate([length-dia,0,0])
            cylinder(d = dia + 3, h = thickness+1);
        }
        
        translate([0,0,thickness])
        magnet();
        
        translate([length/2 - dia/2,0,-1])
        cylinder(d = holeDia, h = 10);
        
    }
    
    
    
    
}

module magnet(){
    
    hull(){
        
        cylinder(d = dia, h = 4);
        
        translate([length-dia,0,0])
        cylinder(d = dia, h = 4);
    }
    
}