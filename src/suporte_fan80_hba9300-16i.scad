// =====================================================================
//  Suporte de ENCAIXE para fan 80x80x10 mm
//  Dissipador da HBA LSI / Broadcom SAS 9300-16i  (sem parafusos)
// =====================================================================
//  Como funciona
//   - O fan entra por cima e trava em 4 linguetas (snap).
//   - A moldura apoia no topo das aletas.
//   - 2 garras laterais abracam o dissipador e prendem por baixo da base.
//
//  Coordenadas (posicao de uso):
//   X = ao longo das aletas (comprimento da placa)
//   Y = atravessado as aletas (altura da placa)
//   Z = 0 no topo das aletas, positivo para cima
//
//  Unidades: mm.  Abra no OpenSCAD, ajuste as medidas do bloco 1,
//  F6 (render) e exporte o STL.
// =====================================================================

/* [1. Dissipador - MEDIR COM PAQUIMETRO] */
// Largura atravessada as aletas (de uma face lateral lisa a outra)
hs_w = 76.0;
// Altura total: da face de baixo da base ate o topo das aletas
hs_h = 8.5;
// Folga entre a PCB e a face de baixo do dissipador (so conferencia)
pcb_gap = 3.0;
// Comprimento ao longo das aletas (so para a pre-visualizacao)
hs_len = 104;

/* [2. Fan] */
fan       = 80;     // lado do fan
fan_t     = 10.0;   // espessura do fan
fan_clear = 0.2;    // folga lateral por lado
fan_play  = 0.25;   // folga vertical sob as travas

/* [3. Moldura] */
wall_t       = 2.0;  // espessura das paredes
rim_w        = 2.0;  // aba externa de reforco (fica na mesa ao imprimir)
rim_t        = 2.4;
standoff_min = 2.0;  // distancia minima fan -> aletas
rest_overlap = 1.5;  // quanto o trilho apoia sobre a borda do dissipador
corner_r     = 2.0;

/* [4. Garras que prendem no dissipador] */
leg_w        = 18;   // largura de cada garra
leg_t        = 1.6;  // espessura (flexao)
leg_x        = 0;    // desloca as garras ao longo de X
hs_clear     = 0.2;  // folga garra <-> lateral do dissipador
hook_reach   = 1.4;  // quanto o gancho entra por baixo da base
hook_preload = 0.4;  // aperto (pre-carga) depois de encaixado
hook_nose    = 0.2;
lead_ang     = 35;   // angulo da rampa de entrada (graus)
root_h       = 5.0;  // faixa rigida no topo onde a garra nasce
slit         = 1.0;  // rasgo entre garra e parede
grip         = 1.0;  // friso para puxar a garra com a unha (0 = sem)

/* [5. Travas do fan] */
fing_w      = 9;
fing_t      = 1.2;
fing_y      = 20;    // posicao das travas (+/-) em cada parede
fing_reach  = 0.9;   // quanto a trava cobre o fan
fing_root_z = 1.2;

/* [6. Saida do cabo] */
cable_w = 8;
cable_y = 34;        // centro do rasgo (+/-) na parede X+
cable_h = 6;         // altura do rasgo acima da base do fan

/* [7. Saida] */
print_orientation = true;   // true = virado para imprimir (aba na mesa)
show_ghost        = false;  // mostra dissipador/fan/PCB (so preview)

/* [Hidden] */
$fn = 48;
eps = 0.01;

// ---------------- medidas derivadas ----------------
yw_i  = fan/2 + fan_clear;            // face interna da parede
yw_o  = yw_i + wall_t;                // face externa da parede
Y_i   = hs_w/2 + hs_clear;            // face interna da garra junto ao dissipador
s     = max(standoff_min, yw_i - hs_w/2 + rest_overlap);  // altura do trilho = fan acima das aletas
fan_z0 = s - fan_clear;               // base do fan
zc    = fan_z0 + fan_t + fan_play;    // face de travamento (topo do fan)
Z_top = zc + 0.3 + fing_reach;        // topo da peca
jog      = Y_i < yw_i;                // dissipador mais estreito que o fan
wall_cut = Y_i < yw_o + 0.8;          // garra ocupa o plano da parede
y_top = max(Y_i, yw_i);
Z1    = -hs_h + hs_clear + hook_preload;                       // inicio da cunha do gancho
z_tip = Z1 - hook_reach;
zb    = z_tip - hook_nose - (hook_reach + 0.2) * tan(lead_ang); // ponto mais baixo da garra
hook_depth = -hs_h - zb;              // quanto a garra desce abaixo da base do dissipador
lz_a  = leg_x - leg_w/2;
lz_b  = leg_x + leg_w/2;

echo(str("== Tamanho da peca (X x Y x Z): ", 2*(yw_o+rim_w), " x ",
         2*max(yw_o+rim_w, y_top+leg_t+grip), " x ", Z_top - zb, " mm"));
echo(str("== Fan fica ", fan_z0, " mm acima das aletas; topo da peca ", Z_top, " mm acima das aletas"));
echo(str("== A garra desce ", hook_depth, " mm abaixo da base do dissipador -> precisa de folga ate a PCB >= ",
         hook_depth + 0.4, " mm (informado: ", pcb_gap, ")"));
if (hook_depth + 0.3 > pcb_gap) echo("AVISO: gancho alto demais para a folga informada - reduza hook_reach ou aumente lead_ang");
if (zb > -hs_h - 0.5) echo("AVISO: gancho muito raso");

