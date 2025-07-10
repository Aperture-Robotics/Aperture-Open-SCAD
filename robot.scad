use <utility.scad>
use <components.scad>
use <omniWheel.scad>
use <botPCB.scad>
use <botStrut.scad>
use <topPCB.scad>
use <dribbler.scad>
use <kickPCB.scad>
//use <mirrorSup.scad>

$fn = 120;
tol = 0.4;

/* ----- Note -----
tz(-10)cylinder(h=121, d=5); //cam
tz(-10)cylinder(h=166, d=5); //mirror
tz(-10) cylinder(h=180, d=5); //max
*/


module robot() {
	botPCBA(0);
    //color([0.1, 0.1, 0.1])
    union(){
        botStrut();
        //tyz(2,11-10)cap();
    }
    //tz(58) topPCBA();
    //txyz(-67,12,32) rxyz(90,180,90) kickPCBA();
    //ty(90) color([.1,.1,.1]) dribbler_base();
    //ty(91) color([.1,.1,.1]) kick_cot();
    //ty(90) dribbler();
    //ty(90) ball();
}
$fn=60;
robot();