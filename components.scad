$fn = 120;
use <utility.scad>
tol = 0.4;
tir = 4.0;
m2mm = 0.0254;
mm2m = 1 / m2mm;
pins = true;

module IDCHeader(p = 10) {
	color("DimGray") difference() {
		tz(4.5) cube([ 1.27 * p - 2.54 + 10.16, 9, 9 ], center = true);
		tz(6.5) cube([ 1.27 * p - 2.54 + 7.86, 6.5, 9 ], center = true);
		tz(6.5) ty(-4.5) cube([ 4.5, 6.5, 9 ], center = true);
	}
	if (pins) {
		color("Silver") for (x = [-(p / 4 - 0.5) *
		                         2.54:2.54:(p / 4 - 0.5) * 2.54],
		                     y = [ -1.27, 1.27 ]) tx(x) ty(y) tz(2.5)
		    cube([ 0.4, 0.4, 11 ], center = true);
	}
}

module STM32F405() {
	color("DimGray") ty(-3.81 / 2) tz(11.8)
	    cube([ 33.02, 41.91, 1.6 ], center = true);
	color("Silver") tx(5.33) ty(-22.86 + 7.5 / 2) tz(14.1)
	    cube([ 9, 7.5, 3 ], center = true);
	color("Yellow") tx(13.97) tz(10) cube([ 5.08, 38.1, 2 ], center = true);
	color("Yellow") tx(-13.97) tz(10) cube([ 5.08, 38.1, 2 ], center = true);
	if (pins) {
		color("Silver") for (x = [ -15.24, -12.7, 12.7, 15.24 ],
		                     y = [-17.78:2.54:17.78]) tx(x) ty(y) tz(7.5)
		    cube([ 0.4, 0.4, 11 ], center = true);
	}
}

module STM32H750() {
	color("DimGray") tz(11.8) cube([ 40.64, 66.88, 1.6 ], center = true);
	color("Silver") tx(7.8) ty(-66.88 / 2 + 7.5 / 2) tz(14.1)
	    cube([ 9.3, 7.5, 3 ], center = true);
	color("Silver") tx(-6.12) ty(-66.88 / 2 + 15.75 / 2) tz(13.6)
	    cube([ 14, 15.75, 2 ], center = true);
	color("Yellow") tx(17.78) tz(10) cube([ 5.08, 55.88, 2 ], center = true);
	color("Yellow") tx(-17.78) tz(10) cube([ 5.08, 55.88, 2 ], center = true);
	if (pins) {
		color("Silver") for (x = [ -16.51, -19.05, 19.05, 16.51 ],
		                     y = [-26.67:2.54:26.67]) tx(x) ty(y) tz(7.5)
		    cube([ 0.4, 0.4, 11 ], center = true);
	}
}

module STM32F411() {
	color("DimGray") linear_extrude(height = 1.6) {
		square([ 20.32, 53.34 ], center = true);
	}
}
module stepDown() {
	difference() {
		color("DimGray") translate([ 0, 0, 0.5 ])
		    cube([ 20, 27, 1 ], center = true);
		for (x = [ -265, 265 ], y = [ -460, 460 ]) {
			color("gold") translate([ x * 0.0254, y * 0.0254, 0.5 ]) {
				translate([ 0, 0, 0.5 ])
				    cube([ 200 * 0.0254, 100 * 0.0254, 0.01 ], center = true);
				translate([ 0, 0, -0.5 ])
				    cube([ 200 * 0.0254, 100 * 0.0254, 0.01 ], center = true);
				translate([ 50 * 0.0254, 0, 0 ])
				    cylinder(d = 35 * 0.0254, h = 2, center = true);
				translate([ -50 * 0.0254, 0, 0 ])
				    cylinder(d = 35 * 0.0254, h = 2, center = true);
			}
		}
		color("gold") {
			translate([ -8, 8 + 0.5, 0.5 ])
			    cylinder(d = 2, h = 2, center = true);
			translate([ 8, -8 + 0.5, 0.5 ])
			    cylinder(d = 2, h = 2, center = true);
		}
	}
	color("grey") translate([ 4, 4, 3 ]) cube([ 10, 10, 4 ], center = true);
}

