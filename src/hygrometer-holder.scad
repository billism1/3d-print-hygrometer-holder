// Round hygrometer holder.
// Hygrometer: 45mm lip OD, 40mm body OD, 15mm thick.
// U lies flat on bed (rotate_extrude axis = Z = print Z).
// Shape: 180° arc + two tangent straight extensions = U.
// Slide device in from open end; lip captured in middle channel.

$fn = 200;

// Profile (radial X, Z height). Inner stepped wall, outer straight wall.
inner_bottom_r = 17.5;     // 35mm gap at bed (front-face stop)
lip_r          = 22.75;    // 45.5mm gap (lip channel, 45mm lip + clearance)
body_r         = 20.715;   // 41.43mm gap (body channel, 40mm body + clearance)
outer_r        = 28;       // ~5mm wall outside lip channel

z_floor   = 2;             // front-stop thickness
z_lip_top = 3.6;             // floor + 2.5mm lip channel
z_top     = 8.5;           // lip_top + 4mm body channel

arm_length = 20;            // straight tangent extension on each side

overhang_angle = 30;       // chamfer angle (deg from horizontal) at top inner step.
                           // 45° is steepest self-supporting overhang for FDM.
chamfer_dz = (lip_r - body_r) * tan(overhang_angle);

profile = [
    [inner_bottom_r, 0],
    [inner_bottom_r, z_floor],
    [lip_r,          z_floor],
    [lip_r,          z_lip_top],
    [body_r,         z_lip_top + chamfer_dz],   // chamfered top inner step
    [body_r,         z_top],
    [outer_r,        z_top],
    [outer_r,        0],
];

module arm() {
    // Profile placed in XZ plane (radial X from inner_bottom_r..outer_r),
    // extruded along -Y for arm_length.
    rotate([90, 0, 0])
        linear_extrude(height = arm_length)
            polygon(points = profile);
}

union() {
    // Top half arc (0° to 180° in XY plane).
    rotate_extrude(angle = 180)
        polygon(points = profile);

    // Right tangent arm (at angle 0°, extending -Y).
    arm();

    // Left tangent arm (mirrored across YZ plane).
    mirror([1, 0, 0]) arm();
}
