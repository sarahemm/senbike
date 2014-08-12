$quality = 25;

panel_holes_dia = 2.5;
panel_holes_short = 161;
panel_holes_long = 206;
edge_buffer_sides = 25;
edge_buffer_topbottom = 15;

cable_slot_fromhole = 36;
cable_slot_short = 22.5;
cable_slot_long = 40;

slot_edge_buffer_sides = 10;
slot_edge_buffer_topbottom = 25;
slot_long = 20;
slot_short = 5;
slot_rounding = 0.5;

piece_long = panel_holes_long + edge_buffer_topbottom*2;
piece_short = panel_holes_short + edge_buffer_sides*2;

difference() {
	square([piece_short, piece_long], r=7.5);
	union() {
		// holes for the panel to mount onto
		translate([edge_buffer_sides, edge_buffer_topbottom]) {
			translate([0, 0])
				circle(panel_holes_dia);
			translate([panel_holes_short, 0])
				circle(panel_holes_dia);
			translate([0, panel_holes_long])
				circle(panel_holes_dia);
			translate([panel_holes_short, panel_holes_long])
				circle(panel_holes_dia);
		}

		// slot for the cable to come out
		translate([edge_buffer_sides-6, edge_buffer_topbottom + cable_slot_fromhole])
			square([cable_slot_long, cable_slot_short], r=slot_rounding);

		// slots to attach zipties/velcro straps to tie the panel down
		translate([slot_edge_buffer_sides, slot_edge_buffer_topbottom])
			square([slot_short, slot_long], r=slot_rounding);
		translate([slot_edge_buffer_sides, piece_long - slot_edge_buffer_topbottom - slot_long])
			square([slot_short, slot_long], r=slot_rounding);
		translate([piece_short - slot_edge_buffer_sides - slot_short, slot_edge_buffer_topbottom])
			square([slot_short, slot_long], r=slot_rounding);
		translate([piece_short - slot_edge_buffer_sides - slot_short, piece_long - slot_edge_buffer_topbottom - slot_long])
			square([slot_short, slot_long], r=slot_rounding);

		// slots to attach the solar panel cover at night
		translate([slot_edge_buffer_sides, piece_long/2 - slot_long/2])
			square([slot_short, slot_long], r=slot_rounding);
		translate([piece_short - slot_edge_buffer_sides - slot_short, piece_long/2 - slot_long/2])
			square([slot_short, slot_long], r=slot_rounding);
	}
}