module HBridge() {
	color("LimeGreen") tz(11.8) cube([ 22.86, 17.78, 1.6 ], center = true);
	color("Yellow") tx(10.16) tz(10) cube([ 2.54, 17.78, 2 ], center = true);
	color("Yellow") tx(-10.16) tz(10) cube([ 2.54, 17.78, 2 ], center = true);
	if (pins) {
		color("Silver") for (x = [ -10.16, 10.16 ], y = [-7.62:2.54:7.62]) tx(x)
		    ty(y) tz(7.5) cube([ 0.4, 0.4, 11 ], center = true);
	}
}

module MPU6050() {
	tx(-5 * 2.54 * 0.5) union() {
		color("Blue") tx(7) tz(11.8) cube([ 14, 20, 1.6 ], center = true);
		color("Yellow") tx(1.27) tz(10)
		    cube([ 2.54, 8 * 2.54, 2 ], center = true);
		if (pins) {
			color("Silver") for (x = [1.27], y = [-8.79:2.54:9.39]) tx(x) ty(y)
			    tz(7.5) cube([ 0.4, 0.4, 11 ], center = true);
		}
	}
}

module HMC5883L() {
	tx(-5 * 2.54 * 0.5) union() {
		color("Blue") tx(7) tz(11.8) cube([ 14, 5 * 2.54, 1.6 ], center = true);
		color("Yellow") tx(1.27) tz(10)
		    cube([ 2.54, 5 * 2.54, 2 ], center = true);
		if (pins) {
			color("Silver") for (x = [1.27], y = [-5.59:2.54:5.59]) tx(x) ty(y)
			    tz(7.5) cube([ 0.4, 0.4, 11 ], center = true);
		}
	}
}

module maleHeader(x = 3, y = 1) {
	color("DimGray") tz(1) cube([ x * 2.54, y * 2.54, 2 ], center = true);
	if (pins) {
		color("Silver") for (xs = [-(x / 2 - 0.5) *
		                         2.54:2.54:(x / 2 - 0.5) * 2.54],
		                     ys = [-(y / 2 - 0.5) *
		                         2.54:2.54:(y / 2 - 0.5) * 2.54]) tx(xs) ty(ys)
		    tz(2.5) cube([ 0.4, 0.4, 11 ], center = true);
	}
}

module femaleHeader(x = 3, y = 1) {
	color("DimGray") tz(4.5) difference(){
        cube([ x * 2.54, y * 2.54, 9 ], center = true);
        for (xs = [-(x / 2 - 0.5) *
		                         2.54:2.54:(x / 2 - 0.5) * 2.54],
		                     ys = [-(y / 2 - 0.5) *
		                         2.54:2.54:(y / 2 - 0.5) * 2.54]) tx(xs) ty(ys)
		    tz(3) cube([ 1.2, 1.2, 6 ], center = true);
    }
	if (pins) {
		color("Silver") for (xs = [-(x / 2 - 0.5) *
		                         2.54:2.54:(x / 2 - 0.5) * 2.54],
		                     ys = [-(y / 2 - 0.5) *
		                         2.54:2.54:(y / 2 - 0.5) * 2.54]) tx(xs) ty(ys)
		    tz(-1) cube([ 0.4, 0.4, 4 ], center = true);
	}
}

module phoenixConnector() {
	color("SeaGreen") difference() {
		tz(6) cube([ 10.16, 7.62, 12 ], center = true);

		tz(9) cube([ 11, 6, 12 ], center = true);
	}
	if (pins) {
		color("Silver") {
			tx(-2.54) tz(3) cube(size = [ 1, 1, 14 ], center = true);
			tx(2.54) tz(3) cube(size = [ 1, 1, 14 ], center = true);
		}
	}
}

module kk(s = 4) {
	color("Beige") {
		translate([ 0, 0, 3.175 / 2 ])
		    cube([ s * 2.54, 5.8, 3.175 ], center = true);
		translate([ 0, 2.4, 11.7 / 2 ])
		    cube([ (s - 1) * 2.54, 1, 11.7 ], center = true);
	}
	if (pins) {
		color("Silver") for (xs = [-(s / 2 - 0.5) *
		                         2.54:2.54:(s / 2 - 0.5) * 2.54]) tx(xs) tz(2.5)
		    cube([ 0.4, 0.4, 11 ], center = true);
	}
}

