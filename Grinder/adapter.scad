$fn = 100;


adapter();

module adapter(){
    
    difference(){
        
        cylinder(h = 25, r = 6.5);
        
        translate([0,0,-2.5])
        welle();
        
        #translate([0,0,20])
        rotate([0,90,0])
        hole();
        
        #rotate([0,0,216])
        translate([-9,0,4])
        rotate([0,90,0])
        hole();
        
        #rotate([0,0,144])
        translate([-9,0,4])
        rotate([0,90,0])
        hole();
        
        #translate([-9,0,4])
        rotate([0,90,0])
        hole();
        
    }
    
}



module welle(){
    
    
    translate([0,0,14.9])
    #motorwelle();
        
    #fuenfkant();
    
}



module motorwelle(){
    
    
    radius = 3;
    hoehe = 15;
    color("red")
    difference(){
    
        cylinder(h = hoehe, d = 2*radius);
        
        translate([2.5,-radius,-1])
        cube([2*radius, 2*radius, hoehe+2]);
        
        
    
    }
    
}



module fuenfkant(){
    
    color("blue")
    cylinder(h = 12.5, d=7.6, $fn = 5);
    
    
}


module hole(){
    
    cylinder(h = 10, d = 2.6);
    
}