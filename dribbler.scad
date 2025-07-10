use <utility.scad>
use <components.scad>

$fn = 200;
tol = 0.4;
esp = 5;

module dribbler(){
    txyz(9,-24,42) ry(-90) union(){
        motor_drib();
        roller();
    }
    color([.1,.1,.1]) dribbler_base();
}

module dribbler_base(){
    tyz(-15, 20) difference(){
        tz(7.5) cube([50,20,55],center=true);
        ty(5) difference(){
            cube([45, 25, 82], center=true);
            txy(-23,-14) rz(45) cube([15, 15, 83], center=true);
            txy(23,-14) rz(45) cube([15, 15, 84], center=true);
        }
        tyz(-9, -5) cube([25+tol,5, 15+tol], center=true);
        /*
        tyz(-9,22) ry(90) cylinder(h=44, d=42+esp,center=true);


        txyz(24.4,-3.4, 27.65) ry(90) cylinder(h=2, d1=3+tol, d2=6+tol,center=true);
        txyz(23.4,-3.4, 27.65) ry(90) cylinder(h=6, d=3+tol,center=true);

        txyz(24.4,-3.4, 16.35) ry(90) cylinder(h=2, d1=3+tol, d2=6+tol,center=true);
        txyz(23.4,-3.4, 16.35) ry(90) cylinder(h=6, d=3+tol,center=true);
        }
        difference(){
            txyz(23.55,-14,55/2+15) cube([2.9, 8, 25],center=true);
            
            txyz(24.4,-14.65, 47.65) ry(90) cylinder(h=2, d1=3+tol, d2=6+tol,center=true);
            txyz(23.4,-14.65, 47.65) ry(90) cylinder(h=8, d=3+tol,center=true);
        
            txyz(24.4,-14.65, 36.35) ry(90) cylinder(h=2, d1=3+tol, d2=6+tol,center=true);
            txyz(23.4,-14.65, 36.35) ry(90) cylinder(h=8, d=3+tol,center=true);}
            */
        txyz(-23.4,5, -10) ry(90) cylinder(h=2, d1=3+tol, d2=6+tol,center=true);
        txyz(-24.4,5, -10) ry(90) cylinder(h=2, d=3+tol,center=true);
        txyz(23.4,5, -10) ry(90) cylinder(h=2, d2=3+tol, d1=6+tol,center=true);
        txyz(24.4,5, -10) ry(90) cylinder(h=2, d=3+tol,center=true);

        
    }
    difference(){ union(){
        txyz(-11, -32.5, 10) cube([3, 5, 20], center=true);
        txyz(11, -32.5, 10) cube([3, 5, 20], center=true);
        tyz(-32.5, 4.5) cube([20, 5, 9], center=true);
        tyz(-30, 3.5) cube([25, 10, 7], center=true);}
        tyz(-30, 1.9) cube([8, 11, 4], center=true);}
}

module kick_cot(){
    tyz(-24,15){ 
        cube([25,3,15],center=true);
        txy(7, -25) cube([4,50,12],center=true);
        txy(-7, -25) cube([4,50,12],center=true);
        ty(-49) difference(){
            cube([14,2,12],center=true);
            tz(-2)rx(90) cylinder(h=5, d=3, center=true);
        }
    }
}

module roller(a = 0){
    color([.1,.1,.1]) tz(9){
        difference(){
            cylinder(h=42, d=32,center=true);
            tz(-3.3) cylinder(h=45, d=28+tol,center=true);
        for(i=[0:3]) rz(90*i) txz(8, 19) cylinder(d=3+tol, h=5,center=true);
        for(i=[0:1]) ryz(90,180*i+120) txz(-9.5, 15) cylinder(d=8+tol, h=5,center=true);
        }
    }
    if(a == 0) tz(15.3) color("Silver") motorHub();
}

module mold(){
    tx(0){
        tz(25)cylinder(h=50, d=32.2,center=true);
        tz(-3)cylinder(h=5, d=48,center=true);}
        
    tz(19+6){
        difference(){
            cylinder(h=50, d=48, center=true);
            tz(6)cylinder(h=50, d=40,center=true);
            cylinder(h=60, d=32.2+tol,center=true);}}
}
dribbler_base();