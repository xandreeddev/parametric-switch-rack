// Parametric 10-inch rack switch mount
// ------------------------------------
// A rack panel for KWS Rack V2 (EIA-310 10") that holds a desktop switch in a
// ventilated enclosure, plus snap-in keystone couplers beside it.
//
// - Switch size, clearances, position and retention are all customizer inputs.
// - The front mesh and the enclosure mesh regenerate around whatever you enter.
// - Keystone count is independent of the switch's port count.
// - Invalid combinations stop with an explanation instead of silently shrinking.
//
// Coordinates while building: X = right as seen from the front, Y = up,
// Z = depth into the rack (front face at Z = 0). The result is mirrored once at
// the end so the exported part lies front-face-down on the bed.
//
// https://github.com/xandreeddev/parametric-switch-rack  ·  MIT License

/* [Output] */
// What to generate. Print the small test pieces before the full panel.
output = "mount"; // [mount:Complete rack mount, keystone_coupon:Keystone snap-fit test coupon, switch_test:Switch clearance test, rack_test:Rack hole alignment test, accessories:Accessories (blank plugs and brackets)]
// Print lays the front face on the bed. Rack is for looking at the result only.
orientation = "print"; // [print:Print (front face down), rack:Rack (preview only)]
// Translucent switch and coupler dummies in preview (F5). Never exported.
show_dummies = true;

/* [Rack: KWS Rack V2 / 10 inch] */
// Panel height in rack units (1U = 44.45 mm).
rack_units = 1; // [1:1:6]
// Overall panel width. 254 mm is the 10-inch standard.
panel_width = 254; // [200:0.5:260]
// Distance between left and right mounting-hole centres (EIA-310 10-inch: 236.525).
hole_spacing = 236.525; // [200:0.025:250]
// Height of one rack unit.
unit_height = 44.45; // [40:0.05:50]
// The panel is this much shorter than N x 1U, so stacked panels never touch.
panel_gap = 0.8; // [0:0.1:3]
// Rail holes that get a screw. KWS Rack V2 has M5 inserts at all three EIA positions per U.
hole_pattern = "ends"; // [ends:Top and bottom only, outer:Two per U, center:One per U (centre), all:Three per U]
// Screw clearance hole. M5 = 5.5.
hole_diameter = 5.5; // [3:0.1:8]
// Horizontal slot length for alignment tolerance. Equal to the diameter = round hole.
hole_slot_length = 8; // [3:0.5:14]
// Clear width between the front rails. Nothing behind the panel may be wider.
rail_clear_width = 220; // [180:0.5:240]
// Extra gap kept between anything behind the panel and the rails.
rail_tolerance = 0.5; // [0:0.1:3]
// Faceplate thickness. KWS uses M5x10 screws: keep this at 6 mm or less.
panel_thickness = 4; // [2.5:0.1:8]
// Outer corner radius of the panel.
panel_corner_radius = 2; // [0:0.5:8]
// Depth of the vertical ribs just inside the rails (ear reinforcement). 0 = off.
ear_rib_depth = 6; // [0:0.5:20]
// Depth of the stiffening flanges along the top and bottom edges. 0 = off.
edge_flange_depth = 6; // [0:0.5:20]
// Thickness of the ribs and flanges.
stiffener_thickness = 2.4; // [1.2:0.1:5]

/* [Switch] */
// Measured body width across the front face. Placeholder: enter yours.
switch_width = 100; // [30:0.1:215]
// Measured height, including rubber feet (or remove them). Placeholder: enter yours.
switch_height = 28; // [10:0.1:250]
// Measured depth from front face to rear face, without cables. Placeholder: enter yours.
switch_depth = 100; // [20:0.1:240]
// Free space per side, left and right.
clearance_width = 0.3; // [0:0.05:3]
// Free space per side, top and bottom.
clearance_height = 0.3; // [0:0.05:3]
// Free space behind the switch (rear face to clips, brackets or stop).
clearance_depth = 0.5; // [0:0.05:5]
// Move the switch left (-) or right (+) of the panel centre, as seen from the front.
switch_offset_x = 0; // [-80:0.5:80]
// Move the switch down (-) or up (+) from the panel centre.
switch_offset_y = 0; // [-80:0.5:80]
// Rear: slides in from behind and stops against a front bezel lip (strongest). Front: slides in through the panel opening.
switch_loading = "rear"; // [rear:From the rear (bezel lip), front:Through the front opening]
// Rear loading: how far the bezel overlaps the switch's front face on each side. Keep ports and LEDs clear.
bezel_lip = 1.5; // [0.5:0.1:6]
// Panel front to switch front face. Rear loading: this is the bezel thickness. Front loading: set by the rear stop or brackets.
switch_recess = 2; // [-10:0.1:20]
// Corner radius of the opening in the faceplate. Front loading: keep it at or below the switch's own corner radius.
opening_corner_radius = 1; // [0:0.5:10]
// What stops the switch sliding backwards.
retention = "clips"; // [friction:Friction fit (crush ribs), clips:Snap clips (adjustable), screw:Screw-on rear brackets]
// Fixed printed backstop behind the switch. Front loading only.
rear_stop = false;

/* [Enclosure (shelf all around the switch)] */
// Enclosure length measured from the panel front. 0 = auto (reaches the switch's rear face). Manual values work with friction fit only.
cage_depth = 0; // [0:1:250]
// Wall thickness of the enclosure.
cage_wall = 2.4; // [1.6:0.1:5]
// Top of the enclosure.
cage_top = "full"; // [full:Full top, lips:Side lips only, none:Open]
// Bottom of the enclosure (the shelf).
cage_bottom = "full"; // [full:Full shelf, lips:Side lips only]
// Lip width when top or bottom is set to lips.
lip_width = 8; // [3:0.5:40]
// Use the mesh pattern on the enclosure top and bottom (ventilation).
cage_mesh = true;
// Solid border kept around the enclosure mesh.
cage_mesh_border = 4; // [2:0.5:20]
// Rounding of the enclosure's outer long edges (capped at the wall thickness).
cage_edge_radius = 2; // [0:0.1:5]
// Triangular gussets where the enclosure meets the panel.
gussets = true;
// Gusset size. Capped by the border around the switch and the gap to the keystones.
gusset_size = 6; // [2:0.5:20]
// Raise the switch on ribs for airflow underneath. 0 = off.
vent_standoff = 0; // [0:0.5:10]

/* [Retention details] */
// Friction fit: how far the crush ribs press into the switch.
crush_rib_interference = 0.25; // [0:0.05:1]
// Friction fit: crush ribs on each side wall.
crush_rib_count = 2; // [1:1:4]
// Snap clips: how far each hook overlaps the switch's rear face.
clip_hook_depth = 1.2; // [0.4:0.1:3]
// Snap clips: flexing length. Longer = softer.
clip_length = 20; // [8:1:60]
// Snap clips: height of each clip tongue.
clip_height = 10; // [4:0.5:40]
// Snap clips: tongue thickness (at most the wall thickness). Thinner = softer.
clip_thickness = 2.0; // [1.2:0.1:5]
// Snap clips: insertion ramp angle from the wall. Smaller = easier to push in.
clip_ramp_angle = 35; // [20:1:60]
// Screw brackets: pilot hole in the bosses (2.5 for M3 self-tapping, 4.0 for M3 heat-set inserts).
bracket_pilot_diameter = 2.5; // [1.5:0.1:5]
// Screw brackets: clearance hole in the brackets. M3 = 3.4.
bracket_screw_diameter = 3.4; // [2:0.1:5]
// Screw brackets: how far each bracket overlaps the switch's rear face.
bracket_overlap = 6; // [2:0.5:20]
// Rear stop: height of the backstop above the shelf.
rear_stop_height = 4; // [1:0.5:12]

