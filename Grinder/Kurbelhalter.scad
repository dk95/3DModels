$fn = 100;

halter();

module halter(){
    
    
    
    
    difference(){
        
        color("red")
        union(){
            
            huelle();
            
            translate([0,-1,9])
            armhalter();
        }
        
        
        translate([0,0,-0.5])
        negativ();
        
        translate([0,0,12])
        arm();
        
        translate([0,15,5])
        hole();
        
    }
    
}

module negativ (){
    
    union(){
        
        ringUnten();
        
        translate([0,0,8.95])
        fuenfkant();
    }
    
}

module ringUnten(){
    
    hoehe = 9;
    dm = 13.5;
    
    cylinder(h = hoehe, d = dm);
    
}

module fuenfkant(){

    hoehe = 8;
    dm = 7.5;
    
    rotate([0,0,180])
    cylinder(h = hoehe, d = dm, $fn = 5);
    
}

module huelle (){
    
    hull(){
        
        cylinder(h = 1, d = 20);
        
        translate([0,0,15])
        sphere(d = 20);
        
    }
    
}

module arm() {
    
    dicke = 2.1;
    dm = 14;
    breite = 13;
    
    hull(){
        
        cylinder(h = dicke, d = dm);
        
        translate([0,30,0])
        cylinder(h = dicke, d = breite);
        
    }
    
}

module armhalter(){
    
    difference(){
        
        hull(){
           
           cylinder(d = 16, h = 8); 
        
           translate([0,15,0]) 
           cylinder(d = 16, h = 8);
        }
        
        
        translate([0,0,-1])
        cylinder(d = 19, h = 15);
        
    }
    
    
}

module hole(){
    
    cylinder(h = 15, d = 2.6);
    
}