module temt6000() {
	color("PaleGreen") tz(0.226) cube([ 2, 4, 0.45 ], center = true);
	color("Gainsboro") tz(0.75) cube([ 2, 2.4, 0.6 ], center = true);

	color("Gold") txyz(0.5, -1.61, 0.23)
	    cube([ 0.6, 0.8, 0.46 ], center = true);
	color("Gold") txyz(-0.5, -1.61, 0.23)
	    cube([ 0.6, 0.8, 0.46 ], center = true);
	color("Gold") txyz(0, 1.61, 0.23) cube([ 0.75, 0.8, 0.46 ], center = true);
}

module ws2812() {
	color("White") difference() {
		tz(0.81) cube([ 5, 5, 1.6 ], center = true);

		tz(1) cylinder(h = 1.1, r = 2);
		tx(2.5) ty(-2.5) tz(1.6) rz(45) cube(1, center = true);
	}
	color("Silver") txyz(2.2, 1.6, 0.2) cube([ 1, 1, 0.4 ], center = true);
	color("Silver") txyz(-2.2, 1.6, 0.2) cube([ 1, 1, 0.4 ], center = true);
	color("Silver") txyz(2.2, -1.6, 0.2) cube([ 1, 1, 0.4 ], center = true);
	color("Silver") txyz(-2.2, -1.6, 0.2) cube([ 1, 1, 0.4 ], center = true);
}

module zh(s = 6) {
	color("Beige") {
		difference() {
			ty(-0.45) tz(2.25)
			    cube([ (s - 1) * 1.5 + 3, 3.5, 4.5 ], center = true);
			ty(-0.45) tz(3.25)
			    cube([ (s - 1) * 1.5 + 2, 2.5, 4.5 ], center = true);
			ty(-0.3) tz(4.5) cube([ (s - 1) * 1.5 + 4, 1, 3 ], center = true);
		}
	}

	if (pins) {
		color("Silver") for (xs =
		                         [-(s / 2 - 0.5) * 1.5:1.5:(s / 2 - 0.5) * 1.5])
		    tx(xs) tz(0.35) cube([ 0.4, 0.4, 6.7 ], center = true);
	}
}

module motorHub() {
	difference() {
		union() {
			cylinder(d = 10, h = 10);
			tz(10) cylinder(d = 22, h = 3);
		}
		for (r = [0:90:270]) rz(r) ty(8) tz(9) cylinder(d = 3, h = 10);
		tz(-1) cylinder(d = 4, h = 15);
        for(i = [0:1]) rxz(90,180*i+30) tyz(3,2) cylinder(d = 3, h = 4);
	}
}

module rockerSwitch() {
	color([ 0.1, 0.1, 0.1 ]) {
		tz(-5.5) cube([ 11.4, 18, 11 ], center = true);
		tz(-4.25) cube([ 6, 21, 8.5 ], center = true);
		tz(1) cube([ 15, 21, 2 ], center = true);
	}
	color("DimGray") {
		a = atan(8 / 29.5);
		tz(-1) rx(a) difference() {
			r = 26.5;
			d = sqrt(((r + 3) * (r + 3) + 8 * 8));
			r2 = sqrt((3 * 3 + 8 * 8));
			ry(90) cylinder(r = r2, h = 9, center = true);
			tz(d) ry(90) cylinder(r = 26.5, h = 10, center = true);
		}
	}
}

module XT60() {
	color("Orange") {
		linear_extrude(height = 16.3) {
			polygon(points = [
				[ 8, 4 ], [ 8, -4 ], [ -5.5, -4 ], [ -8, -1.5 ], [ -8, 1.5 ],
				[ -5.5, 4 ]
			]);
		}
	}
}

module HC05() {
	color([ 0.00, 0.40, 0.50 ]) translate([ -7.62, 0, 11 ])
	    cube([ 15.24, 36.83, 1.6 ]);
	color([ 0.1, 0.1, 0.1 ]) translate([ -7.62, 0, 8.4 ])
	    cube([ 15.24, 2.54, 2.6 ]);
}

