    $fn = 120;
use <utility.scad>
use <components.scad>

m2mm = 0.0254;

module kickPCB2d(){
    txy(48.5,48.5)difference(){
        circle(r=80);
        tx(35) square([110,160],center=true);
        rz(90) tx(35) square([110,160],center=true);
        tx(-86) square([50,150],center=true);
        ty(-77) square([150,10],center=true);
    }
}

module kickPCBA(){
    color([ 0.2, 0.2, 0.2 ]) difference(){
        tz(-1.6) linear_extrude(height = 1.6)
        kickPCB2d();
    txy(-950 * m2mm, 1000 * m2mm) cylinder(h=5, d=3,center=true);
    txy(1050 * m2mm, -75 * m2mm) cylinder(h=5, d=3,center=true);}
    
    txy(850 * m2mm, 550 * m2mm) capacitor1000();
    txy(850 * m2mm, 50 * m2mm) capacitor1000();
    txy(350 * m2mm, 550 * m2mm) capacitor1000();
    txy(350 * m2mm, 50 * m2mm) capacitor1000();
    
    txy(-150 * m2mm, 150 * m2mm) rz(-90) IDCHeader();
    txyz(-250 * m2mm, 950 * m2mm, -1.6) ryz(-180, 180) screwTerminal();
    
    txy(-250 * m2mm, 650 * m2mm) rz(180) diodo10();
    txy(100 * m2mm, 1000 * m2mm) rz(180) mosfet();
    txy(700 * m2mm, 1000 * m2mm) rz(180) mosfet();
    
    txy(500 * m2mm, -500 * m2mm) rz(0) resistor1206();
    txy(500 * m2mm, -700 * m2mm) rz(0) resistor1206();
    txy(650 * m2mm, -850 * m2mm) rz(90) resistor1206();
    txy(400 * m2mm, -300 * m2mm) rz(90) resistor1206();
    txy(800 * m2mm, -250 * m2mm) rz(90) resistor1206();
    txy(650 * m2mm, 850 * m2mm) rz(90) resistor1206();
    
    txy(650 * m2mm, -550 * m2mm) rz(90) optic();
    txy(850 * m2mm, -550 * m2mm) rz(90) optic();
    txy(200 * m2mm, -300 * m2mm) rz(90) led1206();
    txyz(680 * m2mm, 200 * m2mm, -1.5) rxz(180,90) step_up();
}
kickPCBA();