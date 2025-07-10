module tx(x) { translate([ x, 0, 0 ]) children(); }
module ty(y) { translate([ 0, y, 0 ]) children(); }
module tz(z) { translate([ 0, 0, z ]) children(); }
module txy(x, y) { translate([ x, y, 0 ]) children(); }
module txz(x, z) { translate([ x, 0, z ]) children(); }
module tyz(y, z) { translate([ 0, y, z ]) children(); }
module txyz(x, y, z) { translate([ x, y, z ]) children(); }
module rx(x) { rotate([ x, 0, 0 ]) children(); }
module ry(y) { rotate([ 0, y, 0 ]) children(); }
module rz(z) { rotate([ 0, 0, z ]) children(); }
module rxy(x, y) { rotate([ x, y, 0 ]) children(); }
module rxz(x, z) { rotate([ x, 0, z ]) children(); }
module ryz(y, z) { rotate([ 0, y, z ]) children(); }
module rxyz(x, y, z) { rotate([ x, y, z ]) children(); }
module mx() {
	mirror([ 1, 0, 0 ]) children();
	children();
}
module my() {
	mirror([ 0, 1, 0 ]) children();
	children();
}
module mz() {
	mirror([ 0, 0, 1 ]) children();
	children();
}
module mxy() {
	mirror([ 1, 1, 0 ]) children();
	children();
}
module torus(r1, r2) { rotate_extrude(angle = 360) tx(r1) circle(r = r2); }

module tri(side = 10, center = false) {
	if (center) {
		polygon(points =
		            [for (i = [0:2])[side / 2 / sin(60) * sin(120 * i + 0),
		                             side / 2 / sin(60) * cos(120 * i + 0)]]);
	} else {
		polygon(points = [
			[ 0, 0 ], [ side * cos(30), side / 2 ],
			[ side * cos(30), -side / 2 ]
		]);
	}
}

module rsquare(size = [ 10, 10 ], r = 2) {
	union() {
		square([ size.x, size.y - 2 * r ], center = true);
		square([ size.x - 2 * r, size.y ], center = true);
		translate([ size.x / 2 - r, size.y / 2 - r ]) circle(r = r);
		translate([ size.x / 2 - r, -size.y / 2 + r ]) circle(r = r);
		translate([ -size.x / 2 + r, size.y / 2 - r ]) circle(r = r);
		translate([ -size.x / 2 + r, -size.y / 2 + r ]) circle(r = r);
	}
}

module counterSink(screwDiameter = 3, tol = 0.4, height = 3) {
	union() {
		cylinder(r1 = (screwDiameter + tol) / 2,
		         r2 = (screwDiameter + tol) / 2 + height, h = height);
		cylinder(r = (screwDiameter + tol) / 2, h = height * 2, center = true);
	}
}

module skew(sk = [ 0, 0 ]) {
	multmatrix([
		[ 1, 0, sk.x, 0 ],
		[ 0, 1, sk.y, 0 ],
		[ 0, 0, 1, 0 ],
		[ 0, 0, 0, 1 ],
	]) children();
}
