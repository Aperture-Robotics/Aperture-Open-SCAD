use <utility.scad>
$fn = 100;
module cone(){
    difference(){
        cylinder(d1=50, d2=0, h=14.2);
        tyz(12.5,-1.5)      cylinder(d=3.2,h=5,$fn=100);
        tyz(-12.5,-1.5) cylinder(d=3.2,h=5,$fn=100);
    }
}
module conecurva(){
    tz(8.973)sphere(r=4.55);
    difference(){
        cone();
        tz(23)cube([20,20,20],center=true);
    }
}
conecurva();