/* [Keystone couplers] */
// Coupler preset. All values are nominal: print the test coupon first.
keystone_preset = "goobay_90866"; // [goobay_90866:Goobay 90866 Cat6A STP coupler, generic_stp:Generic shielded (STP) coupler, generic_utp:Generic unshielded (UTP) keystone, custom:Custom (see next section)]
// Couplers to the left of the switch, as seen from the front.
keystones_left = 1; // [0:1:12]
// Couplers to the right of the switch.
keystones_right = 0; // [0:1:12]
// Rows per column. Two or more rows need 2U or taller.
keystone_rows = 1; // [1:1:4]
// Solid wall between neighbouring coupler pockets, horizontally.
keystone_spacing_h = 3; // [1.2:0.1:20]
// Solid wall between neighbouring coupler pockets, vertically.
keystone_spacing_v = 3; // [1.2:0.1:20]
// Which way the spring latch faces.
keystone_orientation = "up"; // [up:Latch up, down:Latch down, left:Latch left, right:Latch right]
// Added on every side of the nominal opening (printed holes come out slightly small).
keystone_tolerance = 0.15; // [0:0.01:0.6]
// Put the couplers next to the switch or out by the rack ears.
keystone_anchor = "switch"; // [switch:Next to the switch, ear:Next to the rack ears]
// Solid gap between the enclosure (or the ear rib) and the nearest coupler pocket.
keystone_gap = 6; // [1:0.5:80]
// Move the coupler groups down (-) or up (+) relative to the switch centre.
keystone_offset_y = 0; // [-60:0.5:60]
// Override the preset's latch plate thickness (material the latch clicks behind). 0 = use the preset.
keystone_plate_override = 0; // [0:0.05:4]

/* [Keystone custom preset] */
// Nominal opening width.
custom_opening_width = 14.9; // [10:0.05:25]
// Nominal opening height (latch direction).
custom_opening_height = 17.0; // [10:0.05:25]
// Body width (preview dummy only).
custom_body_width = 14.7; // [10:0.05:25]
// Body height without the latch (preview dummy only).
custom_body_height = 16.2; // [10:0.05:25]
// Maximum height including the latch.
custom_max_height = 19.7; // [10:0.05:30]
// Overall length.
custom_length = 33.2; // [10:0.1:60]
// Latch plate thickness.
custom_plate = 2.0; // [0.8:0.05:4]
// How far the front face sits in front of the latch catch (preview dummy only).
custom_front_protrusion = 6.0; // [0:0.1:20]

/* [Front panel mesh] */
// Perforate the faceplate around the switch and couplers.
front_mesh = true;
// Pattern for the faceplate and the enclosure.
mesh_pattern = "hex"; // [hex:Honeycomb, diamond:Diamond, grid:Rectangular grid, round:Round, solid:Solid]
// Opening size (honeycomb: flat to flat).
mesh_cell = 8; // [3:0.5:30]
// Material between openings.
mesh_strut = 2; // [1.2:0.1:8]
// Extra solid margin between the mesh and every border.
mesh_spacing = 0; // [0:0.5:10]
// Symmetric keeps the pattern mirror-symmetric about the panel centre.
mesh_layout = "panel"; // [panel:Symmetric (panel centred), switch:Centred on the switch, left:Anchored left (asymmetric)]
// Clip cells at the borders (uniform borders) or keep only whole cells (stepped borders).
mesh_cells = "clip"; // [clip:Clip cells at borders, whole:Whole cells only]
// Solid border around the enclosure on the faceplate.
switch_border = 4; // [1.2:0.5:30]
// Solid border around each coupler pocket.
keystone_border = 2.5; // [1.2:0.5:20]
// Solid border along the top and bottom edges (at least the flange thickness).
perimeter = 5; // [2:0.5:20]

/* [Printing] */
// Printable bed width/depth/height. Bambu Lab X1 Carbon = 256.
bed_size = 256; // [150:1:400]
// Split the panel into two halves joined by dovetails (for smaller beds).
split_panel = false;
// Which half to generate when split.
split_part = "both"; // [both:Both halves, left:Left half, right:Right half]
// Split line position from the panel centre. 0 = automatic (in the free space nearest the centre).
split_position = 0; // [-120:0.5:120]
// Clearance in the dovetail joint.
split_clearance = 0.15; // [0:0.05:0.5]

/* [Test pieces] */
// Keystone coupon: number of openings, each with a different value.
coupon_variants = 3; // [1:1:5]
// Keystone coupon: which value steps between openings.
coupon_vary = "tolerance"; // [tolerance:Fit tolerance, plate:Latch plate thickness]
// Keystone coupon: step between openings.
coupon_step = 0.1; // [0.02:0.01:0.5]
// Switch test: the full outline or a single corner.
switch_test_style = "ring"; // [ring:Full outline ring, corner:One corner]
// Switch test: depth of the enclosure section.
switch_test_depth = 12; // [4:1:60]

/* [Accessories] */
// Snap-in blank covers for unused coupler openings.
blank_plugs = 1; // [0:1:12]
// Include the two rear brackets (only when retention = screw).
include_brackets = true;

/* [Hidden] */
$fa = 4;
$fs = 0.4;
EPS = 0.01;
BIG = 1000;
EIA_HOLES = [6.35, 22.225, 38.1];   // hole centres above each U boundary (EIA-310)
MIN_WALL = 1.2;
SCREW_LEN = 10;                     // KWS panel screws: M5 x 10

// ============================================================================
// Helpers
// ============================================================================

function qsort(v) = len(v) <= 1 ? v :
  let(p = v[floor(len(v) / 2)])
  concat(qsort([for (x = v) if (x < p) x]), [for (x = v) if (x == p) x], qsort([for (x = v) if (x > p) x]));

function qsort_iv(v) = len(v) <= 1 ? v :
  let(p = v[floor(len(v) / 2)][0])
  concat(qsort_iv([for (x = v) if (x[0] < p) x]), [for (x = v) if (x[0] == p) x], qsort_iv([for (x = v) if (x[0] > p) x]));

function uniq(v) = [for (i = [0:len(v) - 1]) if (i == 0 || v[i] - v[i - 1] > 1e-6) v[i]];

function slabs(zs) = let(u = uniq(qsort(zs))) [for (i = [0:len(u) - 2]) [u[i], u[i + 1]]];

function overlaps(a, b) = a[0] < b[1] && a[1] > b[0] && a[2] < b[3] && a[3] > b[2];

function warn(cond, msg) = cond ? echo(str("WARNING: ", msg)) 1 : 0;

