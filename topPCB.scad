$fn = 120;
use <utility.scad>
use <components.scad>
use <mirrorSup.scad>
use <camStrut.scad>
m2mm = 0.0254;

h = 40;
ballRadius = 21;
bcz = 15;
bczW = 30;
EBR = sqrt(ballRadius * ballRadius - (ballRadius - h) * (ballRadius - h));
bczy = 90 - bcz + ballRadius;
btr = 10;

module topPCB2d(a = 0) {
	difference() {
		circle(d = 170);
        if(a == 0){
        txy(-22, 61) circle(d = 4);
        txy(22, 61) circle(d = 4);
        txy(-82, 0) circle(d = 4);
        txy(82, 0) circle(d = 4);
        txy(-40, -67) circle(d = 4);
        txy(40, -67) circle(d = 4);}
        ty(75) square([120,20],center=true);
	}
}

module gabarito(){
    difference(){
        tz(-2)cylinder(h=4, d=180, center=true);
        scale([1.02,1.02,1.2]) tz(-1.5) linear_extrude(height = 1.6) topPCB2d(1);
    tz(-5) linear_extrude(height = 10) union(){
        txy(-22, 61) circle(d = 3);
        txy(22, 61) circle(d = 3);
        txy(-82, 0) circle(d = 3);
        txy(82, 0) circle(d = 3);
        txy(-40, -67) circle(d = 3);
        txy(40, -67) circle(d = 3);
    }
    }
}

module topPCBA() {
	color([ 0.2, 0.2, 0.2 ]) tz(-1.6) linear_extrude(height = 1.6) topPCB2d();

	txy(-2200 * m2mm, 1925 * m2mm) rz(90) union() {  // StepDown
		tyz(-2200 * m2mm, 9) rz(180) stepDown();
		txy(265 * m2mm, (-2200 + 460) * m2mm) rz(180) femaleHeader(2);
		txy(265 * m2mm, (-2200 - 460) * m2mm) rz(180) maleHeader(2);
		txy(-265 * m2mm, (-2200 + 460) * m2mm) rz(180) femaleHeader(2);
		txy(-265 * m2mm, (-2200 - 460) * m2mm) rz(180) maleHeader(2);
	}

	txy(-1850 * m2mm, -1800 * m2mm) tz(10) rockerSwitch();
	txy(1850 * m2mm, -1800 * m2mm) tz(10) rockerSwitch();
    
    txy(-2300 * m2mm, 0 * m2mm) union(){
	ty(0.04) STM32F405();
	txy(-14, 0) femaleHeader(2, 15);
	txy(14, 0) femaleHeader(2, 15);}

    txyz(-2300 * m2mm, 1000 * m2mm, -1) ry(180) rz(180) IDCHeader();
    
	tyz(-1700 * m2mm, -1) ry(180) rz(180) IDCHeader();

	tx(2640 * m2mm) ty(-835 * m2mm) union() {  // HC05
		ty(-1.27) tz(0.6) HC05();
		femaleHeader(6);
	}
    
    ty(1070 * m2mm) tx(2640 * m2mm) MPU6050();
    ty(1070 * m2mm) tx(2440 * m2mm) femaleHeader(1, 8);

//	tx(2085 * m2mm) rz(90) screwTerminal();

    //lcd
    ty(-2000 * m2mm) femaleHeader(4);
    tyz(-2550 * m2mm,11.5) lcd();
	txy(900 * m2mm, -2200 * m2mm) ws2812();
	txy(900 * m2mm, -2500 * m2mm) ws2812();
	txy(900 * m2mm, -2800 * m2mm) ws2812();
    
    txy(-2000 * m2mm, 1500 * m2mm) femaleHeader(4);
    txy(-1500 * m2mm, 1500 * m2mm) femaleHeader(4);
    txy(-1000 * m2mm, 1500 * m2mm) femaleHeader(4);
    
    txyz(-900 * m2mm, -2200 * m2mm, 1.6) rz(90) scale([.5,.5,.5]) pushButton();
	txyz(-900 * m2mm, -2500 * m2mm, 1.6) rz(90) scale([.5,.5,.5]) pushButton();
	txyz(-900 * m2mm, -2800 * m2mm, 1.6) rz(90) scale([.5,.5,.5]) pushButton();
    
    txy(1550*m2mm, 1100*m2mm) rz(90) union(){
    txy(0 * m2mm, -450 * m2mm) femaleHeader(6);
	txy(-100 * m2mm, 450 * m2mm) femaleHeader(4);
    tz(11) rz(-90) rcj();}
    
    for(i=[0:3]) txyz(sign(sin(45+(90*i))) * 1300 * m2mm,sign(cos(45+(90*i))) * 450 * m2mm,-1) rx(180) union(){
        ty(-300 * m2mm) kk(5);
        kk(3);
        ty(300 * m2mm) kk(4);
    }
    
    tyz(-14,10) h7(); //h7cam
    txy(-265 * m2mm, (-2200 - 460) * m2mm);
    
    txy(-2090 * m2mm, 1705 * m2mm) rz(90) capacitor1206();
    txy(-1595 * m2mm, 1705 * m2mm) rz(90) capacitor1206();
    txy(-1095 * m2mm, 1705 * m2mm) rz(90) capacitor1206();
    
    txy(2600 * m2mm, -300 * m2mm) capacitor1206();
    txyz(2600 * m2mm, 300 * m2mm, -1.6) rx(180) capacitor1206();
    
    txy(-900 * m2mm, -1950 * m2mm) rz(90) capacitor1206();
    
    txy(-2500 * m2mm, -1050 * m2mm) rz(90) capacitor1206();
    txy(-2150 * m2mm, -650 * m2mm) capacitor1206();
    
    txy(-1075 * m2mm, 1075 * m2mm) resistor1206();
    txy(-975 * m2mm, 1075 * m2mm) resistor1206();
    
    txy(-1800 * m2mm, 2150 * m2mm) rz(90) resistor1206();
    txy(-1600 * m2mm, 2150 * m2mm) rz(90) resistor1206();
    txy(-1400 * m2mm, 2150 * m2mm) rz(90) resistor1206();
    txy(-1800 * m2mm, 1950 * m2mm) rz(90) resistor1206();
    txy(-1600 * m2mm, 1950 * m2mm) rz(90) resistor1206();
    txy(-1400 * m2mm, 1950 * m2mm) rz(90) resistor1206();
    
    txy(0 * m2mm, 450 * m2mm) rz(90) capacitor1206();
    
    txy(900 * m2mm, -1950 * m2mm) rz(90) resistor1206();
    txy(1550 * m2mm, 1100 * m2mm) rz(90) capacitor1206();
    
    txy(1550 * m2mm, 1100 * m2mm) capacitor1206();
    
    rx(180) tz(-100) topSupport();
    /*tz(50) color([0,0,0,0.05]) difference(){
        cylinder(h = 40, d = 85, center = true);
        cylinder(h = 82, d = 84, center = true);
    }*/
    tz(95) rx(180) mirror_();
    color([.1,.1,.1]) cam_strut();
}

//topPCBA();
gabarito();