use <utility.scad>
use <components.scad>

$fn = 100;
tol = 0.4;

module motorStrut(rot = 0) {
    ty(-12) difference() {
            union() {
                cube([45, 30, 45], center=true);
                tyz(-15, -22.5 + 1.5) cube([30, 10, 3], center=true);
                //#tz(43 / 2 + 12.5 - 5) cube([38, 30, 25 - 10], center=true);
            }
            mx() txy(22.5, 15) rz(60) cube([5, 30, 55], center=true);     
            ty(-5) rx(90) cylinder(h=34, d=42 + tol, center=true);
            rx(90) cylinder(h=70, d=16, center=true);
            ry(rot){
                ty(-10) for (i = [-120, 0, 120]) ry(i) tz(-20 - tol / 2) cube([10, 20, 3], center=true);
                mz() tyz(13.1, 15) rx(-90) counterSink();
                tyz(-11, 23) cube([30 + tol, 14, 50], center=true);
            }
            tyz(-13.4, -23) {
                tx(12) cylinder(d=3, h=5);
                tx(-12) cylinder(d=3, h=5);
                ty(5) rz(45) cube([12 + tol, 12 + tol, 3 + tol], center=true);
                ty(-1.2) cube([(12 + tol) * 1.415, (12 + tol), 3 + tol], center=true);
//            }
            }
            tyz(-10,15)cube([50,12,20],center=true);
        }
}
motorStrut(-45);
