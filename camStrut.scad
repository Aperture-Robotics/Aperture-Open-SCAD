use <utility.scad>

$fn = 100;
head_screw = 6;
tol = 0.4;

module cam_strut(){
    txyz(-40, -67, 5) difference(){
        cylinder(h=10, d=10, center=true);
        tz(3.9) cylinder(h=10, d=head_screw+tol, center=true);
        tz(3) cylinder(h=20, d=3+tol, center=true);
        tz(-2) cylinder(h=2, d2=head_screw+tol, d1=3+tol, center=true);
    }
    txyz(40, -67, 5) difference(){
        cylinder(h=10, d=10, center=true);
        tz(3.9) cylinder(h=10, d=head_screw+tol, center=true);
        tz(3) cylinder(h=20, d=3+tol, center=true);
        tz(-2) cylinder(h=2, d2=head_screw+tol, d1=3+tol, center=true);
    }
    txyz(-22, 61, 5) difference(){
        cylinder(h=10, d=10, center=true);
        tz(3.9) cylinder(h=10, d=head_screw+tol, center=true);
        tz(3) cylinder(h=20, d=3+tol, center=true);
        tz(-2) cylinder(h=2, d2=head_screw+tol, d1=3+tol, center=true);
    }
    txyz(22, 61, 5) difference(){
        cylinder(h=10, d=10, center=true);
        tz(3.9) cylinder(h=10, d=head_screw+tol, center=true);
        tz(3) cylinder(h=20, d=3+tol, center=true);
        tz(-2) cylinder(h=2, d2=head_screw+tol, d1=3+tol, center=true);
    }
    
    tz(25) difference(){
        cylinder(h=12, d=64, center = true);
        cylinder(h=13, d=52, center = true);
        tz(0) for(i=[0:3])rz(90*i)tx(30)ry(90)cylinder(h=5, d=3+tol,center=true);
        tz(2) difference(){
            cylinder(h=12, d=60+tol/2, center = true);
            cylinder(h=13, d=56-tol/2, center = true);
        }
    }
    
    difference(){
        txyz(-22, 39, 15.5) rx(-30) cube([8,52,8],center=true);
        tz(25) cylinder(h=20, d=62, center = true);
        tz(37) cylinder(h=12, d=70, center = true);
        txyz(-22, 61, 5) cylinder(h=50, d=10, center=true);
    }
    
    difference(){
        txyz(22, 39, 15.5) rx(-30) cube([8,52,8],center=true);
        tz(25) cylinder(h=20, d=62, center = true);
        tz(37) cylinder(h=12, d=70, center = true);
        txyz(22, 61, 5) cylinder(h=50, d=10, center=true);
    }
    
    difference(){
        txyz(27, -45, 15.5) rxz(25,30) cube([8,54,8],center=true);
        tz(25) cylinder(h=12, d=62, center = true);
        txyz(40, -67, 5) cylinder(h=10, d=10, center=true);
    }
    
    difference(){
        txyz(-27, -45, 15.5) rxz(25,-30) cube([8,54,8],center=true);
        tz(25) cylinder(h=12, d=62, center = true);
        txyz(-40, -67, 5) cylinder(h=10, d=10, center=true);
    }
    
    tyz(45, 19) difference(){
        cube([40,10,10],center=true);
        tyz(2.7,5.42) rx(60) cube([42,15,15],center=true);
    }
    
    tz(-10) difference(){
        tz(25) cylinder(h=30, d2=64, d1=170, center=true);
        tz(22) cylinder(h=30, d2=64, d1=170, center=true);
        tz(28) cylinder(h=100, d=64, center=true);

        tz(35) for(i=[0:3])rz(90*i)tx(33)ry(90)cylinder(h=50, d=10,center=true);

        txyz(-40, -67, 14) cylinder(h=11, d=10, center=true);
        txyz(40, -67, 14) cylinder(h=11, d=10, center=true);

        txyz(-22, 61, 14) cylinder(h=20, d=10, center=true);
        txyz(22, 61, 14) cylinder(h=20, d=10, center=true);

        tyz(-70, 5) cube([55,40,70],center=true);

        txyz(-47,-45.75, 5) cube([17,25,50],center=true);
        txyz(47,-45.75, 5) cube([17,25,50],center=true);

        txyz(-60,-2, 5) cube([35,45,40],center=true);
        txyz(67,7, 5) cube([16,62,38],center=true);

        txyz(40,31, 14) cube([28,34,70],center=true);

        ty(90) rx(60) cylinder(h=70,d=50);
    }
}

module mirrorSupport(){
    tz(1)color([.1,.1,.1])cylinder(d=63, h = 3,center=true);
    color([0.1,0.1,0.1]) difference(){
        cylinder(h = 4, d = 160, center = true);
        rz(60) tz(2) cylinder(h = 4, d=100, center = true, $fn=9);
        for (i = [0:9]){
            angle=360/9*i;
            txyz(59.5*cos(angle), 59.5*sin(angle),5) rz(angle+50) cube([80,3,10], center=true);
        }
    }
    color("Lightgrey") tz(-0.4) cylinder(h = 1, d = 159, center = true);
}
module topSupport(){
    $fn = 200;
    difference(){
    union(){
    tz(2) difference(){
        rx(180) mirrorSupport();
        color([.1,.1,.1])txz(12.5,-1) cylinder(h=6, d=3.2);
        color([.1,.1,.1])txz(-12.5,-1) cylinder(h=6, d=3.2);
        tz(2.5) difference(){
            color([.1,.1,.1])cylinder(d=60+tol, h = 19,center=true);
            color([.1,.1,.1])cylinder(d=56-tol, h = 11, center=true);
        }
    }
    tz(-7) color([.1,.1,.1])cylinder(d=54, h = 10);
    tz(-5) difference(){
        color([.1,.1,.1])cylinder(d=63, h = 5);
        color([.1,.1,.1])tz(-1) cylinder(d=60+tol, h = 7);
        color([.1,.1,.1])tyz(30,3) rx(90)cylinder(h=6, d=3+tol, center=true);
        color([.1,.1,.1])tyz(-30,3) rx(90)cylinder(h=6, d=3+tol, center=true);
        color([.1,.1,.1])txz(30,3) ry(90)cylinder(h=6, d=3+tol, center=true);
        color([.1,.1,.1])txz(-30,3) ry(90)cylinder(h=6, d=3+tol, center=true);
    }
    tz(-7) difference(){
        color([.1,.1,.1])cylinder(d=63, h = 2);
        color([.1,.1,.1])tz(-1) cylinder(d=50, h = 7);
    }
    }
    txz(12.5, 2.1) cylinder(d2=3+tol, d1=6+tol, h = 2);
    txz(-12.5, 2.1) cylinder(d2=3+tol, d1=6+tol, h = 2);
    txz(12.5, -7.89) cylinder(d=6+tol, h = 10);
    txz(-12.5, -7.89) cylinder(d=6+tol, h = 10);
    }
}

color([.1,.1,.1]) cam_strut();