function fmt(x) = str(round(x * 100) / 100);

module rrect(size, r) {
  r2 = max(0, min(r, size[0] / 2 - 0.01, size[1] / 2 - 0.01));
  if (r2 <= 0.001) square(size, center = true);
  else offset(r = r2) square([size[0] - 2 * r2, size[1] - 2 * r2], center = true);
}

module rect(b) translate([b[0], b[2]]) square([b[1] - b[0], b[3] - b[2]]);

// ============================================================================
// Keystone presets
// [opening_w, opening_h, body_w, body_h, max_h, length, plate, front_protrusion]
// ============================================================================

function ks_preset(name) =
  name == "goobay_90866" ? [14.9, 17.0, 14.7, 16.2, 19.7, 33.2, 2.0, 6.0] : // manufacturer datasheet
  name == "generic_stp"  ? [14.9, 17.0, 14.8, 16.4, 20.2, 36.0, 2.0, 6.0] : // nominal, generous
  name == "generic_utp"  ? [14.9, 16.6, 14.5, 16.0, 19.6, 30.0, 1.8, 2.0] : // nominal
  [custom_opening_width, custom_opening_height, custom_body_width, custom_body_height,
   custom_max_height, custom_length, custom_plate, custom_front_protrusion];

KS = ks_preset(keystone_preset);
KS_PLATE = keystone_plate_override > 0 ? keystone_plate_override : KS[6];
KS_TOL = keystone_tolerance;
KS_RS = 0.5;   // pocket margin beside the coupler body
KS_RB = 1.5;   // pocket margin below the opening (fixed hook)
KS_RT = 1.0;   // pocket margin above the latch tip
KS_ROT = keystone_orientation == "down" ? 180 : keystone_orientation == "left" ? 90 :
         keystone_orientation == "right" ? -90 : 0;
KS_SIDEWAYS = keystone_orientation == "left" || keystone_orientation == "right";

// [aperture_w, aperture_h, pocket_w, pocket_h, pocket_centre_y] in aperture-centred, latch-up coordinates.
function ks_dims(tol) =
  let(aw = KS[0] + 2 * tol, ah = KS[1] + 2 * tol,
      y0 = -ah / 2 - KS_RB, y1 = max(-ah / 2 + KS[4] + KS_RT, ah / 2 + 0.5))
  [aw, ah, aw + 2 * KS_RS, y1 - y0, (y0 + y1) / 2];

KD = ks_dims(KS_TOL);
KCW = KS_SIDEWAYS ? KD[3] : KD[2];   // pocket footprint on the faceplate
KCH = KS_SIDEWAYS ? KD[2] : KD[3];

// Opening (front, latch plate) or pocket (behind it), centred on the pocket.
module ks_cut_2d(tol, front) {
  d = ks_dims(tol);
  if (front) translate([0, -d[4]]) square([d[0], d[1]], center = true);
  else square([d[2], d[3]], center = true);
}

// ============================================================================
// Derived geometry
// ============================================================================

PW = panel_width;
PH = rack_units * unit_height - panel_gap;
T = panel_thickness;
ST = stiffener_thickness;
HAS_RIBS = ear_rib_depth > 0;
HAS_FLANGES = edge_flange_depth > 0;
RAIL_IN = rail_clear_width / 2 - rail_tolerance;       // nothing behind the panel goes past this
XR_IN = RAIL_IN - (HAS_RIBS ? ST : 0);                  // inner face of the ear ribs
YR_IN = PH / 2 - (HAS_FLANGES ? ST : 0);                // inner face of the edge flanges
PERIM = max(perimeter, HAS_FLANGES ? ST + 0.4 : 0);
SLOT = max(hole_slot_length, hole_diameter);

function hole_offsets(k) =
  hole_pattern == "all" ? EIA_HOLES :
  hole_pattern == "outer" ? [EIA_HOLES[0], EIA_HOLES[2]] :
  hole_pattern == "center" ? [EIA_HOLES[1]] :
  concat(k == 0 ? [EIA_HOLES[0]] : [], k == rack_units - 1 ? [EIA_HOLES[2]] : []);

HOLE_Y = [for (k = [0:rack_units - 1]) for (o = hole_offsets(k))
          -rack_units * unit_height / 2 + k * unit_height + o];

// Switch envelope (inside of the enclosure) and enclosure outline.
SW = switch_width;
SH = switch_height;
SD = switch_depth;
CW = clearance_width;
CH = clearance_height;
CD = clearance_depth;
VS = vent_standoff;
EW = SW + 2 * CW;
EH = SH + 2 * CH + VS;
EX = switch_offset_x;
SY = switch_offset_y;
EY = SY - VS / 2;
WALL = cage_wall;
OW = EW + 2 * WALL;
OH = EH + 2 * WALL;
REAR_LOAD = switch_loading == "rear";
RECESS = switch_recess;
Z_SW_REAR = RECESS + SD;
Z_CATCH = Z_SW_REAR + CD;
Z_BACK = max(T, REAR_LOAD ? RECESS : 0);   // where the enclosure leaves the faceplate/bezel

HOOK_D = clip_hook_depth + CW;
HOOK_FLAT = 0.8;
HOOK_RAMP = HOOK_D / tan(clip_ramp_angle);
CLIP_H = min(clip_height, EH - 2 * WALL);
CLIP_T = min(clip_thickness, WALL);

BOSS = max(bracket_pilot_diameter + 4, 6.5);
BOSS_LEN = 12;
BOSS_OUT = BOSS - WALL;

USE_STOP = rear_stop && !REAR_LOAD;
STOP_H = rear_stop_height + VS;

Z_END_AUTO =
  retention == "clips" ? Z_CATCH + HOOK_FLAT + HOOK_RAMP :
  USE_STOP ? Z_CATCH - VS + STOP_H + 2 :
  Z_CATCH;
Z_END = cage_depth > 0 ? cage_depth : Z_END_AUTO;
CLIP_Z0 = Z_END - clip_length;

LIP = min(lip_width, EW / 2 - 1);
CAGE_R = min(cage_edge_radius, WALL);
FRONT_MESH = front_mesh && mesh_pattern != "solid";
CAGE_MESH = cage_mesh && mesh_pattern != "solid";

// Keystone layout: columns fill outward from the switch (or inward from the ear).
function ks_group(n, side) = n <= 0 ? [] :
  let(rows = min(keystone_rows, n), cols = ceil(n / rows),
      px = KCW + keystone_spacing_h, py = KCH + keystone_spacing_v,
      gy = SY + keystone_offset_y,
      x_near = EX + side * (OW / 2 + keystone_gap + KCW / 2),
      x_ear = side * (XR_IN - keystone_gap - KCW / 2))
  [for (i = [0:n - 1])
    let(c = floor(i / rows), r = i % rows, m = min(rows, n - c * rows))
    [keystone_anchor == "switch" ? x_near + side * c * px : x_ear - side * (cols - 1 - c) * px,
     gy + ((m - 1) / 2 - r) * py]];

KS_POS = concat(ks_group(keystones_left, -1), ks_group(keystones_right, 1));
N_KS = len(KS_POS);
function ks_rect(p, m = 0) = [p[0] - KCW / 2 - m, p[0] + KCW / 2 + m, p[1] - KCH / 2 - m, p[1] + KCH / 2 + m];

