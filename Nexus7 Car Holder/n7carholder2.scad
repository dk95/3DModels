ueberhang = 15;

$fn = 80;

armBreite = 10;
armHoehe = 10;
armLaenge = 40;

randDicke = 7;
randRadius = randDicke/2;

aufnahmeLaenge = 35;
aufnahmeHoehe = 25;

lochDicke = 2.6;
lochAbstand = 7.5;

schlitzHoehe = 30;
schlitzTiefe = 9;

halterBreite = randDicke + ueberhang + armBreite;
halterHoehe = randDicke + schlitzHoehe;
halterTiefe = schlitzTiefe + 2*randDicke;

halterVersatz = 5;


 *arm();
 //mirror([1,0,0])
gesamt();


module gesamt(){
    
    
    
    union(){
        halter();
        
        translate([halterBreite+1.2, halterTiefe-1, 12])
        rotate([0,0,-4])
        arm();
    }
    
}


module halter (){
    
    difference(){
        halterAussen();
    
        translate([11,12.6,11.5])
        rotate([-10,0,0])
        halterInnen(); 
       
        translate([11,16.6,halterHoehe-3.5])
    tiltedNegativeDonut(); 
        
        translate([11,8.6,halterHoehe-7])
        tiltedNegativeEdge ();
        
        rotate([-9,0,0])
        translate([ueberhang+randDicke+randRadius,randDicke-0.3,halterHoehe+1])
        rotate([0,90,180])
        eckenNegativ();
        
        rotate([-9,0,0])
        translate([ueberhang+randDicke+0.01,randDicke-3.8,halterHoehe+1])
        rotate([0,90,0])
        kantenNegativ(30.9);
      
        
    }
}

module halterAussen(){
    union(){
        
        hull(){
           
            translate([randRadius, randRadius, randRadius])
            sphere(d = randDicke);
            
            translate([halterBreite-armBreite, randRadius, randRadius])
            sphere(d = randDicke);
            
            translate([randRadius, randRadius + halterVersatz, halterHoehe - randRadius])
            sphere(d = randDicke);
            
            translate([halterBreite-armBreite, randRadius + halterVersatz, halterHoehe - randRadius])
            sphere(d = randDicke);
            
            translate([randRadius, halterTiefe - randRadius, randRadius])
            sphere(d = randDicke);
            
            translate([halterBreite-armBreite, halterTiefe - randRadius, randRadius])
            sphere(d = randDicke);
            
            translate([randRadius, halterTiefe - randRadius + halterVersatz, halterHoehe - randRadius])
            sphere(d = randDicke);
            
            translate([halterBreite-armBreite, halterTiefe - randRadius + halterVersatz, halterHoehe - randRadius])
            sphere(d = randDicke);
            
        }
    
        hull(){
            translate([randRadius, halterTiefe - randRadius, randRadius])
        sphere(d = randDicke);
        
        translate([randRadius, halterTiefe - randRadius + halterVersatz, halterHoehe - randRadius])
        sphere(d = randDicke);
        
        translate([halterBreite, halterTiefe - randRadius, randRadius])
        sphere(d = randDicke);
        
        translate([halterBreite, halterTiefe - randRadius + halterVersatz, halterHoehe - randRadius])
        sphere(d = randDicke);
        }
        
        hull(){
                translate([randRadius, halterTiefe - randRadius, randRadius])
            sphere(d = randDicke);
            
            
            translate([halterBreite, halterTiefe - randRadius, randRadius])
            sphere(d = randDicke);
        
            translate([randRadius, randRadius, randRadius])
            sphere(d = randDicke);
            
            translate([halterBreite-armBreite, randRadius, randRadius])
            sphere(d = randDicke);
        
        }
    
   }
    
}






module halterInnen(){
    
    hull(){
        
        sphere(d = schlitzTiefe);
        
        rotate([10,0,0])
        translate([ueberhang+armBreite-schlitzTiefe/2,-schlitzTiefe/2,-schlitzTiefe/2])
        cube([schlitzTiefe,schlitzTiefe,1]);
        
        translate([0,0,schlitzHoehe])
        cylinder(d = schlitzTiefe, h = 1);
        
        translate([ueberhang+armBreite,0,schlitzHoehe])
        cylinder(d = schlitzTiefe, h = 1);
        
    }
    
}