module motor() {
        gray = "Gray";
		rx(90) difference(){
            union(){
                color(gray)cylinder(d = 41.9, h = 14);
                tz(14)color([.05,.05,.05])cylinder(d = 41.9, h = 5);
                tz(19)color([.05,.05,.05])cylinder(d1 = 41.9, d2 = 28, h = 15);
                tyz(20,23)color([.05,.05,.05])cube([21,14,13],center=true);
            }
            color(gray)ty(15)cylinder(d=3, h=5,center=true);
            color(gray)ty(-15)cylinder(d=3, h=5,center=true);
        }
        color("DimGray"){
		rx(-90) cylinder(d = 7, h = 2);
		difference() {
			ty(2) rx(-90)
			    cylinder(d = 6, h = 16.5);
			tyz(14,-3) cube([ 5, 17, 2 ], center = true);
		}
        }
}

module solenoid(){
        color([ 0.5, 0.5, 0.5 ]) difference(){
            cube([22, 27, 25], center = true);
            cube([23, 23, 21], center = true);
            txyz(6,7.25,13-5/2)cylinder(d=3, h=5, center=true);
            txyz(-6,-7.25,13-5/2)cylinder(d=3, h=5, center=true);
        }
        rx(90)color([0,0,1])cylinder(h=25,d=22,center=true);
        ty(-19) rx(-90)
        color([0.5,0.5,0.5])cylinder(d = 7.5, h = 20,center=true);
        ty(15) rx(-90)
        color([0.5,0.5,0.5])union(){
            cylinder(d = 7.5, h = 5,center=true);
            rx(90)ty(2.5)sphere(d=7.5);
        }
}

module resistor1206() {
	color([ 0.1, 0.1, 0.1 ]) { tz(0.3) cube([ 1.6, 3.2, 0.6 ], center = true); }
	color("Silver") {
		tyz(1.45, 0.3) cube([ 1.61, 0.31, 0.61 ], center = true);
		tyz(-1.45, 0.3) cube([ 1.61, 0.31, 0.61 ], center = true);
	}
}

module resistor1206_sc(rs = 1.1) {
    scale([rs,rs,rs]){
	tz(0.3) cube([ 1.6, 3.2, 0.6 ], center = true);
		tyz(1.45, 0.3) cube([ 1.61, 0.31, 0.61 ], center = true);
		tyz(-1.45, 0.3) cube([ 1.61, 0.31, 0.61 ], center = true);
    }
}

module kk(s = 4) {
	color("Beige") {
		translate([ 0, 0, 3.175 / 2 ])
		    cube([ s * 2.54, 5.8, 3.175 ], center = true);
		translate([ 0, 2.4, 11.7 / 2 ])
		    cube([ (s - 1) * 2.54, 1, 11.7 ], center = true);
	}
	if (pins) {
		color("Silver") for (xs = [-(s / 2 - 0.5) *
		                         2.54:2.54:(s / 2 - 0.5) * 2.54]) tx(xs) tz(2.5)
		    cube([ 0.4, 0.4, 11 ], center = true);
	}
}

module resistor1206Hole() { tz(0.5) cube([ 2, 3.8, 1 ], center = true); }

module capacitor1206() { tz(1) cube([ 2, 3.8, 2 ], center = true); }

module LED() {
	tx(-2.5) ty(-2.5) {
		difference() {
			color(c = [ 1, 1, 1 ]) cube([ 5, 5, 1.57 ]);

			color(c = [ 1, 1, 1 ]) translate([ 2.5, 2.5, 0.9 ])
			    cylinder(h = 1.1, r = 2, $fn = 60);
			color(c = [ 1, 1, 1 ]) translate([ 5, 0, 1.8 ]) rotate([ 0, 0, 45 ])
			    cube(1.1, center = true);
		}
		color(c = [ 0.4, 0.4, 0.4 ]) translate([ -0.2, 0.4, 0 ])
		    cube([ 0.9, 0.9, 0.37 ]);
		color(c = [ 0.4, 0.4, 0.4 ]) translate([ -0.2, 3.7, 0 ])
		    cube([ 0.9, 0.9, 0.37 ]);
		color(c = [ 0.4, 0.4, 0.4 ]) translate([ 4.3, 0.4, 0 ])
		    cube([ 0.9, 0.9, 0.37 ]);
		color(c = [ 0.4, 0.4, 0.4 ]) translate([ 4.3, 3.7, 0 ])
		    cube([ 0.9, 0.9, 0.37 ]);
		color([ 0.2, 0.2, 0.2 ]) translate([ 2.6, 2.4, 0.67 ])
		    cube([ 0.9, 0.7, 0.4 ]);
		color(c = [ 1, 1, 1, 0.7 ]) translate([ 2.5, 2.5, 0 ])
		    cylinder(h = 1.57, r = 2, $fn = 60);
	}
}

