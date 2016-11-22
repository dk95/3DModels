//-------------------------------------------------------
// Variables
//-------------------------------------------------------

$fn = 80;

schachtBreiteVorne = 170;
schachtBreiteHinten = 155;
schachtTiefe = 125;
schachtWinkel = 96;

nexusBreite = 200;
nexusDicke = 9;
nexusRandDicke = 20;

randDicke = 7;
randDickeUnten = 5;
schlitzHoehe = 30;


armDicke = 10;
armHoehe = 10;
armLaenge = 40;

aufnahmeLaenge = 35;
aufnahmeHoehe = 25;

lochDicke = 2.6;
lochAbstand = 7.5;

halterBreite = ((nexusBreite - schachtBreiteVorne) / 2) + armDicke + randDicke;
halterTiefe = nexusDicke + 2 * randDicke + 5;
halterHoehe = schlitzHoehe + randDicke;

//---------------------------------------------------------

//mirror([1,0,0])
halter();

//translate([schachtBreiteVorne,0,0])
//mirror([1,0,0])
//halter();

//---------------------------------------------------------


module halter(){
    
    union(){
        
        nexusHalter();
        
        translate([halterBreite-armDicke,halterTiefe-5,8])
        rotate([0,0,-4])
        halterArm();
        
        translate([halterBreite-armDicke+2.45,halterTiefe+armLaenge-10,8])
        rotate([0,0,-4])
        halterAufnahme();
        
    }
    
}

module halterArm (){

    difference(){
    
        cube([armDicke, armLaenge, armHoehe]);
        
        translate([armDicke- (randDicke/2)+0.01,armLaenge+2,armHoehe- (randDicke/2)+0.01])
        rotate([0,0,270])
        kantenNegativ(armLaenge+5);
        
        translate([armDicke- (randDicke/2)+0.01,-2,(randDicke/2)-0.01])
        rotate([0,180,270])
        kantenNegativ(armLaenge+5);
    }     
}

module halterAufnahme (){
    
    difference(){
        cube([armDicke,aufnahmeLaenge,aufnahmeHoehe ]);
        
        
        translate([-0.01,(randDicke/2)-0.01, (randDicke/2)-0.01])
        rotate([180,0,0])
        kantenNegativ(10);
        
        translate([10-0.01,aufnahmeLaenge-(randDicke/2)+0.01, (randDicke/2)-0.01])
        rotate([180,0,180])
        kantenNegativ(10);
        
        translate([armDicke-(randDicke/2)+0.01,0, (randDicke/2)-0.01])
        rotate([180,0,90])
        kantenNegativ(aufnahmeLaenge);
        
        translate([armDicke-(randDicke/2)+0.01,0, aufnahmeHoehe-(randDicke/2)+0.01])
        rotate([90,0,90])
        kantenNegativ(aufnahmeLaenge);
        
        translate([-0.01,(randDicke/2)-0.01, aufnahmeHoehe-(randDicke/2)+0.01])
        rotate([90,0,0])
        kantenNegativ(10); 
        
        translate([10-0.01,aufnahmeLaenge-(randDicke/2)+0.01, aufnahmeHoehe- (randDicke/2) + 0.01])
        rotate([90,0,180])
        kantenNegativ(10);
        
        translate([armDicke-(randDicke/2) + 0.01,(randDicke/2)-0.01,aufnahmeHoehe])
        rotate([0,90,-90])
        kantenNegativ(aufnahmeHoehe);
        
        translate([armDicke-(randDicke/2) + 0.01,aufnahmeLaenge-(randDicke/2)+0.01,aufnahmeHoehe])
        rotate([0,90,0])
        kantenNegativ(aufnahmeHoehe);
        
        translate([armDicke+0.01,-0.01,-0.01])
        rotate([0,0,90])
        eckenNegativ();
        
        translate([armDicke+0.01,aufnahmeLaenge+0.01,-0.01])
        rotate([0,0,180])
        eckenNegativ();
        
        translate([armDicke+0.01,aufnahmeLaenge+0.01,aufnahmeHoehe+0.01])
        rotate([180,0,270])
        eckenNegativ();
        
        translate([armDicke+0.01,-0.01,aufnahmeHoehe+0.01])
        rotate([180,0,180])
        eckenNegativ();
        
        translate([-1,lochAbstand,lochAbstand])
        rotate([0,90,0])
        cylinder(h = armDicke+2, d = lochDicke, center = false);
        
        translate([-1, aufnahmeLaenge - lochAbstand,lochAbstand])
        rotate([0,90,0])
        cylinder(h = armDicke+2, d = lochDicke, center = false);
        
        translate([-1, aufnahmeLaenge - lochAbstand, aufnahmeHoehe - lochAbstand])
        rotate([0,90,0])
        cylinder(h = armDicke+2, d = lochDicke, center = false);
        
        translate([-1, lochAbstand, aufnahmeHoehe - lochAbstand])
        rotate([0,90,0])
        cylinder(h = armDicke+2, d = lochDicke, center = false);
        
    }
    
    
       
    
}


