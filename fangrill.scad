use <MCAD/boxes.scad>

module fanGrill(y) {
	/*
	for (z = [-11:4:10])
	{
		for (x = [-8.75:4.5:9.25])
			translate([x, z, y])
				cylinder(r=1.5, h=15, center=true, $fn=6);
		for (x = [-11:4.5:11.5])
			translate([x, z+2, y])
				cylinder(r=1.5, h=15, center=true, $fn=6);
	}
	*/

	difference() {
		union() {
			difference() {	
				cylinder(r=14, h=15, center=true, $fn=6);
				cylinder(r=11, h=15, center=true, $fn=6);
			}

			difference() {	
				cylinder(r=8, h=15, center=true, $fn=6);
				cylinder(r=5, h=15, center=true, $fn=6);
			}
		}

		for (a = [0:60:180])
			rotate([0, 0, a])
				cube([30, 1.5, 15], center=true);
	}

	cylinder(r=2, h=15, center=true, $fn=6);
}

difference() {
	cube([34, 32, 12], center=true);
	translate([0, 0, 1.2])
		cube([30, 30, 12], center=true);

	translate([17, 0, -5]) cube([2, 33, 2], center=true);
	translate([-17, 0, -5]) cube([2, 33, 2], center=true);
	
	fanGrill(0);

	translate([ 12,  12, 0]) cylinder(r=2, h=15, center=true, $fn=8);
	translate([ 12, -12, 0]) cylinder(r=2, h=15, center=true, $fn=8);
	translate([-12, -12, 0]) cylinder(r=2, h=15, center=true, $fn=8);
	translate([-12,  12, 0]) cylinder(r=2, h=15, center=true, $fn=8);
}