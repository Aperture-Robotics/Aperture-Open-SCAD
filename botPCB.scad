$fn = 200;
use <utility.scad>
use <components.scad>
use <omniWheel.scad>
use <motorStrut.scad>
use <kickStrut.scad>

m2mm = 0.0254;

h = 10;
ballRadius = 21;
bcz = 15;
bczW = 30;
EBR = sqrt(ballRadius * ballRadius - (ballRadius - h) * (ballRadius - h));
bczy = 90 - bcz + ballRadius;
btr = 10;

module botPCB2d() {
	difference() {
		circle(d = 140);
		for (i = [0:3]) rz(45 + 90 * i) {
            ty(90) square(size = [ 50, 40 ], center = true);
            txy(12, 40) circle(d = 3);
            txy(-12, 40) circle(d = 3);
        }
	}
}

module botPCBA(a = 0) {
	color([ 0.2, 0.2, 0.2 ]) tz(-1.6) linear_extrude(height = 1.6) botPCB2d();
	for (i = [0:31]) rz(360 / 32 * i) {
        tyz(65, -1.6) rx(180) rz(90) ws2812();
        rz(360 / 64) tyz(65, -1.6) ry(180) temt6000();
    }
	for (i = [0:3]) rz(90 * i) {
        tyz(2000 * m2mm, -1.2) rx(180) rz(90) capacitor1206();
        tyz(2100 * m2mm, -1.2) rx(180) rz(90) capacitor1206();
    }

	mx() rz(45){
        tyz(65.5,22.6){ 
            rot = 65;
            ry(rot) motor();
            color([.1,.1,.1])motorStrut(rot);
            //wheelAsb();
        }
        if(a != 0)tyz(81,21)wheelAsb();
    }

    mx() rz(-135){
        tyz(65.5,22.6){ 
            rot = 65;
            ry(rot) motor();
            color([.1,.1,.1])motorStrut(rot);
            //wheelAsb();
        }
        if(a != 0)tyz(81,21)wheelAsb();
    }
        
	ty(-1771.65 * m2mm)rz(180) IDCHeader(10);

	ty(1200 * m2mm) rz(90) capacitor1206();
	tyz(1450 * m2mm, -1.6) rz(90) ry(180) resistor1206();

	for (i = [0:4]) rz(90 * i) {
        ty(2100 * m2mm) rz(90) capacitor1206();
        ty(2250 * m2mm) rz(90) capacitor1206();
    }

	txy(900 * m2mm, 300 * m2mm) rz(90) capacitor1206();
	txy(-900 * m2mm, 300 * m2mm) rz(90) capacitor1206();

	for (i = [0:1]) rz(180 * i) {
        txy(400 * m2mm, 350 * m2mm) rz(90) resistor1206();
        txy(400 * m2mm, 250 * m2mm) rz(90) resistor1206();
        txy(400 * m2mm, 150 * m2mm) rz(90) resistor1206();
        txy(400 * m2mm, 50 * m2mm) rz(90) resistor1206();
        txy(400 * m2mm, -350 * m2mm) rz(90) resistor1206();
        txy(400 * m2mm, -250 * m2mm) rz(90) resistor1206();
        txy(400 * m2mm, -150 * m2mm) rz(90) resistor1206();
        txy(400 * m2mm, -50 * m2mm) rz(90) resistor1206();

        txy(1400 * m2mm, 350 * m2mm) rz(90) resistor1206();
        txy(1400 * m2mm, 250 * m2mm) rz(90) resistor1206();
        txy(1400 * m2mm, 150 * m2mm) rz(90) resistor1206();
        txy(1400 * m2mm, 50 * m2mm) rz(90) resistor1206();
        txy(1400 * m2mm, -350 * m2mm) rz(90) resistor1206();
        txy(1400 * m2mm, -250 * m2mm) rz(90) resistor1206();
        txy(1400 * m2mm, -150 * m2mm) rz(90) resistor1206();
        txy(1400 * m2mm, -50 * m2mm) rz(90) resistor1206();
    }
    tx(-900 * m2mm) rz(90) multiplexer();
    tx(900 * m2mm) rz(90) multiplexer();
    
    tyz(-30,33) ry(90) rxz(90,90)newBattery();
    tz( 12.5) ry(90) solenoid();
    color([.1,.1,.1]) kick_strut();
}

botPCBA();
