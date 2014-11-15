use <MCAD/boxes.scad>

module cutShaft(x) {
	rotate([90, 0, 0]) {
		// Bearings
		//translate([x, -4, 29])
			//cylinder(r=9, h=29, center=true, $fn=36);
		translate([x, -4, 0])
			cylinder(r=10, h=55, center=true, $fn=36);

		// Rods
		translate([x, -4, 0])
			cylinder(r=5.2, h=81, center=true, $fn=20);
	}

	translate([x, 0, -10]) {
		cube([10.4, 81, 12], center=true);
		cube([20, 55, 12], center=true);
	}
}

module airDuct(y1, y2) {
	polyhedron(
		points=[[ 14, y1, -12], [-14, y1, -12], 
				  [-10, y2, -12], [ 10, y2, -12],
				  [ 14, y1,  15], [-14, y1,  15], 
				  [-10, y2,  15], [ 10, y2,  15]],
				  
		faces=[[3, 2, 1, 0], [0, 1, 5, 4], [1, 2, 6, 5],
				 [2, 3, 7, 6], [4, 7, 3, 0], [4, 5, 6, 7]]
	);

	rotate([10, 0, 0])
		translate([0, 5, 2])
			cube([14, 8, 30], center=true);
	rotate([-10, 0, 0])
		translate([0, -5, 2])
			cube([14, 8, 30], center=true);
}

module grillSlot(y) {
	translate([0, y, 4])
		cube([28, 5, 30], center=true);
}

difference() {
	roundedBox([80, 80, 30], 6, true, $fn=40);

	cutShaft(-27);
	cutShaft(27);
	
	// Cut extruder
	translate([0, 15, 2])
		cylinder(r=11.5, h=30, center=true, $fn=46);
	translate([0, -15, 2])
		cylinder(r=11.5, h=30, center=true, $fn=46);
	translate([0, 15, -13])
		cylinder(r=2.5, h=4, center=true, $fn=10);
	translate([0, -15, -13])
		cylinder(r=2.5, h=4, center=true, $fn=10);

	// Cut fan slots
	translate([0, -33.5, 2])
		cube([32, 10.5, 30], center=true);
	translate([0, 33.5, 2])
		cube([32, 10.5, 30], center=true);

	// Cut air ducts
	airDuct(-28.5, -20);
	airDuct( 28.5,  20);

	// Cut fan grill slots
	grillSlot(38);
	rotate([0, 0, 180])
		grillSlot(38);

	// Make screwholes
	translate([-36,  36, 0]) cylinder(r=1.5, h=31, center=true, $fn=6);
	translate([-12,   0, 0]) cylinder(r=1.5, h=31, center=true, $fn=6);
	translate([-36, -36, 0]) cylinder(r=1.5, h=31, center=true, $fn=6);
	translate([ 36, -36, 0]) cylinder(r=1.5, h=31, center=true, $fn=6);
	translate([ 12,   0, 0]) cylinder(r=1.5, h=31, center=true, $fn=6);
	translate([ 36,  36, 0]) cylinder(r=1.5, h=31, center=true, $fn=6);

	//fanGrill(-40);
	//fanGrill(40);
}
