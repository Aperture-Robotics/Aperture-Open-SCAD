use <utility.scad>
use <components.scad>

$fn = 100;
m2mm = 0.0254;
rs = 1.1;
tol = 0.4;

module kick_strut(){
    difference(){
    union(){
        for(i=[0:3]) rz(45+90*i) tyz(39.9, 0.75){
            ty(5) rz(45)cube([12,12,1.5],center = true);
            ty(-20.2) cube([(12)*1.415,(50),1.5],center = true);
        }
        tz(0.75) cube([30,29,1.5],center = true);
        
        tyz(-2,30) cube([34,32,5],center = true);
        
        tz(12) difference(){
            tyz(-2,12) cube([34,32,48],center = true);
            tyz(1.5,2) cube([25+tol,30,70],center = true);
            ty(-4) cube([20,30,74],center = true);
            txyz(13,7.2,6.5) ry(90) cylinder(d = 3, h = 10,center = true); 
            txyz(13,-7.2,-5.5) ry(90) cylinder(d = 3, h = 10,center = true);
        }
    }
    tz(0.2) cube([30,25,2],center=true);
    }
}
//tyz(-30,40) ry(90) rxz(90,90)newBattery();
//tz(12.5) ry(90) solenoid();
kick_strut();