module capacitor1206() {
	color("Sienna") { tz(0.8) cube([ 1.6, 3.2, 1.6 ], center = true); }
	color("Silver") {
		tyz(1.45, 0.8) cube([ 1.61, 0.31, 1.61 ], center = true);
		tyz(-1.45, 0.8) cube([ 1.61, 0.31, 1.61 ], center = true);
	}
}

module ball(){
    $fn=50;
    tz(12) color("Orange") sphere(d=42);
}

module battery() {
	color("MidnightBlue") cube(size = [ 115, 35, 25 ], center = true);
}

module mirror_(){
    color("Silver")cylinder(h=15, d1=50, d2=0);
}

module newBattery(){
    color("MidnightBlue") cube(size = [100, 18, 15], center = true);
}

module capacitor1000(){
    tz(20/2)union(){
        color("Black")difference(){
            cylinder(h=20, d=13,center=true);
            cylinder(h=21, d=8,center=true);
        }
        color("Gainsboro")cylinder(h=19.5, d=8,center=true);
        txz(2.5,-11.5) color("Gainsboro") cube([0.5,0.5,3],center=true);
        txz(-2.5,-11.5) color("Gainsboro") cube([0.5,0.5,3],center=true);
    }
}

module diodo10(){
    tz(9/2)color([.1,.1,.1])cube([10,4.5,9],center=true);
    tyz(-0.75,12)color([.1,.1,.1])difference(){
        cube([10,3,6],center=true);
        rx(90)cylinder(h=5, d=3, center=true);
    }
    txz(3,-2) color("Gainsboro") cube([0.6,0.6,4],center=true);
        txz(-3,-2) color("Gainsboro") cube([0.6,0.6,4],center=true);
}

module mosfet(){
    tz(9/2)color([.1,.1,.1])cube([10,4.5,9],center=true);
    tyz(-0.75,12)color("Gainsboro")difference(){
        cube([10,3,6],center=true);
        rx(90)cylinder(h=5, d=3, center=true);
    }
    txz(3,-2) color("Gainsboro") cube([0.6,0.6,4],center=true);
        txz(-3,-2) color("Gainsboro") cube([0.6,0.6,4],center=true);
}

module led1206() {
	color("Ivory") difference() {
		tz(0.25) cube(size = [ 1.6, 3.2, 0.5 ], center = true);
		ty(1.6) cylinder(d = 0.7, h = 11., center = true);
		ty(-1.6) cylinder(d = 0.7, h = 11., center = true);
	}
	color([ 0.9, 0.9, 0.9, 0.5 ]) tz(0.8)
	    cube(size = [ 1.6, 2, 0.6 ], center = true);
}

module multiplexer(){
    color([.1,.1,.1])tz(0.6)cube([8,4.5,1.2], center=true);color("Silver") {
        for(i=[-5:4])txyz(i*0.7+0.7/2, 2.7, 0.3/2) cube([ 0.4, 1, 0.3 ], center = true);
        for(i=[-5:4])txyz(i*0.7+0.7/2, -2.7, 0.3/2) cube([ 0.4, 1, 0.3 ], center = true);
    }
}

module optic() {
	color([ 0.1, 0.1, 0.1 ]) tz(1.75)
	    cube(size = [ 6.5, 4.58, 3.5 ], center = true);
	color("Silver") {
		tyz(1.27, 0.16) cube([ 10, 1.2, 0.3 ], center = true);
		tyz(-1.27, 0.16) cube([ 10, 1.2, 0.3 ], center = true);
	}
}

