states = [
        "bay",
        "bw",
        "hes",
        "rp",
        "sar",
        "thu",
        "sah",
        "sac",
        "nrw",
        "nds",
        "bra",
        "ber",
        "bre",
        "ham",
        "mvp",
        "sh"
        ];

einwohner_pro_km2 = [180,300,289,202,385,133,109,220,517,164,83,3891,1578,2334,69,179];
        
data = [
        19563, //bay
        52607, //bw
        43455, //hes
        31835, //rp
        14125, //sar
        15290, //thu
        21952, //sah
        2317, //sac
        181416, //nrw
        60419, //nds
        17528, //bra
        58417, //ber
        21952, //bre
        30019, //ham
        9055, //mvp
        27549 //sh
        ];
        
versch_pro_kopf = [
        2592, 5544, 10077, 11038, 17924, 8359, 11137, 1427, 13261, 9262, 7886, 16596, 32711, 16795, 6842, 11145
        ];
 
minHeight = 10;
minValue = 2371;
maxHeight = 100;
maxValue = 181416;

baseHeight = 5;

a = (maxHeight-minHeight)/(maxValue-minValue);
echo(a);
b = minHeight - (minValue * a);
echo(b);


*germany();

map_w_data();



module map_w_data(){
   
    union(){
        
        map_base();
    
        for(i = [0:15]){
            
            translate([0,0,baseHeight-0.1])
            linear_extrude(a*data[i]+b,convexity = 10 )
            map_import(states[i]);
            
        }
    }
   
} 

module germany(){
    
    bw(10);
    bay(20);
    hes(30);
    rp(20);
    sar(10);
    nrw(20);
    nds(30);
    thu(10);
    sah(20);
    sac(30);
    bra(20);
    ber(40);
    bre(40);
    ham(40);
    mvp(20);
    sh(10);
}




module bw(h){
    color("yellow")
    linear_extrude(height = h, convexity = 10)
    map_import("bw");
}

module bay(h){
    color("blue")
    linear_extrude(height = h, convexity = 10)
    map_import("bay");
}
module hes(h){
    color("red")
    linear_extrude(height = h, convexity = 10)
    map_import("hes");
}
module rp(h){
    color("green")
    linear_extrude(height = h, convexity = 10)
    map_import("rp"); 
}
module sar(h){
    color("yellow")
    linear_extrude(height = h, convexity = 10)
    map_import("sar"); 
}
module nrw(h){
    color("brown")
    linear_extrude(height = h, convexity = 10)
    map_import("nrw"); 
}
module nds(h){
    color("gray")
    linear_extrude(height = h, convexity = 10)
    map_import("nds"); 
}
module sah(h){
    color("yellow")
    linear_extrude(height = h, convexity = 10)
    map_import("sah"); 
}
module thu(h){
    color("brown")
    linear_extrude(height = h, convexity = 10)
    map_import("thu"); 
}
module sac(h){
    color("black")
    linear_extrude(height = h, convexity = 10)
    map_import("sac"); 
}
module bra(h){
    color("red")
    linear_extrude(height = h, convexity = 10)
    map_import("bra"); 
}
module ber(h){
    color("green")
    linear_extrude(height = h, convexity = 10)
    map_import("ber"); 
}
module bre(h){
    color("red")
    linear_extrude(height = h, convexity = 10)
    map_import("bre"); 
}
module ham(h){
    color("blue")
    linear_extrude(height = h, convexity = 10)
    map_import("ham"); 
}
module mvp(h){
    color("green")
    linear_extrude(height = h, convexity = 10)
    map_import("mvp"); 
}
module sh(h){
    color("yellow")
    linear_extrude(height = h, convexity = 10)
    map_import("sh"); 
}

module map_import(l){
    
    import("C:\\Users\\dk199\\Development\\6003DPrinting\\3DModels\\GermanMap\\germany.dxf", layer = l, convexity = 10);
    
}

module map_base(){
    
    linear_extrude(height = 10, convexity = 10)
    import("C:\\Users\\dk199\\Development\\6003DPrinting\\3DModels\\GermanMap\\bg.dxf", convexity = 10);
    
}