// Gussets: capped by the switch border and by the gap to the nearest coupler on that side.
G0 = gussets ? min(gusset_size, switch_border) : 0;
G_L = max(0, min(concat([G0], [for (p = KS_POS) if (p[0] < EX) (EX - OW / 2) - (p[0] + KCW / 2) - 0.5])));
G_R = max(0, min(concat([G0], [for (p = KS_POS) if (p[0] >= EX) (p[0] - KCW / 2) - (EX + OW / 2) - 0.5])));
G_T = cage_top == "full" ? max(0, min(G0, PH / 2 - (EY + OH / 2))) : 0;
G_B = max(0, min(G0, (EY - OH / 2) + PH / 2));

SIDE_OUT = retention == "screw" ? BOSS_OUT : 0;
CAGE_X0 = EX - OW / 2 - max(G_L, SIDE_OUT);
CAGE_X1 = EX + OW / 2 + max(G_R, SIDE_OUT);
NEED_U = ceil((OH + 2 * abs(EY) + panel_gap) / unit_height);

// Split line.
DOVE_D = 5;
DOVE_NECK = 6;
DOVE_HEAD = 9;
XR_M = XR_IN - MIN_WALL;      // mesh limit, left/right
YR_M = PH / 2 - PERIM;        // mesh limit, top/bottom
OBSTACLES = concat([[CAGE_X0 - switch_border, CAGE_X1 + switch_border]],
                   [for (p = KS_POS) [p[0] - KCW / 2 - keystone_border, p[0] + KCW / 2 + keystone_border]]);
function run_gaps(s, i, m, acc) = i >= len(s) ? concat(acc, [[m, XR_M]]) :
  run_gaps(s, i + 1, max(m, s[i][1]), s[i][0] > m ? concat(acc, [[m, s[i][0]]]) : acc);
SPLIT_GAPS = run_gaps(qsort_iv(OBSTACLES), 0, -XR_M, []);
SPLIT_CANDS = [for (g = SPLIT_GAPS) if (g[1] - g[0] >= DOVE_D + 6) g[0] + (g[1] - g[0] - DOVE_D) / 2];
function closest(v, i = 0, best = undef) = i >= len(v) ? best :
  closest(v, i + 1, (is_undef(best) || abs(v[i] + DOVE_D / 2) < abs(best + DOVE_D / 2)) ? v[i] : best);
SPLIT_X = split_position != 0 ? split_position : closest(SPLIT_CANDS);
SPLIT_BAND = is_undef(SPLIT_X) ? undef : [SPLIT_X - 2, SPLIT_X + DOVE_D + 2, -BIG, BIG];

// Solid regions the faceplate mesh keeps away from.
KEEP = concat(
  [[EX - OW / 2 - switch_border, EX + OW / 2 + switch_border, EY - OH / 2 - switch_border, EY + OH / 2 + switch_border]],
  [for (p = KS_POS) ks_rect(p, keystone_border)],
  split_panel && !is_undef(SPLIT_BAND) ? [SPLIT_BAND] : []);

// ============================================================================
// Validation: stop with a reason instead of producing a wrong part
// ============================================================================

module check_rack() {
  assert(PW <= bed_size || split_panel,
    str("Panel is ", PW, " mm wide but the bed is ", bed_size, " mm. Enable split_panel or reduce panel_width."));
  assert(hole_spacing / 2 + SLOT / 2 + 1.5 <= PW / 2,
    str("Mounting holes run off the panel: hole_spacing/2 + slot/2 = ", fmt(hole_spacing / 2 + SLOT / 2), " mm, panel half-width ", PW / 2, " mm."));
  assert(hole_spacing / 2 - SLOT / 2 >= rail_clear_width / 2,
    str("Mounting holes must sit over the rails: their inner edge (", fmt(hole_spacing / 2 - SLOT / 2), " mm from centre) is inside rail_clear_width/2 = ", rail_clear_width / 2, " mm."));
}

module check_mount() {
  check_rack();
  assert(!(retention == "clips" && !REAR_LOAD),
    "Snap clips catch the switch's rear face as it slides in from behind. Use switch_loading = rear, or use friction/screw retention for front loading.");
  assert(!(rear_stop && REAR_LOAD),
    "A fixed rear stop blocks a switch loaded from the rear. Use switch_loading = front, or use clips/screw brackets.");
  assert(cage_depth == 0 || retention == "friction",
    str("cage_depth is set manually, but retention '", retention, "' needs the enclosure to end exactly at the switch's rear face. Set cage_depth = 0 (auto)."));
  assert(cage_depth == 0 || !USE_STOP, "cage_depth must be 0 (auto) when rear_stop is enabled.");
  assert(!REAR_LOAD || RECESS >= MIN_WALL,
    str("Rear loading: switch_recess is the bezel thickness and must be at least ", MIN_WALL, " mm (is ", RECESS, ")."));
  assert(!REAR_LOAD || (SW - 2 * bezel_lip >= 5 && SH - 2 * bezel_lip >= 5),
    "bezel_lip is too large for this switch: the opening would close up.");
  assert(CAGE_X0 >= -RAIL_IN + (HAS_RIBS ? ST : 0) - EPS && CAGE_X1 <= RAIL_IN - (HAS_RIBS ? ST : 0) + EPS,
    str("The switch enclosure spans x = ", fmt(CAGE_X0), " .. ", fmt(CAGE_X1), " mm, but only ±", fmt(XR_IN),
        " mm fits between the rails (rail_clear_width ", rail_clear_width, " - tolerance - ear ribs). Reduce switch_width/clearance/wall or switch_offset_x."));
  assert(EY + OH / 2 <= PH / 2 + EPS && EY - OH / 2 >= -PH / 2 - EPS,
    str("The switch enclosure is ", fmt(OH), " mm tall (height + clearances + standoff + 2 walls), offset ", fmt(EY),
        " mm, but a ", rack_units, "U panel is ", fmt(PH), " mm. Use rack_units = ", NEED_U, " or reduce height/offset."));
  assert(Z_END <= bed_size,
    str("The mount is ", fmt(Z_END), " mm deep, which is taller than the ", bed_size, " mm print height."));
  assert(Z_END >= Z_BACK + 5,
    str("cage_depth (", fmt(Z_END), " mm) must reach at least 5 mm behind the faceplate (", fmt(Z_BACK + 5), " mm)."));
  assert(retention != "clips" || CLIP_Z0 >= T + 2 * max(G_L, G_R) + 1,
    str("The switch is too shallow for ", clip_length, " mm snap clips. Reduce clip_length to ", floor(Z_END - T - 2 * max(G_L, G_R) - 1), " or less."));
  assert(retention != "clips" || CLIP_H >= 4,
    "Not enough wall height for snap clips: increase switch height or use another retention.");
  assert(N_KS == 0 || T >= KS_PLATE,
    str("panel_thickness (", T, ") must be at least the keystone latch plate (", KS_PLATE, ")."));
  for (p = KS_POS) {
    r = ks_rect(p);
    assert(r[0] >= -XR_IN + MIN_WALL - EPS && r[1] <= XR_IN - MIN_WALL + EPS,
      str("A keystone at x = ", fmt(p[0]), " mm sticks out past the rails (limit ±", fmt(XR_IN - MIN_WALL),
          " mm). Fewer couplers, more rows, a smaller keystone_gap, or anchor them differently."));
    assert(r[2] >= -YR_IN + MIN_WALL - EPS && r[3] <= YR_IN - MIN_WALL + EPS,
      str("A keystone at y = ", fmt(p[1]), " mm does not fit the panel height (pocket ", fmt(KCH),
          " mm tall). Reduce keystone_rows/offset, rotate the couplers, or add rack units."));
    assert(!overlaps(r, [EX - OW / 2 - 0.5, EX + OW / 2 + 0.5, EY - OH / 2 - 0.5, EY + OH / 2 + 0.5]),
      str("A keystone at x = ", fmt(p[0]), " mm collides with the switch enclosure. Increase keystone_gap or move the switch."));
    assert(retention != "screw" || T + KS[5] < Z_END - BOSS_LEN - BOSS_OUT ||
           !overlaps(r, [EX - OW / 2 - BOSS_OUT - 0.5, EX + OW / 2 + BOSS_OUT + 0.5, EY - BOSS / 2, EY + BOSS / 2]),
      str("A keystone body behind the panel would hit a bracket boss. Increase keystone_gap to at least ", fmt(BOSS_OUT + 0.5), " mm."));
  }
  if (split_panel) {
    assert(!is_undef(SPLIT_X), "No room for the split joint between the switch, couplers and ears. Set split_position manually or disable split_panel.");
    if (!is_undef(SPLIT_X)) {
      assert(SPLIT_X - 2 >= -XR_M && SPLIT_X + DOVE_D + 2 <= XR_M, "split_position must lie inside the mesh area between the ear ribs.");
      assert(len([for (o = OBSTACLES) if (SPLIT_X + DOVE_D + 2 > o[0] && SPLIT_X - 2 < o[1]) 1]) == 0,
        str("The split line at x = ", fmt(SPLIT_X), " mm crosses the switch enclosure or a keystone. Move split_position."));
      assert(SPLIT_X + DOVE_D + PW / 2 <= bed_size && PW / 2 - SPLIT_X <= bed_size, "A split half is still wider than the bed.");
      assert(split_part != "both" || 2 * PH + 10 <= bed_size, "Both halves do not fit the bed together: print them one at a time (split_part = left/right).");
    }
  }
}