module h7(){
    //board
    color("Red")cube([35.5,44.5,1.6],center=true);
    txyz(-16,-12,-0.5) rz(90) rx(180) femaleHeader(8);
    txyz(16,-12,-0.5) rz(90) rx(180) femaleHeader(8);
    color([ 0.1, 0.1, 0.1 ]) txyz(-9.5,2.2,1.5) cube([8,5.5,1],center=true);
    color([ 0.1, 0.1, 0.1 ]) txyz(3,5.5,1.5) cube([10,10,1],center=true);
    color([ 0.1, 0.1, 0.1 ]) txyz(-1.3,-8,1.5) cube([13,9,1],center=true);
    color("LightSlateGray") txyz(9,-21,2) cube([7,5,2.4],center=true);
    color("Ivory") txyz(-10.5,-19,3) cube([6,7,4.5],center=true);
    
    //cam
    color("DarkSlateGray") txyz(0,13.9,5) cube([31,6,2], center=true);
    color("DarkSlateGray") mx() txyz(15.3,13.9,4) cylinder(d=6, h=2);
    color("Gray") mx() txyz(15.3,13.9,5) cylinder(d=4, h=2);
    color("DarkSlateGray") mx() txyz(15.3,13.9,0) cylinder(d=4.5, h=4);
    
    color("DarkSlateGray") mx() txyz(9.9,13.9,3.75) cylinder(d=4, h=9.5);
    color("DarkSlateGray") mx() txyz(7.7,13.9,8.5) cube([4,4,9.5], center=true);
    color("DarkSlateGray") txyz(0,13.9,8.5) cube([17,17,9.5], center=true);
    color("DarkSlateGray") txyz(0,13.9,13) cylinder(d=15.5, h=6.7);
    color("DarkSlateGray") txyz(0,13.9,19) cylinder(d=12, h=8);
    color("DarkSlateGray") txyz(0,13.9,26.8) cylinder(d=14, h=4);
    color("Lightgray") txyz(0,13.9,30) cylinder(d=10, h=1);
}

module pushButton() {
    color([ 0.1, 0.1, 0.1 ]) cube([12,12,6.5], center=true);
    color("Silver") tz(3.5) cube([12,12,0.5], center=true);
    color("Silver") my() txyz(3.5,6.6,-4.5) cube([1.2,1.2,5], center=true);
    color("Silver") my() txyz(-3.5,6.6,-4.5) cube([1.2,1.2,5], center=true);
    color([ 0.1, 0.1, 0.1 ]) tz(3) cylinder(d=6.7, h=4);
    color([ 0.1, 0.1, 0.1 ]) mx() my() txyz(4,4,3.5) cylinder(d=2.5, h=0.5);
}

module lcd(){
    tyz(14.75,-0.5) rx(180) maleHeader(4);
    color([0.2,0.2,0.2]) tz(1.25) cube([34.9, 23, 1.5], center=true);
    difference(){
        color("#236dbe") cube([35,33.5,1], center=true);
        ty(-14.5) cube([14, 5, 5], center=true);
        mx() my() txy(15.2,14.35) cylinder(h=10, d=3);
    }
}

module rcj(){
    mx() scale([.25,.25,.2]) txyz(44,-60,11) pushButton();
    tyz(-11,4) rx(180) maleHeader(4);
    txy(11.5,-0.5) ry(180) rz(90) maleHeader(6);
    txy(-11.5,-3) ry(180) rz(90) maleHeader(4);
    
    color("FloralWhite") tyz(0.5,0.75) cube([15,25,1.5],center=true);
    color("FloralWhite") mx() txyz(10,-2.5,0.75) cube([5,31,1.5],center=true);
    color([0.1,0.1,0.1]) tyz(10.25,2) cube([13.3,16.5,1],center=true);
    color("Lightgray") tyz(8,3.25) cube([13.3,10.75,1.5],center=true);
    
    color("#236dbe") tyz(-0.5,5.25) cube([15,24,1.5],center=true);
    color("#236dbe") mx() txyz(10,0.5,5.25) cube([5,26,1.5],center=true);
    
