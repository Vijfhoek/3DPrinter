use <MCAD/boxes.scad>

module cutShaft(x) {
	rotate([90, 0, 0]) {
		// Bearings
		translate([x, -4, 29])
			cylinder(r=9, h=29, center=true, $fn=36);
		translate([x, -4, -29])
			cylinder(r=9, h=29, center=true, $fn=36);

		// Rods
		translate([x, -4, 0])
			cylinder(r=5.2, h=40, center=true, $fn=20);
	}

	translate([x, 0, -10])
		cube([10.4, 81, 12], center=true);
}

difference() {
	roundedBox([80, 80, 30], 6, true, $fn=40);

	cutShaft(-27);
	cutShaft(27);
	
	// Cut extruder
	translate([0, 13, 0])
		cylinder(r=11.5, h=30, center=true, $fn=46);
	translate([0, -13, 0])
		cylinder(r=11.5, h=30, center=true, $fn=46);

	// Cut fan slots
	translate([0, -32.5, 1])
		cube([30, 10, 30], center=true);
	translate([0, 32.5, 1])
		cube([30, 10, 30], center=true);
}