_warnings = output == "mount" ? [
  warn(mesh_strut < 1.6 && (FRONT_MESH || CAGE_MESH), str("mesh_strut ", mesh_strut, " mm is thin for PETG; 1.6 mm or more prints more reliably.")),
  warn(REAR_LOAD && bezel_lip > 3, "bezel_lip above 3 mm may cover ports or LEDs near the edge of the switch face."),
  warn(SCREW_LEN - T < 4, str("Only ", SCREW_LEN - T, " mm of an M5x10 screw reaches the insert; use M5x12 with this panel thickness.")),
  warn(retention == "clips" && 150 * CLIP_T * clip_hook_depth / (clip_length * clip_length) > 2.5,
       str("Snap clips are stiff (", fmt(150 * CLIP_T * clip_hook_depth / (clip_length * clip_length)), "% strain). Lengthen or thin them, or reduce the hook depth.")),
  warn(retention == "friction" && !USE_STOP, "Only friction holds the switch against cable insertion force."),
  warn(!REAR_LOAD && retention == "friction" && !USE_STOP, "Front loading without rear_stop: switch_recess is not enforced, the switch can slide back."),
  warn(cage_depth > 0 && Z_END - max(RECESS, 0) < 0.5 * SD, "The enclosure supports less than half the switch depth."),
  warn(PW > 254, "panel_width above 254 mm exceeds the 10-inch standard."),
  warn(G0 > 0 && min(G_L, G_R) < G0, "Gussets were shortened to clear the keystones.")
] : [];

// ============================================================================
// Mesh
// ============================================================================

function cell_half(vertical) =
  mesh_pattern == "hex" ? [mesh_cell / sqrt(3), mesh_cell / 2] :
  mesh_pattern == "round" && vertical ? [mesh_cell / 2, mesh_cell * 0.71] :
  [mesh_cell / 2, mesh_cell / 2];

// Lattice of cell centres covering bounds b = [x0, x1, y0, y1] from origin o.
function lattice(b, o) =
  let(c = mesh_cell, s = mesh_strut)
  mesh_pattern == "diamond" ?
    let(p = c + s * sqrt(2), dy = p / 2,
        i0 = floor((b[0] - o[0]) / p) - 1, i1 = ceil((b[1] - o[0]) / p) + 1,
        j0 = floor((b[2] - o[1]) / dy) - 1, j1 = ceil((b[3] - o[1]) / dy) + 1)
    [for (j = [j0:j1]) for (i = [i0:i1]) [o[0] + i * p + (abs(j) % 2 == 1 ? p / 2 : 0), o[1] + j * dy]]
  : mesh_pattern == "grid" ?
    let(p = c + s,
        i0 = floor((b[0] - o[0]) / p) - 1, i1 = ceil((b[1] - o[0]) / p) + 1,
        j0 = floor((b[2] - o[1]) / p) - 1, j1 = ceil((b[3] - o[1]) / p) + 1)
    [for (j = [j0:j1]) for (i = [i0:i1]) [o[0] + i * p, o[1] + j * p]]
  : // honeycomb and round: hexagonal packing in columns
    let(d = c + s, px = d * sqrt(3) / 2,
        i0 = floor((b[0] - o[0]) / px) - 1, i1 = ceil((b[1] - o[0]) / px) + 1,
        j0 = floor((b[2] - o[1]) / d) - 1, j1 = ceil((b[3] - o[1]) / d) + 1)
    [for (i = [i0:i1]) for (j = [j0:j1]) [o[0] + i * px, o[1] + j * d + (abs(i) % 2 == 1 ? d / 2 : 0)]];

function cell_fits(p, h, b, keep) =
  p[0] - h[0] >= b[0] && p[0] + h[0] <= b[1] && p[1] - h[1] >= b[2] && p[1] + h[1] <= b[3] &&
  len([for (k = keep) if (overlaps([p[0] - h[0], p[0] + h[0], p[1] - h[1], p[1] + h[1]], k)) 1]) == 0;

// vertical = printed standing up (enclosure walls): every opening gets a self-supporting top.
module mesh_cell_2d(vertical) {
  c = mesh_cell;
  if (mesh_pattern == "hex") circle(r = c / sqrt(3), $fn = 6);           // flat top: short bridges only
  else if (mesh_pattern == "diamond") polygon([[c / 2, 0], [0, c / 2], [-c / 2, 0], [0, -c / 2]]);
  else if (mesh_pattern == "grid") square(c, center = true);
  else if (vertical) hull() { circle(d = c); rotate(45) square(c / 2); }   // teardrop
  else circle(d = c);
}

