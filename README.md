# Round Hygrometer Holder

Minimalistic U-shaped holder for the standard round mini hygrometer commonly sold on Amazon and similar sites. Designed with one priority above all else: **print fast, use little filament**. There are clever holders out there that use container geometry to self-secure — impressive engineering, but they come with longer print times and more filament. With over 70 filament spools to monitor, I just want to save time where I can.

Instead, this holder attaches with heavy-duty double-sided tape, which works remarkably well in practice. Better yet, the same simple design fits both common storage setups: the popular **cereal-style containers** and the **20-quart Sterilite containers** (the kind that fit 4 spools). If you use both — this holder covers both.

**Example compatible hygrometer:** [Amazon B098JFRNKM](https://www.amazon.com/dp/B098JFRNKM?ref_=ppx_hzsearch_conn_dt_b_fed_asin_title_1)

**Tip:** For best results, use "heavy duty" double-sided tape to mount the holder. Available on Amazon and similar sites.

## Target Device Dimensions

| Dimension | Value |
|-----------|-------|
| Front lip outer diameter | 45 mm |
| Body outer diameter | 40 mm |
| Total depth | 15 mm |

## Renders

![Render 1](images/openscad_rendering_01.png)
![Render 2](images/openscad_rendering_02.png)

## Design

- U-shaped profile printed flat on the build plate (U lies on its side)
- 180° arc + two straight tangent arms form the U
- Inner stepped channel captures the hygrometer lip; body slides through freely
- Chamfered inner step (default 30°) minimizes overhang for support-free printing
- Fully parametric OpenSCAD source in `src/hygrometer-holder.scad`

### Key Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `inner_bottom_r` | 17.5 mm | Front-stop radius (35 mm inner gap) |
| `lip_r` | 22.75 mm | Lip channel radius (45.5 mm gap) |
| `body_r` | 20.715 mm | Body channel radius (41.43 mm gap) |
| `outer_r` | 28 mm | Outer wall radius |
| `z_floor` | 2 mm | Front-stop ledge height |
| `z_lip_top` | 4.5 mm | Top of lip channel |
| `z_top` | 8.5 mm | Total holder height |
| `arm_length` | 20 mm | Straight arm extension length |
| `overhang_angle` | 30° | Chamfer angle on inner step |

## Print Settings

- **Supports:** None required (chamfered inner step)
- **Orientation:** Flat on bed as designed
- **Material:** PLA or PETG recommended
- **Infill:** 20–30%
- **Print time:** ~16 minutes (Bambu P1S, SUNLU PLA+ 2.0 filament profile, Bambu Lab standard quality)

## Repository Layout

- `src/` — OpenSCAD parametric source
- `publication/` — Platform-specific export folders (MakerWorld, Printables, etc.)