module nexusHalter (){
    
    difference(){
        nexusAussenSeite();
             
        translate([randDicke+3, randDicke, randDickeUnten+(nexusDicke/2)])
        rotate([-9,0,0])
        nexusInnenSeite();
    } 
}


module nexusAussenSeite (){
    
    difference(){
        cube([halterBreite, halterTiefe, halterHoehe]);
        
        translate([halterBreite-5,0,randDickeUnten-0.6])
        cube([5,randDicke + (nexusDicke/2)+1, schlitzHoehe + (nexusDicke/2)]);
        
        translate([-2, -5, 0])
        rotate([-5,0,0])
        cube([ halterBreite + 5, 5 , halterHoehe + 10]);
        
        translate([0,randDicke/2,randDicke/2-0.01])
        rotate([180,0,0])
        kantenNegativ(30);
        
        translate([randDicke/2-0.01,27,randDicke/2-0.01])
        rotate([180,0,270])
        kantenNegativ(25);
        
        translate([randDicke/2-0.01,5,halterHoehe-randDicke/2])
        rotate([0,0,90])
        kantenNegativ(20);
        
        rotate([-5,0,0])
        translate([randDicke/2,randDicke/2,35])
        rotate([0,90,180])
        kantenNegativ(33);
        
        translate([randDicke/2-0.01,halterTiefe-(randDicke/2)+0.01,35])
        rotate([0,90, 90])
        kantenNegativ(33);
        
        rotate([-1,0,0])
        translate([3,6 -0.1,halterHoehe-(randDicke/2)+0.1])
        rotate([90,0,0])
        kantenNegativ(25);
        
        translate([33,halterTiefe-(randDicke/2)+0.01,halterHoehe-(randDicke/2)+0.01])
        rotate([90,0,180])
        kantenNegativ(33);
        
        translate([33,halterTiefe-(randDicke/2)+0.01,(randDicke/2)-0.01])
        rotate([180,0,180])
        kantenNegativ(30);
        
        translate([halterBreite-(randDicke/2)+0.01,3,(randDicke/2)-0.01])
        rotate([180,0,90])
        kantenNegativ(25); 
        
        translate([halterBreite-(randDicke/2)+0.01,halterTiefe-(randDicke/2),36])
        rotate([0,90,0])
        kantenNegativ(35); 
        
        translate([halterBreite-(randDicke/2)+0.01,halterTiefe-3,halterHoehe-(randDicke/2)])
        rotate([0,0,270])
        kantenNegativ(15);
        
        translate([halterBreite-(randDicke/2)+0.01,randDicke/2,10])
        rotate([0,90,270])
        kantenNegativ(15);
        
        rotate([-5,0,0])
        translate([halterBreite-8.4,randDicke/2,37.5])
        rotate([0,90,270])
        kantenNegativ(33);
        
        translate([halterBreite-8.4,15,halterHoehe-(randDicke/2)])
        rotate([0,0,270])
        kantenNegativ(10);
        
        translate([-0.01,3,halterHoehe])
        rotate([0,90,0])
        eckenNegativ();
        
        translate([-0.01,halterTiefe+0.001,halterHoehe])
        rotate([180,0,0])
        eckenNegativ();
        
        translate([0,halterTiefe+0.001,-0.01])
        rotate([90,0,0])
        eckenNegativ();
        
        translate([-0.01,-0.01,-0.01])
        rotate([0,0,0])
        eckenNegativ();
        
        translate([halterBreite+0.01,halterTiefe,-0.01])
        rotate([0,0,180])
        eckenNegativ();
        
        translate([halterBreite+0.01,0,-0.01])
        rotate([0,0,90])
        eckenNegativ();
        
        translate([halterBreite+0.01,halterTiefe,halterHoehe])
        rotate([180,0,270])
        eckenNegativ();
       
        translate([halterBreite-4.8,3,halterHoehe])
        rotate([180,0,180])
        eckenNegativ();
        
    }      
        
}

module nexusInnenSeite (){
    
    union(){
        
        cube([nexusRandDicke + 10, nexusDicke, schlitzHoehe ]);
        
        translate([(nexusRandDicke/2)+5,(nexusDicke/2)],0)
        rotate([0,90,0])
        cylinder(h = nexusRandDicke + 10, d = nexusDicke, center = true);
        
        translate([0,(nexusDicke/2),(schlitzHoehe/2)])
        rotate([0,0,0])
        cylinder(h = schlitzHoehe, d = nexusDicke, center = true);
        
        translate([0,(nexusDicke/2),0])
        sphere(d = nexusDicke);
        
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