module mesh_field(b, o, keep, vertical) {
  h = cell_half(vertical);
  pts = lattice(b, o);
  rnd = max(0.8, mesh_cell * 0.2);
  if (b[1] - b[0] > 2 * h[0] * 0.5 && b[3] - b[2] > 2 * h[1] * 0.5) {
    if (mesh_cells == "whole") {
      offset(r = rnd) offset(delta = -rnd)
        for (p = pts) if (cell_fits(p, h, b, keep)) translate(p) mesh_cell_2d(vertical);
    } else {
      // Opening (shrink, then grow back) drops clipped slivers narrower than 2 x rnd.
      offset(r = rnd) offset(delta = -rnd) intersection() {
        union() for (p = pts)
          if (overlaps([p[0] - h[0], p[0] + h[0], p[1] - h[1], p[1] + h[1]], b)) translate(p) mesh_cell_2d(vertical);
        difference() { rect(b); for (k = keep) rect(k); }
      }
    }
  }
}

module front_mesh_2d() {
  ms = mesh_spacing;
  b = [-XR_M + ms, XR_M - ms, -YR_M + ms, YR_M - ms];
  keep = [for (k = KEEP) [k[0] - ms, k[1] + ms, k[2] - ms, k[3] + ms]];
  h = cell_half(false);
  o = mesh_layout == "switch" ? [EX, SY] : mesh_layout == "left" ? [b[0] + h[0], 0] : [0, 0];
  mesh_field(b, o, keep, false);
}

// Enclosure plate mesh, in plate coordinates (u = x - EX, v = z).
module cage_mesh_2d(z_end, side) {
  v0 = Z_BACK + max(cage_mesh_border, 2 * (side > 0 ? G_T : G_B) + 1);
  v1 = z_end - cage_mesh_border - (side < 0 && USE_STOP ? 2 * STOP_H + 2 : 0);
  u = EW / 2 - cage_mesh_border;
  h = cell_half(true);
  if (v1 - v0 > mesh_cell && u > h[0]) mesh_field([-u, u, v0, v1], [0, v0 + h[1]], [], true);
}

// ============================================================================
// Faceplate
// ============================================================================

module mount_holes_2d() {
  for (s = [-1, 1]) for (y = HOLE_Y)
    translate([s * hole_spacing / 2, y])
      hull() for (dx = [-1, 1]) translate([dx * (SLOT - hole_diameter) / 2, 0]) circle(d = hole_diameter);
}

module switch_opening_2d(zm) {
  if (REAR_LOAD && zm < RECESS)
    translate([EX, SY]) rrect([SW - 2 * bezel_lip, SH - 2 * bezel_lip], opening_corner_radius);
  else
    translate([EX, EY]) rrect([EW, EH], REAR_LOAD ? 0 : opening_corner_radius);
}

module panel_2d(zm) {
  difference() {
    rrect([PW, PH], panel_corner_radius);
    mount_holes_2d();
    switch_opening_2d(zm);
    for (p = KS_POS) translate(p) rotate(KS_ROT) ks_cut_2d(KS_TOL, zm < KS_PLATE);
    if (FRONT_MESH) front_mesh_2d();
  }
}

module panel_3d() {
  zs = concat([0, T],
              REAR_LOAD && RECESS > 0 && RECESS < T ? [RECESS] : [],
              N_KS > 0 && KS_PLATE < T ? [KS_PLATE] : []);
  for (s = slabs(zs)) translate([0, 0, s[0]]) linear_extrude(s[1] - s[0]) panel_2d((s[0] + s[1]) / 2);
}

module stiffeners_3d() {
  if (HAS_RIBS) for (s = [-1, 1])
    translate([s * (RAIL_IN - ST / 2) - ST / 2, -PH / 2, T - EPS]) cube([ST, PH, ear_rib_depth + EPS]);
  if (HAS_FLANGES) for (s = [-1, 1])
    translate([-RAIL_IN, s > 0 ? PH / 2 - ST : -PH / 2, T - EPS]) cube([2 * RAIL_IN, ST, edge_flange_depth + EPS]);
}

// ============================================================================
// Enclosure ("shelf all around")
// ============================================================================

// 2D sketch (u, v) -> 3D (x, z), extruded `w` thick downward in Y from y_top.
module xz_plate(y_top, w) translate([0, y_top, 0]) rotate([90, 0, 0]) linear_extrude(w) children();
// 2D sketch (u, v) -> 3D (y, z), extruded `w` along +X from x0.
module yz_plate(x0, w) translate([x0, 0, 0]) rotate([90, 0, 90]) linear_extrude(w) children();

module cage_sides_2d() {
  top = cage_top == "none" ? EY + EH / 2 : EY + OH / 2;
  intersection() {
    translate([EX, EY]) rrect([OW, OH], CAGE_R);
    for (s = [-1, 1]) translate([EX + s * (EW / 2 + WALL / 2) - WALL / 2, EY - OH / 2]) square([WALL, top - (EY - OH / 2)]);
  }
}

module cage_plate(side, style, z_end, features) {
  y_in = EY + side * EH / 2;
  translate([EX, 0, 0]) xz_plate(side > 0 ? y_in + WALL : y_in, WALL) {
    if (style == "full")
      difference() {
        translate([-EW / 2 - EPS, 0]) square([EW + 2 * EPS, z_end]);
        if (CAGE_MESH && features) cage_mesh_2d(z_end, side);
      }
    else
      for (s = [-1, 1]) translate([s > 0 ? EW / 2 - LIP : -EW / 2 - EPS, 0]) square([LIP + EPS, z_end]);
  }
}

module clip_cuts() {
  len_c = Z_END - CLIP_Z0 + 1;
  for (s = [-1, 1]) {
    xc = EX + s * (EW / 2 + WALL / 2);
    for (dy = [-1, 1])   // slits free the tongue from the wall above and below
      translate([xc, EY + dy * (CLIP_H / 2 + 0.4), CLIP_Z0 + len_c / 2]) cube([WALL + 2, 0.8, len_c], center = true);
    if (CLIP_T < WALL)   // thin the tongue from the outside (steps inward going up: no overhang)
      translate([EX + s * (EW / 2 + CLIP_T + (WALL - CLIP_T + 1) / 2), EY, CLIP_Z0 + len_c / 2])
        cube([WALL - CLIP_T + 1, CLIP_H + 1.6, len_c], center = true);
  }
}

module clip_hooks() {
  // Catch face toward the switch (flat, short overhang), ramp toward the rear for insertion.
  pts = [[-0.2, Z_CATCH], [HOOK_D, Z_CATCH], [HOOK_D, Z_CATCH + HOOK_FLAT], [-0.2, Z_END]];
  for (s = [-1, 1])
    translate([EX + s * EW / 2, EY + CLIP_H / 2, 0]) rotate([90, 0, 0]) linear_extrude(CLIP_H)
      if (s > 0) mirror([1, 0]) polygon(pts); else polygon(pts);
}

