$quality = 25;

radians = false;

// deg to rad conversion factor depending on radians flag
degrad = (radians ? 180/3.141592654 : 1);

big_ring_dia = 160;
big_ring_buffer = 20;

slot_long = 20;
slot_short = 5;
slot_rounding = 0.5;
slot_spacing = 185.5;


// draw all the holes required for a 16 LED NeoPixel ring's wires
module small_ring(x, y) {
    translate([x,y]) {
		translate([-21, 0])
	        circle(1.75);	// V+
		translate([0, -21])
			circle(0.75);  // gnd
		translate([0, 21])
			circle(0.75);  // data in
		translate([15.2, 21-6])
			circle(0.75);  // data out
    }
}

module draw_ring_in_circle(radius, angle) {
	x = radius * cos(angle);
	y = radius * sin(angle);
	small_ring(x, y);
}

difference(r=slot_rounding) {
	// positive things
	union(r=5) {
		// main mounting circle
		circle((big_ring_dia + big_ring_buffer) / 2);
		// tabs to strap to solar mount
		translate([-105, -25])
			square([210, 50], r=3);
	}
	// negative things
	union() {
		// slots to strap the cover to the mount
		translate([-((slot_spacing/2)+slot_short/2), -(slot_long/2)])
			square([slot_short, slot_long], r=slot_rounding);
		translate([+(((slot_spacing/2)-slot_short)+slot_short/2), -(slot_long/2)])
			square([slot_short, slot_long], r=slot_rounding);
		// hole to run the big ring's wires through
		translate([0, -((big_ring_dia/2)-5)])
			circle(1.5);
		// holes for wires to mount/power/control the small rings
		draw_ring_in_circle(50, (360/6 * 0) / degrad);
		draw_ring_in_circle(50, (360/6 * 1) / degrad);
		draw_ring_in_circle(50, (360/6 * 2) / degrad);
		draw_ring_in_circle(50, (360/6 * 3) / degrad);
		draw_ring_in_circle(50, (360/6 * 4) / degrad);
		draw_ring_in_circle(50, (360/6 * 5) / degrad);
		small_ring(0, 0);     // center
	}
}