// ---------------- utilitarios ----------------
// perfil (y,z) extrudado ao longo de X
module prism_yz(pts, x0, w) { translate([x0,0,0]) rotate([90,0,90]) linear_extrude(w) polygon(pts); }
// perfil (x,z) extrudado ao longo de Y
module prism_xz(pts, y0, w) { translate([0,y0+w,0]) rotate([90,0,0]) linear_extrude(w) polygon(pts); }
module rsq(half, r) { offset(r) square([2*(half-r), 2*(half-r)], center=true); }

// ---------------- moldura ----------------
module walls() {
  linear_extrude(Z_top) difference() { rsq(yw_o, corner_r); square(2*yw_i, center=true); }
}
module rim() {
  translate([0,0,Z_top-rim_t]) linear_extrude(rim_t)
    difference() { rsq(yw_o+rim_w, corner_r+rim_w); square(2*yw_i, center=true); }
}
// trilhos a 45 graus: apoiam o fan por baixo e assentam na borda do dissipador
module rails() {
  prof = [[yw_i+eps, s], [yw_i-s, 0], [yw_i+eps, 0]];
  segs = wall_cut ? [[-yw_i, lz_a-slit-0.5], [lz_b+slit+0.5, yw_i]] : [[-yw_i, yw_i]];
  for (m=[0,1]) mirror([0,m,0]) for (sg=segs) if (sg[1]-sg[0] > 1) prism_yz(prof, sg[0], sg[1]-sg[0]);
}
// bloco rigido onde nasce cada garra
module leg_roots() {
  y1 = max(yw_o+rim_w, y_top+leg_t);
  for (m=[0,1]) mirror([0,m,0])
    translate([lz_a-slit-1.5, yw_i, Z_top-root_h]) cube([leg_w+2*slit+3, y1-yw_i, root_h]);
}

// ---------------- garras do dissipador ----------------
function leg_profile() =
  let(Yo = Y_i + leg_t, d = yw_i - Y_i, zj = fan_z0 - 0.2, k = 0.4142*leg_t,
      zg = -hs_h*0.45)
  concat(
    [[y_top, Z_top]],
    jog ? [[yw_i, zj], [Y_i, zj-d]] : [],
    [[Y_i, Z1], [Y_i-hook_reach, z_tip], [Y_i-hook_reach, z_tip-hook_nose],
     [Y_i+0.2, zb], [Yo, zb]],
    grip > 0 ? [[Yo, zg-grip], [Yo+grip, zg], [Yo, zg+grip]] : [],
    jog ? [[Yo, zj-d-k], [yw_i+leg_t, zj-k]] : [],
    [[y_top+leg_t, Z_top]]
  );
module legs() { for (m=[0,1]) mirror([0,m,0]) prism_yz(leg_profile(), lz_a, leg_w); }
module leg_wall_cuts() {
  if (wall_cut) for (m=[0,1]) mirror([0,m,0])
    translate([lz_a-slit, yw_i-eps, -1]) cube([leg_w+2*slit, wall_t+2*eps, Z_top-root_h+1]);
}

// ---------------- travas do fan ----------------
module fingers() {
  prof = [[yw_i, fing_root_z-0.5], [yw_i, zc], [yw_i-fing_reach, zc], [yw_i-fing_reach, zc+0.3],
          [yw_i, Z_top], [yw_i+fing_t, Z_top], [yw_i+fing_t, fing_root_z-0.5]];
  for (m=[0,1]) mirror([m,0,0]) for (sy=[-1,1]) prism_xz(prof, sy*fing_y-fing_w/2, fing_w);
}
module finger_cuts() {
  for (m=[0,1]) mirror([m,0,0]) for (sy=[-1,1])
    translate([yw_i-eps, sy*fing_y-fing_w/2-slit, fing_root_z]) cube([wall_t+0.6+eps, fing_w+2*slit, Z_top]);
}
module cable_cuts() {
  for (sy=[-1,1]) translate([yw_i-1, sy*cable_y-cable_w/2, -1]) cube([wall_t+2, cable_w, fan_z0+cable_h+1]);
}

// ---------------- peca ----------------
module part() {
  difference() {
    union() { walls(); rim(); rails(); leg_roots(); }
    finger_cuts(); cable_cuts(); leg_wall_cuts();
  }
  legs();
  fingers();
}

// ---------------- pre-visualizacao (nao exportar) ----------------
module ghost() {
  fin_p = 2.6; nf = floor(hs_w/fin_p);
  color("#333") translate([-hs_len/2, -hs_w/2, -hs_h]) cube([hs_len, hs_w, 2.5]);
  color("#333") for (i=[0:nf]) translate([-hs_len/2, -hs_w/2 + i*(hs_w-1)/nf, -hs_h]) cube([hs_len, 1, hs_h]);
  color("#2a6b3f") translate([-hs_len/2-8, -hs_w/2-3, -hs_h-pcb_gap-1.6]) cube([hs_len+45, hs_w+12, 1.6]);
  color("#c8c8c8", 0.9) translate([0,0,fan_z0]) difference() {
    linear_extrude(fan_t) rsq(fan/2, 4.5);
    translate([0,0,-1]) cylinder(d=76, h=fan_t+2);
  }
  color("#999", 0.9) translate([0,0,fan_z0]) cylinder(d=34, h=fan_t);
}

if (show_ghost) { color("#e8762b") part(); ghost(); }
else if (print_orientation) translate([0,0,Z_top]) rotate([180,0,0]) part();
else part();