module crush_ribs() {
  p = CW + crush_rib_interference;
  r = max(1.0, p);
  z0 = Z_BACK + 1;
  z1 = Z_END - 0.5;
  lo = EY - EH / 2 + VS + 3;
  hi = EY + EH / 2 - 3;
  n = crush_rib_count;
  for (s = [-1, 1]) for (i = [0:n - 1]) {
    y = lo + (i + 0.5) * (hi - lo) / n;
    xf = EX + s * (EW / 2 + r - p);   // full protrusion
    x0 = EX + s * (EW / 2 + r);       // flush with the wall
    if (REAR_LOAD)   // lead-in at the rear, where the switch enters
      hull() {
        translate([xf, y, z0]) cylinder(r = r, h = max(0.1, z1 - z0 - 4));
        translate([x0, y, z1 - 0.1]) cylinder(r = r, h = 0.1);
      }
    else             // lead-in at the front
      hull() {
        translate([x0, y, z0]) cylinder(r = r, h = 0.1);
        translate([xf, y, min(z0 + 4, z1 - 0.1)]) cylinder(r = r, h = max(0.1, z1 - z0 - 4));
      }
  }
}

module standoff_ribs() {
  xs = EW < 40 ? [-EW / 4, EW / 4] : [-EW / 3, 0, EW / 3];
  z0 = REAR_LOAD ? RECESS : 0;
  for (x = xs) translate([EX + x - 1, EY - EH / 2 - EPS, z0]) cube([2, VS + EPS, Z_END - z0]);
}

module rear_stop_3d() {
  z1 = Z_CATCH - VS;
  y0 = EY - EH / 2;
  pts = [[y0 - EPS, z1], [y0 + STOP_H, z1 + STOP_H], [y0 + STOP_H, z1 + STOP_H + 2], [y0 - EPS, z1 + STOP_H + 2]];
  if (cage_bottom == "full") yz_plate(EX - EW / 2, EW) polygon(pts);
  else for (s = [-1, 1]) yz_plate(s > 0 ? EX + EW / 2 - LIP : EX - EW / 2, LIP) polygon(pts);
}

module bosses() {
  for (s = [-1, 1]) {
    xi = s * EW / 2;
    pts = [[0, Z_END - BOSS_LEN - BOSS_OUT], [WALL, Z_END - BOSS_LEN - BOSS_OUT], [BOSS, Z_END - BOSS_LEN],
           [BOSS, Z_END], [0, Z_END]];
    translate([EX + xi, EY + BOSS / 2, 0]) rotate([90, 0, 0]) linear_extrude(BOSS)
      if (s > 0) polygon(pts); else mirror([1, 0]) polygon(pts);
  }
}

module boss_holes() {
  for (s = [-1, 1]) translate([EX + s * (EW / 2 + BOSS / 2), EY, Z_END - 10]) cylinder(d = bracket_pilot_diameter, h = 11);
}

module gussets_3d() {
  xl = EX - OW / 2;
  xr = EX + OW / 2;
  yt = EY + OH / 2;
  yb = EY - OH / 2;
  if (G_L > 0.5) translate([0, yt, 0]) rotate([90, 0, 0]) linear_extrude(OH) polygon([[xl + 0.2, T - EPS], [xl - G_L, T - EPS], [xl + 0.2, T + 2 * G_L]]);
  if (G_R > 0.5) translate([0, yt, 0]) rotate([90, 0, 0]) linear_extrude(OH) polygon([[xr - 0.2, T - EPS], [xr + G_R, T - EPS], [xr - 0.2, T + 2 * G_R]]);
  if (G_T > 0.5) yz_plate(xl, OW) polygon([[yt - 0.2, T - EPS], [yt + G_T, T - EPS], [yt - 0.2, T + 2 * G_T]]);
  if (G_B > 0.5) yz_plate(xl, OW) polygon([[yb + 0.2, T - EPS], [yb - G_B, T - EPS], [yb + 0.2, T + 2 * G_B]]);
}

module cage_3d(z_end, features) {
  difference() {
    union() {
      linear_extrude(z_end) cage_sides_2d();
      if (cage_top != "none") cage_plate(1, cage_top, z_end, features);
      cage_plate(-1, cage_bottom, z_end, features);
      if (REAR_LOAD && RECESS > T)   // bezel continues behind a thin faceplate
        translate([0, 0, T - EPS]) linear_extrude(RECESS - T + EPS) difference() {
          translate([EX, EY]) rrect([OW, OH], CAGE_R);
          translate([EX, SY]) rrect([SW - 2 * bezel_lip, SH - 2 * bezel_lip], opening_corner_radius);
        }
      if (VS > 0) standoff_ribs();
      if (features) {
        if (retention == "clips") clip_hooks();
        if (retention == "friction") crush_ribs();
        if (retention == "screw") bosses();
        if (USE_STOP) rear_stop_3d();
      }
    }
    if (features && retention == "clips") clip_cuts();
    if (features && retention == "screw") boss_holes();
  }
}

// ============================================================================
// Assemblies
// ============================================================================

module mount_body() {
  panel_3d();
  cage_3d(Z_END, true);
  stiffeners_3d();
  gussets_3d();
}

module split_region_2d(left) {
  ys = let(n = max(1, floor((PH - 2 * PERIM) / 18)))
       [for (j = [0:n - 1]) -PH / 2 + PERIM + (j + 0.5) * (PH - 2 * PERIM) / n];
  pts = concat([[-BIG, -BIG], [SPLIT_X, -BIG]],
               [for (y = ys) each [[SPLIT_X, y - DOVE_NECK / 2], [SPLIT_X + DOVE_D, y - DOVE_HEAD / 2],
                                   [SPLIT_X + DOVE_D, y + DOVE_HEAD / 2], [SPLIT_X, y + DOVE_NECK / 2]]],
               [[SPLIT_X, BIG], [-BIG, BIG]]);
  if (left) offset(delta = -split_clearance / 2) polygon(pts);
  else difference() { square(2 * BIG, center = true); offset(delta = split_clearance / 2) polygon(pts); }
}

module half(left) intersection() {
  mount_body();
  translate([0, 0, -1]) linear_extrude(BIG) split_region_2d(left);
}

module dummies() {
  color("dimgray", 0.5) translate([EX - SW / 2, SY - SH / 2, RECESS]) cube([SW, SH, SD]);
  for (p = KS_POS) translate(p) rotate(KS_ROT) translate([0, -KD[4], 0]) {
    z0 = KS_PLATE - KS[7];
    color("silver", 0.6) translate([-KS[2] / 2, -KD[1] / 2 + KS_TOL, z0]) cube([KS[2], KS[3], KS[5]]);
    color("white", 0.6) translate([-4, -KD[1] / 2 + KS_TOL + KS[3], z0 + KS[7] - 4]) cube([8, KS[4] - KS[3], 10]);
  }
}

module mount() {
  check_mount();
  if (!split_panel) {
    mount_body();
    if (show_dummies) %dummies();
  } else if (!is_undef(SPLIT_X)) {
    cl = (-PW / 2 + SPLIT_X + DOVE_D) / 2;
    cr = (SPLIT_X + PW / 2) / 2;
    if (split_part == "left") translate([-cl, 0, 0]) half(true);
    else if (split_part == "right") translate([-cr, 0, 0]) half(false);
    else {
      translate([-cl, -(PH / 2 + 5), 0]) half(true);
      translate([-cr, PH / 2 + 5, 0]) half(false);
    }
  }
}