module tiltedNegativeDonut(){
    
    
    difference(){
        
        negativeDonut();
        
        translate([-10,-10,3.5])
        cube([20,20,10]);
        
        rotate([10,0,0])
        translate([-10,-10,-10])
        cube([20,20,10]);
        
    }
    
}

module negativeDonut (){
    difference(){
        
        cylinder(d = 16, h = 10, center = true);
        
        
        rotate_extrude(convexity = 2)
        translate([8,0,0])
        circle(d = 7);
        
        
    }
    
}

module tiltedNegativeEdge (){
    
   
    
    difference(){
        
        cube([30,16,7]);
        
        translate([-1,0,3.5])
        rotate([0,90,0])
        cylinder(d = 7, h = 32);
        
        translate([-1,16,3.5])
        rotate([0,90,0])
        cylinder(d = 7, h = 32);
        
         rotate([10,0,0])
        translate([-1,-1,-8.5])
        cube([35,25,10]);
        
    }
    
    
}

module arm (){
    
    
    union(){
        
        hull(){
            
            translate([0,0,0])
            sphere(d = armBreite/2);
            
            translate([0,armLaenge,0])
            sphere(d = armBreite/2);
            
            translate([0,0,armBreite/2])
            sphere(d = armBreite/2);
            
            translate([0,armLaenge,armBreite/2])
            sphere(d = armBreite/2);
            
            translate([-armBreite/2,0,0])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
            translate([-armBreite/2,armLaenge,0])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
            translate([-armBreite/2,0,armBreite/2])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
            translate([-armBreite/2,armLaenge,armBreite/2])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
        }
    }
    
    translate([0,aufnahmeLaenge+5,0])
    aufnahme();
    
}

module aufnahme(){
    
    difference(){
        hull(){
            
            translate([0,0,0])
            sphere(d = armBreite/2);
            
            translate([0,aufnahmeLaenge,0])
            sphere(d = armBreite/2);
            
            translate([0,0,aufnahmeHoehe-(armBreite/2)])
            sphere(d = armBreite/2);
            
            translate([0,aufnahmeLaenge,aufnahmeHoehe-(armBreite/2)])
            sphere(d = armBreite/2);
            
            translate([-armBreite/2,0,0])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
            translate([-armBreite/2,aufnahmeLaenge,0])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
            translate([-armBreite/2,0,aufnahmeHoehe-(armBreite/2)])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
            translate([-armBreite/2,aufnahmeLaenge,aufnahmeHoehe-(armBreite/2)])
            rotate([0,90,0])
            cylinder(d = armBreite/2);
            
        }
        
        translate([-1,lochAbstand,lochAbstand-2.5])
        rotate([0,90,0])
        cylinder(h = armBreite+2, d = lochDicke, center = true);
        
        translate([-1, aufnahmeLaenge - lochAbstand,lochAbstand-2.5])
        rotate([0,90,0])
        cylinder(h = armBreite+2, d = lochDicke, center = true);
        
        translate([-1, aufnahmeLaenge - lochAbstand, aufnahmeHoehe - lochAbstand-2.5])
        rotate([0,90,0])
        cylinder(h = armBreite+2, d = lochDicke, center = true);
        
        translate([-1, lochAbstand, aufnahmeHoehe - lochAbstand-2.5])
        rotate([0,90,0])
        cylinder(h = armBreite+2, d = lochDicke, center = true);
        
    }
}

module eckenNegativ (){
    
    difference(){
        
        cube([randDicke/2, randDicke/2, randDicke/2]);
        translate([(randDicke/2),(randDicke/2),(randDicke/2)])
        sphere(d = randDicke, center = true);
        
    }
    
}



module kantenNegativ(laenge){
   
   difference(){
       
       cube([laenge, randDicke/2, randDicke/2]);
       
       translate([-1,0,0])
       rotate([0,90,0])
       cylinder(h = laenge + 2, d = randDicke);
       
   } 
    
    
}

