// Round hygrometer holder.
// Hygrometer: 45mm lip OD, 40mm body OD, 15mm thick.
// U lies flat on bed (rotate_extrude axis = Z = print Z).
// Slide device in from open end; lip captured in middle channel.

$fn = 200;

// Profile (radial X, Z height). Inner stepped wall, outer straight wall.
inner_bottom_r = 17.5;     // 35mm gap at bed (front-face stop)
lip_r          = 22.75;    // 45.5mm gap (lip channel, 45mm lip + clearance)
body_r         = 20.715;   // 41.43mm gap (body channel, 40mm body + clearance)
outer_r        = 28;       // ~5mm wall outside lip channel

z_floor   = 2;             // front-stop thickness
z_lip_top = 4.5;           // floor + 2.5mm lip channel
z_top     = 8.5;           // lip_top + 4mm body channel

arc_deg = 270;             // open 90° to slide hygrometer in

profile = [
    [inner_bottom_r, 0],
    [inner_bottom_r, z_floor],
    [lip_r,          z_floor],
    [lip_r,          z_lip_top],
    [body_r,         z_lip_top],
    [body_r,         z_top],
    [outer_r,        z_top],
    [outer_r,        0],
];

rotate_extrude(angle = arc_deg)
    polygon(points = profile);