module switch_test() {
  b = 5;
  x0 = EX - OW / 2 - b;
  x1 = EX + OW / 2 + b;
  y0 = max(EY - OH / 2 - b, -PH / 2);
  y1 = min(EY + OH / 2 + b, PH / 2);
  zt = Z_BACK + switch_test_depth;
  intersection() {
    union() {
      zs = concat([0, T], REAR_LOAD && RECESS > 0 && RECESS < T ? [RECESS] : []);
      for (s = slabs(zs)) translate([0, 0, s[0]]) linear_extrude(s[1] - s[0])
        difference() { rect([x0, x1, y0, y1]); switch_opening_2d((s[0] + s[1]) / 2); }
      cage_3d(zt, false);
    }
    if (switch_test_style == "corner")
      translate([x0 - 1, y0 - 1, -1]) cube([min(30, OW / 2) + b + 1, min(30, OH / 2) + b + 1, BIG]);
  }
  if (show_dummies) %translate([EX - SW / 2, SY - SH / 2, RECESS]) cube([SW, SH, switch_test_depth]);
}

module rack_test() {
  check_rack();
  w = 8;
  linear_extrude(T) difference() {
    rrect([PW, PH], panel_corner_radius);
    mount_holes_2d();
    if (PH - 2 * w > 5) rect([-XR_IN + w, XR_IN - w, -PH / 2 + w, PH / 2 - w]);
  }
  stiffeners_3d();
}

module keystone_coupon() {
  n = coupon_variants;
  vals = [for (i = [0:n - 1]) (coupon_vary == "tolerance" ? KS_TOL : KS_PLATE) + (i - (n - 1) / 2) * coupon_step];
  assert(coupon_vary != "tolerance" || vals[0] >= 0, "Coupon tolerance would go negative: reduce coupon_step or variants.");
  assert(coupon_vary != "plate" || (vals[0] >= 0.8 && vals[n - 1] <= T),
    str("Coupon plate thickness must stay between 0.8 and panel_thickness (", T, ")."));
  kb = max(keystone_border, 3);
  dmax = ks_dims(coupon_vary == "tolerance" ? vals[n - 1] : KS_TOL);
  label_h = 7;
  cw = dmax[2] + 2 * kb;
  ch = dmax[3] + 2 * kb + label_h;
  for (i = [0:n - 1]) {
    tol = coupon_vary == "tolerance" ? vals[i] : KS_TOL;
    plate = coupon_vary == "plate" ? vals[i] : KS_PLATE;
    label = coupon_vary == "tolerance" ? str("t", fmt(tol)) : str("p", fmt(plate));
    translate([(i - (n - 1) / 2) * cw, 0, 0]) difference() {
      for (s = slabs([0, plate, T])) translate([0, 0, s[0]]) linear_extrude(s[1] - s[0]) difference() {
        translate([0, -label_h / 2]) square([cw + EPS, ch], center = true);
        ks_cut_2d(tol, (s[0] + s[1]) / 2 < plate);
      }
      // Engraved on the back (top while printing); pre-mirrored so it reads correctly there.
      translate([0, -dmax[3] / 2 - kb - label_h / 2 + 0.5, T - 0.6]) linear_extrude(1)
        mirror([1, 0]) text(label, size = 3.2, halign = "center", valign = "center");
    }
  }
}

// Snap-in cover for an unused opening. Prints cap-down.
module blank_plug() {
  d = ks_dims(KS_TOL);
  cap = 1.2;
  w = d[0] - 0.4;
  h = d[1] - 0.4;
  tw = 1.0;                 // flexing tab thickness
  L = KS_PLATE + 8;         // tabs hang from the rear ring, free end near the cap
  bump = 0.5;
  zc = cap + KS_PLATE + 0.05;
  linear_extrude(cap) rrect([d[0] + 2.4, d[1] + 2.4], 1);
  difference() {
    translate([0, 0, cap - EPS]) linear_extrude(L + EPS) difference() {
      square([w, h], center = true);
      square([w - 2 * tw, h - 2 * tw], center = true);
    }
    for (sy = [-1, 1]) {
      // slits between tab and side walls, up to the rear ring
      for (sx = [-1, 1]) translate([sx * (w / 2 - tw / 2), sy * (h / 2 - tw - 0.4), cap + (L - 1.5) / 2])
        cube([tw + 0.2, 0.8, L - 1.5], center = true);
      // gap between the cap and the free end of the tab
      translate([0, sy * (h / 2 - tw / 2), cap + 0.3]) cube([w + 0.2, tw + 0.2, 0.6 + 2 * EPS], center = true);
    }
  }
  for (sy = [-1, 1])   // catch bumps: flat face toward the cap, ramp toward the rear
    translate([-(w - 2 * tw - 1) / 2, 0, 0]) rotate([90, 0, 90]) linear_extrude(w - 2 * tw - 1)
      polygon([[sy * (h / 2 - 0.2), zc], [sy * (h / 2 + bump), zc], [sy * (h / 2 + bump), zc + 0.6], [sy * (h / 2 - 0.2), zc + 0.6 + 2 * bump]]);
}

module bracket(s) {
  x_in = SW / 2 - bracket_overlap;
  x_out = EW / 2 + BOSS;
  hh = BOSS + 4;
  linear_extrude(3) difference() {
    translate([s > 0 ? x_in : -x_out, -hh / 2]) offset(r = 1) offset(delta = -1) square([x_out - x_in, hh]);
    translate([s * (EW / 2 + BOSS / 2), 0]) circle(d = bracket_screw_diameter);
  }
}

module accessories() {
  has_brackets = retention == "screw" && include_brackets;
  assert(blank_plugs > 0 || has_brackets, "Nothing to generate: set blank_plugs above 0, or retention = screw with include_brackets.");
  pitch = ks_dims(KS_TOL)[0] + 6;
  for (i = [0:max(0, blank_plugs - 1)]) if (blank_plugs > 0) translate([(i - (blank_plugs - 1) / 2) * pitch, 0, 0]) blank_plug();
  if (has_brackets) for (s = [-1, 1]) {
    x_mid = s * ((SW / 2 - bracket_overlap) + (EW / 2 + BOSS)) / 2;
    translate([-x_mid, -(ks_dims(KS_TOL)[1] / 2 + 6) - (BOSS + 4) / 2 - (s > 0 ? 0 : BOSS + 8), 0]) bracket(s);
  }
}

// ============================================================================
// Output
// ============================================================================

module placed() {
  if (orientation == "rack") rotate([0, 0, 180]) rotate([90, 0, 0]) mirror([1, 0, 0]) children();
  else mirror([1, 0, 0]) children();
}

echo(str("Panel ", PW, " x ", fmt(PH), " x ", T, " mm (", rack_units, "U)  |  enclosure ", fmt(OW), " x ", fmt(OH),
         " mm, depth ", fmt(Z_END), " mm  |  keystones ", N_KS, " (", keystone_preset, ")"));

placed() {
  if (output == "mount") mount();
  else if (output == "keystone_coupon") keystone_coupon();
  else if (output == "switch_test") switch_test();
  else if (output == "rack_test") rack_test();
  else if (output == "accessories") accessories();
}
