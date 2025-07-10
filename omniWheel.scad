$fn = 120;

use <utility.scad>

tol = 0.4;
tir = 4;
subCount = 20;
subThickness = 3;
subDiameter = 12;
wireDiamenter = 1;
mainDiameter = 65;
mainThickness = 8;

module oring() {
    color([0.1, 0.1, 0.1])
        torus(r1=(subDiameter - subThickness) / 2, r2=subThickness / 2);
}

module wire() {
    color([0.6, 0.6, 0.6])
        torus(r1=(mainDiameter - subDiameter) / 2, r2=wireDiamenter / 2);
}

module hub() {
    color([0.2, 0.2, 0.2]) difference() {
            union() {
                cylinder(d=15, h=12);
                tz(12) cylinder(d=28, h=3);
            }
            tz(-1) {
                cylinder(d=6, h=14);
                tx(10.5) cylinder(d=3, h=17);
                tx(-10.5) cylinder(d=3, h=17);
                ty(10.5) cylinder(d=3, h=17);
                ty(-10.5) cylinder(d=3, h=17);
            }
        }
}

module subHub() {
    difference() {
        cylinder(
            d=subDiameter - subThickness - 1, h=subThickness + tol,
            center=true
        );
        cylinder(d=wireDiamenter + tol, h=10, center=true);
        oring();
    }
}

module wheel() {
    difference() {
        rotate_extrude(angle=360) {
            tx((mainDiameter - subDiameter) / 4) square(
                    size=[(mainDiameter - subDiameter) / 2, mainThickness],
                    center=true
                );
            tx((mainDiameter - subDiameter) / 2) circle(d=mainThickness);
        }

        for (i = [0:subCount - 1]) {
            rz(360 / subCount * i) tx((mainDiameter - subDiameter) / 2) rx(90) {
                        rotate_extrude(angle=360) {
                            tx((subDiameter - subThickness) / 4)
                                square(
                                    size=[
                                        (subDiameter - subThickness) / 2,
                                        subThickness + (4 * tol),
                                    ],
                                    center=true
                                );
                            tx((subDiameter - subThickness) / 2)
                                circle(d=subThickness + 4 * tol);
                        }
                    }
        }
        rotate_extrude(angle=360) {
            tx((mainDiameter - subDiameter) / 2)
                square(wireDiamenter, center=true);
        }
        tz(1) rx(180) cylinder(d=28 + tol, h=3);
        rx(180) cylinder(d=16 + tol, h=20);
        for (i = [0:3]) {
            rz(90 * i) tx(10.5) {
                    cylinder(d=3 + tol, h=mainThickness + 2, center=true);
                    tz(-4 - tol)
                        cylinder(d1=6 + 3 * tol, d2=3 - tol, h=1.5 + 2 * tol);
                    rz(90) tz(mainThickness / 2)
                            cylinder(d=tir, h=6, center=true);
                }
        }
    }
}

module wheelAsb() {
    rx(-90) tz(-14) hub();
    rx(-90) wire();
    for (i = [0:subCount - 1]) {
        ry(360 / subCount * i) tx((mainDiameter - subDiameter) / 2) {
                color([0.2, 0.2, 0.2]) subHub();
                oring();
            }
    }
    rx(-90) color([0.2, 0.2, 0.2]) wheel();
}

module HGeo(t = 0) {
    baseD = (mainDiameter - subDiameter + wireDiamenter - t);
    tz((wireDiamenter) / 2) cylinder(d=baseD, h=10);

    tz((wireDiamenter) / 2 + 1) linear_extrude(
            height=10, scale=(baseD + 20) / baseD
        ) circle(d=baseD);
}

module wheelH(H = 1) {
    if (H == 1) {
        difference() {
            wheel();
            HGeo();
        }
    } else {
        intersection() {
            wheel();
            HGeo(2 * tol);
        }
    }
}
wheelAsb();
