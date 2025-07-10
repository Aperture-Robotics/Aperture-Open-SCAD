use <utility.scad>;
use <components.scad>
use <kickPCB.scad>
use <dribbler.scad>
$fn = 300;

tol = 0.4;
tir = 4.2;

m2mm = 0.0254;
h = 10;
ballRadius = 21;
bcz = 15;
bczW = 30;
EBR = sqrt(ballRadius * ballRadius - (ballRadius - h) * (ballRadius - h));
bczy = 90 - bcz + ballRadius;
btr = 10;
br = sqrt(35 ^ 2 - 25 ^ 2);

module botStrut() {
    difference(){union(){
    difference() {
        union() {
            difference() {
                tz(-4) union() {
                    cylinder(h=56, d=178 - tol);
                    tz(56) cylinder(h=10, d1=178 - tol, d2=165);
                }
                tz(52.75) {
                    txy(-82, 0) cylinder(h=5, d=3);
                    txy(82, 0) cylinder(h=5, d=3);
                    txy(-40, -67) cylinder(h=5, d=3);
                    txy(40, -67) cylinder(h=5, d=3);
                }
                tz(-5) cylinder(h=68, d=50);
                tz(-4 + 70 - 10) cylinder(h=12, d=170+tol);
                tz(-1.6) cylinder(h=78, d=142);

                tyz(95.5, 20) cube([50, 50, 50], center=true);
                tyz(90, 23.5 + 15) cube([50, 50, 80], center=true);
                tyz(85, 45) ry(90) cylinder(h=50, r=13, center=true);
                tyz(-80, 40 - 10) cube([38, 25, 40], center=true);

            for (i = [0:3]) rz(45 + 90 * i) {
            tyz(90, 23) rx(90) cylinder(
                        d=72,
                        h=40, center=true
                    );
            tyz(78, -1.6 + 30) cube([20, 25, 60], center=true);
            txyz(12, 40, -1.6) ry(180) counterSink();
            txyz(-12, 40, -1.6) ry(180) counterSink();
            }
                tyz(-1771.65 * m2mm, -1.8) cube(size=[15, 5, 4], center=true);
                tz(-1.6)for (i = [0:31]) {
                    rz(360 * i / 32) {
                        ty(65) cube(size=[6, 7, 7], center=true);
                        rz(360 / 64) { ty(65) cube(size=[3, 6, 7], center=true); }
                    }
                }

                tz(8) difference() {
                        cylinder(h=73, d=173.5 - tol);
                        cylinder(h=75, d=173.5 - tol - (2.4 + tol) * 2);
                        txz(45 + 22, 35) cube([90, 180, 76], center=true);
                        txz(-(45 + 22), 35) cube([90, 180, 76], center=true);
                    }
                tyz(-86.8, 15) rx(90) counterSink();
            }
        }
        tz(60 - 2) cylinder(h=10, d=180);
        txyz(-70, 1, 29) cube([25, 44, 60], center=true);
        txyz(27, 80, 10.2) ry(90) cylinder(h=5, d=3 + tol, center=true);
        txyz(-27, 80, 10.2) ry(90) cylinder(h=5, d=3 + tol, center=true);
    
    txyz(-78,20,41)cube([20,12,17]);
    }
    
    tz(52.75){
        txy(-82, 0) difference(){ cylinder(h=5, d=6); tz(1)cylinder(h=5, d=3);}
        txy(82, 0) difference(){ cylinder(h=5, d=6); tz(1)cylinder(h=5, d=3);}
        txy(-40, -67) difference(){ cylinder(h=5, d=6); tz(1)cylinder(h=5, d=3);}
        txy(40, -67) difference(){ cylinder(h=5, d=6); tz(1)cylinder(h=5, d=3);}
    }
    
    mx() rz(45) {
        txyz(70,13.5,33.5) cube([2.5,16,10],center=true);
        txyz(70,-13.5,13) cube([2.5,16,10],center=true);
    }
    mx() rz(-45) {
        txyz(70,-13.5,33.5) cube([2.5,16,10],center=true);
        txyz(70,13.5,13) cube([2.5,16,10],center=true);
    }
    }
    mx() rz(45){
        txyz(71,9.5,33.5) ry(90) cylinder(h=30, d=3+tol, center=true);
        txyz(71,-9.5,13) ry(90) cylinder(h=30, d=3+tol, center=true);}
        
    mx() rz(-45){
        txyz(71,-9.5,33.5) ry(90) cylinder(h=30, d=3+tol, center=true);
        txyz(71,9.5,13) ry(90) cylinder(h=30, d=3+tol, center=true);}
    }
}

module strutEdges() {
    difference() {
        tz(55) cylinder(h=10, d=180);
        tz(55) cylinder(h=10, d1=178 - tol, d2=160);
    }
}

module cap() {
    $fn = 400;
    difference() {
        tz(1) cylinder(h=72 - 20, d=178 - tol);
        cylinder(h=73, d=175 - tol);
        txz(45 + 22, 35) cube([90, 180, 76], center=true);
        txz(-(45 + 22), 35) cube([90, 180, 76], center=true);
        tyz(-85, 20) rx(90) difference(){
            cylinder(h=10, d=18, center=true);
            ty(-5) cube([20,10,20],center=true);
        }
        tx(-30) cube([60, 90, 70]);
        tyz(-85,52) cube([50, 15, 6], center=true);
    }
}

botStrut();
//ty(90) dribbler_base();