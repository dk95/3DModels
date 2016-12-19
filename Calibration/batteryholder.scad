$fn = 50;

batDia = 8.4;
batHeight = 44.5;

rows = 4;
cols = 4;

shellWidth = 1.6;
shellHeight = 1.2;

topHeight = 10;

box(batHeight - topHeight);

module box(height){
    
    difference(){
    
        hull(){
            
            cylinder(d = batDia + shellWidth + 1, h = height + shellHeight);
            
            translate([(rows - 1) * batDia,0,0])
            cylinder(d = batDia + shellWidth  + 1, h = height + shellHeight);
            
            translate([(rows - 1) * batDia,(cols - 1) * batDia,0])
            cylinder(d = batDia + shellWidth + 1, h = height + shellHeight);
            
            translate([0,(cols - 1) * batDia,0])
            cylinder(d = batDia + shellWidth  + 1, h = height + shellHeight);
            
        }
        
        for(i = [0 : rows-1]){
            
            for(j = [0 : cols-1]){
                
                translate([i * batDia, j*batDia, shellHeight])
                cylinder(d = batDia + 1, h = batHeight);
                
            }
            
        }
        
    }
    
}