    color("#242137") tyz(-1,7.65) cube([25,13,1.5],center=true);
    color([0.1,0.1,0.1]) tyz(7.5,7.65) cube([15,4,1.5],center=true);
    color("LightGray") mx() txyz(10,7.5,7.65) cube([5,4,1.5],center=true);
    color([0.1,0.1,0.1]) tyz(0.75,6.5) cube([20,8.25,1],center=true);
}

module step_up(){
difference(){
  color("MidnightBlue") tz(1)cube([43,21,2],center=true);
    txy(15.5,-7.5)cylinder(h=5,d=3,center=true);
    txy(-15.5,7.5)cylinder(h=5,d=3,center=true);}
  color([0.1,0.1,0.1]) txyz(6,4,4.5)cube([11,11,7.5],center=true);
 color("RoyalBlue")  txyz(6.3,-7,7)cube([9.5,4,11],center=true);
 color("Gold")  txyz(10,-8,12.2)cylinder(h=1.5,d=2);
 color([0.1,0.1,0.1])  txyz(-6.5,4.5,3.5)cube([10,7,6.8],center=true);
 color([0.1,0.1,0.1])  txyz(-9.75,-7.75,3.3)cube([3.8,2.2,2.5],center=true);
 color("silver")  txyz(-6.5,9,2.8)cube([10,2,1.4],center=true);
 
 color("silver")  txyz(-10.05,-2,2.8)cube([0.8,6,1.4],center=true);
 color("silver")  txyz(-8.35,-2,2.8)cube([0.8,6,1.4],center=true);
 color("silver")  txyz(-6.6,-2,2.8)cube([0.8,6,1.4],center=true);
 color("silver")  txyz(-4.9,-2,2.8)cube([0.8,6,1.4],center=true);
 color("silver")  txyz(-3.25,-2,2.8)cube([0.8,6,1.4],center=true);
 
  color("silver") txz(17,7)cylinder(h = 10,d = 7.7,center=true);
   color("silver")txz(-17.5,7)cylinder(h = 10,d = 7.7,center=true);
  color("silver") txyz(-20,9,2.05)cube([3,3,0.1],center=true);
   color("silver") txyz(20,9,2.05)cube([3,3,0.1],center=true);
    color("silver") txyz(-20,-9,2.05)cube([3,3,0.1],center=true);
     color("silver") txyz(20,-9,2.05)cube([3,3,0.1],center=true);
}

module motor_drib(){
    $fn=180;
    difference(){
        union(){
    color("Silver")cylinder(h=16,d=27.7,center=true);
    tz(10.5)color("Gold")difference(){
        union(){
        tz(1.25)cylinder(h=4.5,d1=27.7, d2=19,center=true);
        tz(-1.75)color("Gold")cylinder(h=1.5,d=27.7,center=true);
        tz(3.75)cylinder(h=2,d=9,center=true);
        }
        for(i=[0:3])rz(90*i)ty(7.5) cylinder(h=10,d=6,center=true);
    }
    tz(20.5)color("Silver")cylinder(h=12,d=3,center=true);
    tz(-10.5)color("Gold")difference(){
        cylinder(h=5,d2=27.7, d1=24,center=true);
        for(i=[0:3])rz(90*i)tyz(18,-1)cylinder(h=4, r=10, center=true);
        for(i=[0:3])rz(90*i+45)tyz(8,-1)cylinder(h=4,d=3, center=true);
    }}
    cylinder(d=23.7, h=20,center=true);
    }
    for(i=[0:15]) rz(i*360/16) tx(9) color("IndianRed")cylinder(h=20, d=4, center=true);
}

module screwTerminal(n = 2) {
	difference() {
		color("SteelBlue") tyz(-0.4, 5)
		    cube(size = [ 5 * n, 7.6, 10 ], center = true);
		for (i = [-(n - 1) / 2:(n - 1) / 2]) tx(5 * i) {
				tyz(3.4, 2.5 + 0.8) cube([ 4, 3, 5 ], center = true);
				tz(7.5) cylinder(d = 3, h = 10);
				tz(2.5 + 0.8) color("Silver") rx(90)
				    cylinder(d = 3, h = 7, center = true);
			}
	}
	color("Silver") for (i = [-(n - 1) / 2:(n - 1) / 2]) txz(5 * i, -4)
	    cylinder(d = 1, h = 5);
}

motorHub();