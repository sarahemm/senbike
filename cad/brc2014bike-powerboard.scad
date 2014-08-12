$quality = 25;

slot_long = 20;
slot_short = 5;
slot_rounding = 0.5;

module powerboost(x, y) {
	wide_hole_spacing = 16.5;
	close_hole_spacing = 13;
	holes_apart_spacing = 23;

    translate([x,y]) {
		translate([-(wide_hole_spacing/2), -(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([+(wide_hole_spacing/2), -(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([-(close_hole_spacing/2), +(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([+(close_hole_spacing/2), +(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([-10.75, -8])
			square([5, 15], r=slot_rounding);
    }
}


module powerboost_rev(x, y) {
	wide_hole_spacing = 13;
	close_hole_spacing = 16.5;
	holes_apart_spacing = 23;

    translate([x,y]) {
		translate([-(wide_hole_spacing/2), -(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([+(wide_hole_spacing/2), -(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([-(close_hole_spacing/2), +(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([+(close_hole_spacing/2), +(holes_apart_spacing / 2)])
	        circle(1.5);
		translate([+5.75, -7])
			square([5, 15], r=slot_rounding);
    }
}


module powercell(x, y) {
	holes_y_spacing = 17.5;
	holes_x_spacing = 20.5;

	translate([x,y]) {
		translate([-(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([-(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
		translate([-12.75, -5])
			square([5, 10], r=slot_rounding);
		translate([+7.75, -5])
			square([5, 10], r=slot_rounding);
	}
}


module charger(x, y) {
	holes_y_spacing = 35.5;
	holes_x_spacing = 25.5;

	translate([x,y]) {
		translate([-(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([-(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
		translate([-5, +8])
			square([10, 10], r=slot_rounding);
	}
}

module fadecandy(x, y) {
	holes_y_spacing = 20.5;
	holes_x_spacing = 19.5;

	translate([x,y]) {
		translate([-(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([-(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
		translate([13, -10.5])
			square([5, 21], r=slot_rounding);
	}
}

module battery(x, y) {
	holes_y_spacing = 38;
	holes_x_spacing = 53;

	translate([x,y]) {
		translate([-(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([-(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), -(holes_y_spacing / 2)])
	        circle(1.5);
		translate([+(holes_x_spacing/2), +(holes_y_spacing / 2)])
	        circle(1.5);
	}
}


difference(r=slot_rounding) {
	// positive things
	union(r=5) {
		translate([-20, -15])
			square([160, 130], r=5);
	}
	// negative things
	union() {
		powercell(20, 14);
		powerboost(50, 14);

		charger(50, 50);
		fadecandy(14, 60);

		powercell(20, 86);
		powerboost_rev(50, 86);

		battery(100,50);

		// hole for the power switch
		translate([100, 90])
			circle(5);

		// slots to mount onto rack or solar mounting plate
		translate([-10, -2]) {
			square([slot_short, slot_long], r=slot_rounding);
			translate([0, 83])
				square([slot_short, slot_long], r=slot_rounding);
		}
		translate([+125, -2]) {
			square([slot_short, slot_long], r=slot_rounding);
			translate([0, 83])
				square([slot_short, slot_long], r=slot_rounding);
		}
	}
}
