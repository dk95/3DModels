$fn = 200;

length = 45;
width = 15;
height = 5;

holeDia = 3.5;
holeLength = 6;

holeDist = 2.5;

holder();

module holder(){
    
    difference(){
    
        translate([-length/2, - width/2, 0])
        cube([length, width, height]);
        
        translate([length/2- holeDist- holeDia/2,0,-1])
        hole();
        
        translate([-(length/2- holeDist- holeDia/2),0,-1])
        hole();
        
        
        
    }
}

module hole(){
    
    hull(){
        
        translate([0,holeLength/2-holeDia/2,0])
        cylinder(d = holeDia, h = 10);
        
        translate([0,-holeLength/2+holeDia/2,0])
        cylinder(d = holeDia, h = 10);
        
    }
    
}