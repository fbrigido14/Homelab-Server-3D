// ============================================================================
// GABINETE RACK 19" MODULAR PARA ORACYN X99 DUAL VORTEX PLUS (E-ATX 305x330mm)
// Com Furação para Ventoinhas Laterais | V2.2 - painel traseiro espelhado (I/O + PCIe)
// ============================================================================
//

/* [Seleção de Peça para Exportar STL] */
// "assembly"    -> Visualização completa do gabinete montado
// "front_left"  -> Painel frontal esquerdo + orelha rack + botão Power (241.3 x 177 x 21 mm)
// "front_right" -> Painel frontal direito + orelha rack, liso (241.3 x 177 x 21 mm)
// "rear_left"   -> Painel traseiro X=0..160 (lado DIREITO visto por trás): 6 slots PCIe (160 x 177 x 20 mm)
// "rear_mid"    -> Painel traseiro X=160..337: espelho I/O + exaustão (177 x 177 x 20 mm)
// "rear_right"  -> Painel traseiro X=337..440 (lado ESQUERDO visto por trás): fonte (103 x 177 x 20 mm)
// "base_fl"     -> Quadrante Frontal-Esquerdo + lateral c/ fan (220 x 185 x 177 mm)
// "base_fr"     -> Quadrante Frontal-Direito + lateral c/ fan (220 x 185 x 177 mm)
// "base_rl"     -> Quadrante Traseiro-Esquerdo + lateral c/ fan (220 x 186 x 177 mm)
// "base_rr"     -> Quadrante Traseiro-Direito + lateral c/ fan (220 x 186 x 177 mm)
part_to_render = "assembly";

/* [Impressora] */
bed_x = 250;                 // Largura útil da cama (mm)
bed_y = 250;                 // Profundidade útil da cama (mm)
bed_z = 260;                 // Altura máxima de impressão (mm)
bed_margin = 2;              // Margem reservada para a saia (skirt) em cada lado
teardrop_holes = true;       // Furos horizontais em perfil "lágrima" (sem suporte)

/* [Parâmetros do Rack 19 Polegadas] */
rack_u = 4;                  // 4U (177mm - aceita fan 80/92/120mm) ou 3U (132.5mm - fan 80/92mm)
rack_total_w = 482.6;        // Largura total padrão EIA-310 (19")
rack_hole_pitch_w = 465.1;   // Centro a centro dos furos das orelhas do rack
chassis_w = 440.0;           // Largura externa da caixa (2x 220mm)
chassis_d = 380.0;           // Profundidade externa da caixa (2x 190mm)
chassis_h = (rack_u * 44.45) - 0.8; // Altura externa do gabinete

/* [Ventoinhas Laterais (Esquerda e Direita)] */
enable_left_fans = true;     // Habilita 2 ventoinhas na lateral esquerda
enable_right_fans = true;    // Habilita 2 ventoinhas na lateral direita
side_fan_size = 80;          // Tamanho da ventoinha em mm: 80, 92 ou 120
fan_grille_style = "hex";    // "hex" (colmeia sem suporte p/ impressão 3D) ou "open" (vão aberto)
fan_screw_hole = 4.5;        // Diâmetro p/ parafuso auto-atarraxante de fan (KB5) ou M4

/* [Espessuras Estruturais] */
wall_t = 4.0;                // Espessura das paredes laterais e base
front_t = 5.0;               // Espessura do painel frontal e orelhas do rack
flange_t = 4.0;              // Espessura das abas de união internas
flange_h = 16.0;             // Largura (profundidade) das abas e altura das nervuras
col_top_h = 20.0;            // Altura dos blocos superiores de união (parede esq. e emendas traseiras)
m4_hole = 4.4;               // Diâmetro de passagem para parafuso M4
m3_insert_hole = 4.2;        // Furo para inserto térmico M3 (placa-mãe)

/* [Painel Frontal - Apenas Botão Power] */
power_btn_dia = 16.2;        // Furo p/ botão Power (16.2mm antivandalismo ou 12.2mm)
power_btn_offset_x = 60.0;   // Distância do botão a partir da lateral esquerda
power_btn_offset_z = chassis_h / 2;

/* [Placa-Mãe E-ATX Oracyn X99 Dual Vortex Plus] */
mb_w = 330.0;                // Dimensão da placa ao longo do painel traseiro (eixo X)
mb_d = 305.0;                // Profundidade da placa (eixo Y)
mb_standoff_h = flange_h + 2.0; // Altura dos espaçadores (>= nervuras + 2mm de folga)
mb_standoff_d = 10.0;        // Diâmetro externo da coluna do espaçador
standoff_clear = 0.5;        // Folga radial do recorte da aba traseira ao redor do espaçador
mb_origin_x = wall_t + 8.0;  // X da borda da placa do lado dos slots PCIe (X menor)
mb_origin_y = chassis_d - wall_t - mb_d; // Encostada na traseira
// ORIENTAÇÃO DA PLACA: deitada, componentes p/ cima, conectores voltados p/ trás.
// Nessa posição o bloco I/O fica no canto de X MAIOR da placa (X = mb_origin_x +
// mb_w, lado ESQUERDO quando se olha o gabinete por trás) e os slots PCIe seguem
// dele em direção a X menor (à direita, vistos por trás). Tudo que depende da
// placa (espelho, slots, grelha, espaçadores) é medido a partir desse canto.

/* [Painel Traseiro - I/O, PCIe e Fonte] */
psu_type = "ATX_VERTICAL";   // "ATX_VERTICAL" (86x150mm) ou "FLEX_ATX" (81.5x40.5mm)
io_w = 160.0;                // Largura do recorte do espelho I/O (padrão ATX 158.75 + folga)
io_h = 45.5;                 // Altura do recorte do espelho I/O (padrão ATX 44.45 + folga)
io_edge_gap = 12.0;          // Da borda I/O da placa até o recorte do espelho (padrão ATX 12.27)
io_z_gap = 2.0;              // Fundo do recorte acima da face inferior da placa (PCB 1.6 + 0.4)
pcie_slots = 6;              // 6 slots PCIe da Oracyn X99 Dual
pcie_slot_pitch = 20.32;     // Passo entre slots PCIe
pcie_slot_w = 12.0;
pcie_slot_h = 100.0;
pcie_io_gap = 14.0;          // Do fim do espelho I/O até a abertura do slot PCIe 0
// Posições X das emendas do painel traseiro. Devem cair fora do espelho I/O,
// dos slots PCIe e do recorte da fonte (o console avisa se não caírem).
// V2.2: 160 = entre o slot PCIe 0 e o espelho I/O; 337 = entre o I/O e a fonte.
rear_seams = [160, 337];

/* [Posição dos Parafusos M4] */
front_floor_bolts = [60, 160, 280, 380];       // Painel frontal -> piso (eixo Z)
rear_floor_bolts  = [60, 150, 205, 280, 360, 410]; // Painel traseiro -> piso (eixo Z)
side_bolts_z      = [35, chassis_h - 30];      // Painéis -> paredes laterais (eixo X)
center_bolts_z    = [35, chassis_h/2, chassis_h - 35]; // Aba central frontal (eixo X)
rib_x_bolts_y     = [50, 140, 240, 330];       // Nervura longitudinal X=220 (eixo X)
rib_y_bolts_x     = [60, 150, 280, 380];       // Nervura transversal Y=190 (eixo Y) - 150 afasta da coluna em X=168

$fn = 48;
$print_up = [0, 0, 1];       // Direção "para cima" na impressão (ajustada por peça)

// ============================================================================
// VALORES DERIVADOS
// ============================================================================
ear_w = (rack_total_w - chassis_w) / 2;          // 21.3 mm
mb_z_base = wall_t + mb_standoff_h;              // Face inferior da placa-mãe
tray_y0 = front_t;                               // Início do piso/paredes (atrás do painel frontal)
tray_y1 = chassis_d - wall_t;                    // Fim do piso/paredes (antes do painel traseiro)
rear_fl_y = chassis_d - wall_t - flange_h;       // Início das abas traseiras (Y = 360)
mb_io_edge_x = mb_origin_x + mb_w;               // X da borda I/O da placa (X maior = 342)
mb_rear_y    = mb_origin_y + mb_d;               // Y da borda traseira da placa (= 376)

// Distância entre furos padrão por tamanho de ventoinha (80mm->71.5, 92mm->82.5, 120mm->105.0)
fan_hole_pitch = (side_fan_size == 120) ? 105.0 :
                 (side_fan_size == 92)  ? 82.5  : 71.5;

// Furos da placa-mãe medidos a partir do CANTO I/O da placa (canto traseiro do
// lado do bloco de conectores): [ dist. da borda I/O , dist. da borda traseira ].
// Referência ATX/E-ATX: 6.35 / 163.83 / 209.55 / 288.29  x  10.16 / 165.1 / 237.49.
// Os valores abaixo são os da V2.1 reescritos neste referencial (na V2.1 as
// colunas 1-2 estavam a +10.15 e as colunas 3-4 a +20.3 do padrão ATX).
// >>> CONFERIR COM A PLACA REAL medindo a partir do canto I/O. <<<
mb_holes = [
    [ 16.5, 10.4], [ 16.5, 175.5], [ 16.5, 264.4],
    [174.0, 10.4], [174.0, 175.5], [174.0, 264.4],
    [229.9, 10.4], [229.9, 175.5], [229.9, 264.4],
    [308.6, 10.4], [308.6, 175.5], [308.6, 264.4]
];
// Converte um furo da tabela para coordenadas XY do gabinete (espelha em X)
function mb_hole_xy(pt) = [mb_io_edge_x - pt[0], mb_rear_y - pt[1]];

// Recortes do painel traseiro (todos ancorados no canto I/O da placa)
io_end_x     = mb_io_edge_x - io_edge_gap;        // Lado do espelho voltado p/ a fonte (X maior = 330)
io_start_x   = io_end_x - io_w;                   // Lado do espelho voltado p/ os slots (X menor = 170)
io_start_z   = mb_z_base + io_z_gap;
// Slot 0 é o mais próximo do espelho I/O; os demais seguem em direção a X menor.
pcie_first_x = io_start_x - pcie_io_gap - pcie_slot_w;        // X inicial (menor) do slot 0
function pcie_slot_x(s) = pcie_first_x - s * pcie_slot_pitch; // X inicial (menor) do slot s
pcie_last_x  = pcie_slot_x(pcie_slots - 1);                   // X inicial do último slot
psu_w        = (psu_type == "ATX_VERTICAL") ? 86.0 : 81.5;
psu_x        = chassis_w - wall_t - 92.0;
psu_z        = wall_t + 8.0;

assert(io_end_x + 2 <= psu_x,
       "Espelho I/O colide com o recorte da fonte: aumente io_edge_gap ou mova psu_x");
assert(pcie_last_x >= wall_t + flange_t + 2,
       "Ultimo slot PCIe invade a aba lateral do painel traseiro: reduza pcie_slots ou pcie_io_gap");

// Divisão do painel traseiro em peças
rear_bounds = concat([0], rear_seams, [chassis_w]);
n_rear = len(rear_seams) + 1;

assert(mb_standoff_h >= flange_h + 2,
       "mb_standoff_h deve ser >= flange_h + 2 para a placa-mãe passar sobre as nervuras");
assert(chassis_w/2 + ear_w <= bed_x - 2*bed_margin,
       "Metade do painel frontal (241.3mm) não cabe na cama: reduza bed_margin ou aumente bed_x");

// ============================================================================
// VERIFICAÇÃO DE ENCAIXE NA CAMA (aparece no console ao renderizar)
// ============================================================================
function rear_index(name) = (name == "rear_left") ? 0 : (name == "rear_mid") ? 1 : n_rear - 1;
function part_dims(name) =
    (name == "front_left" || name == "front_right") ?
        [chassis_w/2 + ear_w, chassis_h, front_t + flange_h] :
    (name == "rear_left" || name == "rear_mid" || name == "rear_right") ?
        [rear_bounds[rear_index(name) + 1] - rear_bounds[rear_index(name)], chassis_h, wall_t + flange_h] :
    (name == "base_fl" || name == "base_fr") ?
        [chassis_w/2, chassis_d/2 - tray_y0, chassis_h] :
    (name == "base_rl" || name == "base_rr") ?
        [chassis_w/2, tray_y1 - chassis_d/2, chassis_h] : undef;
function fits(d) = d.x <= bed_x - 2*bed_margin && d.y <= bed_y - 2*bed_margin && d.z <= bed_z;

module check_part(name) {
    d = part_dims(name);
    echo(str(name, ": ", d.x, " x ", d.y, " x ", d.z, " mm (X x Y x Z na impressão) -> ",
             fits(d) ? "CABE" : "NAO CABE",
             " [cama ", bed_x, "x", bed_y, "x", bed_z, ", margem ", bed_margin, "mm]"));
}

all_parts = ["front_left", "front_right", "rear_left", "rear_mid", "rear_right",
             "base_fl", "base_fr", "base_rl", "base_rr"];

// Aviso se uma emenda traseira atravessar um recorte
for (sx = rear_seams) {
    in_io   = (sx > io_start_x - 3) && (sx < io_start_x + io_w + 3);
    in_psu  = (sx > psu_x - 3) && (sx < psu_x + psu_w + 3);
    in_pcie = len([for (s = [0 : pcie_slots - 1])
                   let (x = pcie_slot_x(s))
                   if (sx > x - 3 && sx < x + pcie_slot_w + 3) 1]) > 0;
    if (in_io || in_psu || in_pcie)
        echo(str("AVISO: emenda traseira em X=", sx, " atravessa um recorte (I/O, PCIe ou fonte)."));
}

// Layout do painel traseiro p/ conferência (ordem = da esquerda p/ a direita VISTO POR TRÁS)
echo(str("TRASEIRA (visto por tras, esq->dir): FONTE X=", psu_x, "..", psu_x + psu_w,
         " | I/O X=", io_start_x, "..", io_end_x,
         " | PCIe X=", pcie_last_x, "..", pcie_first_x + pcie_slot_w, " (", pcie_slots, " slots)",
         " | emendas X=", rear_seams));

// ============================================================================
// FUROS COM PERFIL "LÁGRIMA" (TEARDROP) PARA IMPRESSÃO SEM SUPORTE
// ============================================================================
function unit(v) = v / norm(v);
function _perp(a) = (abs(a.x) < 0.9) ? [1, 0, 0] : [0, 1, 0];

module teardrop2d(d) {
    r = d / 2;
    union() {
        circle(d = d);
        polygon([[-r * sin(45), r * cos(45)], [0, r * sqrt(2)], [r * sin(45), r * cos(45)]]);
    }
}

// Furo cilíndrico de diâmetro d, começando na origem e seguindo `axis` por h mm.
// Se o eixo for horizontal na orientação de impressão ($print_up), o furo vira
// lágrima com o vértice apontando para cima (teto a 45°, imprime sem suporte).
module hole(d, h, axis = [0, 0, 1]) {
    a  = unit(axis);
    up = unit($print_up);
    s0 = cross(up, a);
    horiz = teardrop_holes && (norm(s0) > 0.1);
    s  = horiz ? unit(s0) : unit(cross(_perp(a), a));
    u  = cross(a, s);
    multmatrix([[s.x, u.x, a.x, 0],
                [s.y, u.y, a.y, 0],
                [s.z, u.z, a.z, 0],
                [0,   0,   0,   1]])
        linear_extrude(height = h)
            if (horiz) teardrop2d(d); else circle(d = d);
}

// ============================================================================
// MÓDULO: CORTE E FURAÇÃO DE VENTOINHA LATERAL (NO PLANO YZ, CORTANDO EIXO X)
// ============================================================================
module side_fan_cutout(center_y, center_z) {
    ap_r = (side_fan_size - 4.0) / 2;
    half_pitch = fan_hole_pitch / 2;

    translate([0, center_y, center_z]) {
        // 1. Quatro furos de fixação da ventoinha
        for (dy = [-half_pitch, half_pitch])
            for (dz = [-half_pitch, half_pitch])
                translate([-1, dy, dz]) hole(fan_screw_hole, chassis_w + 2, [1, 0, 0]);

        // 2. Passagem de ar (Colmeia auto-suportável em Z ou Vão circular aberto)
        if (fan_grille_style == "open") {
            translate([-1, 0, 0])
                rotate([0, 90, 0])
                    cylinder(r = ap_r, h = chassis_w + 2);
        } else {
            // Colmeia com vértice apontando para cima (+Z) para imprimir sem suporte
            hex_d = 10.0;
            wall_bar = 2.4;
            step_y = (hex_d * sqrt(3) / 2) + wall_bar;
            step_z = (hex_d * 0.75) + wall_bar * 0.866;

            for (row = [-8 : 8]) {
                for (col = [-8 : 8]) {
                    hy = col * step_y + ((abs(row) % 2 == 1) ? step_y / 2 : 0);
                    hz = row * step_z;
                    if (sqrt(hy * hy + hz * hz) < (ap_r - hex_d * 0.45)) {
                        translate([-1, hy, hz])
                            rotate([0, 90, 0])
                                cylinder(d = hex_d, h = chassis_w + 2, $fn = 6);
                    }
                }
            }
        }
    }
}

// ============================================================================
// MÓDULO: PAINEL FRONTAL COMPLETO (DIVIDIDO EM ESQUERDO E DIREITO EM X = 220)
// ============================================================================
module front_panel_full() {
    difference() {
        union() {
            // Placa frontal completa (482.6mm)
            translate([-ear_w, 0, 0])
                cube([rack_total_w, front_t, chassis_h]);

            // Aba central perpendicular (4mm para cada lado do corte em X = 220)
            translate([chassis_w/2 - flange_t, front_t, wall_t])
                cube([flange_t * 2, flange_h, chassis_h - wall_t]);

            // Aba inferior de fixação com a base
            translate([wall_t, front_t, wall_t])
                cube([chassis_w - 2*wall_t, flange_h, flange_t]);

            // Abas laterais internas para parafusar nas paredes laterais
            translate([wall_t, front_t, wall_t])
                cube([flange_t, flange_h, chassis_h - wall_t]);
            translate([chassis_w - wall_t - flange_t, front_t, wall_t])
                cube([flange_t, flange_h, chassis_h - wall_t]);
        }

        // 1. Único furo frontal: Botão Power (+ rebaixo traseiro p/ a porca)
        translate([power_btn_offset_x, -1, power_btn_offset_z])
            hole(power_btn_dia, front_t + 10, [0, 1, 0]);
        translate([power_btn_offset_x, front_t - 2.0, power_btn_offset_z])
            hole(power_btn_dia + 8, 10, [0, 1, 0]);

        // 2. Furação padrão EIA-310 nas orelhas de 19" (rasgos 10.5 x 6.5mm)
        hole_x_left = (chassis_w - rack_hole_pitch_w) / 2;
        hole_x_right = chassis_w - hole_x_left;

        for (u = [0 : rack_u - 1]) {
            u_base = u * 44.45;
            for (z_off = [6.35, 22.225, 38.1]) {
                if (u_base + z_off < chassis_h - 4) {
                    for (hx = [hole_x_left, hole_x_right]) {
                        translate([hx, -1, u_base + z_off])
                            hull() {
                                translate([-2, 0, 0]) rotate([-90, 0, 0]) cylinder(d = 6.5, h = front_t + 2);
                                translate([ 2, 0, 0]) rotate([-90, 0, 0]) cylinder(d = 6.5, h = front_t + 2);
                            }
                    }
                }
            }
        }

        // 3. Furos M4 de fixação com a bandeja base (eixo Z)
        for (fx = front_floor_bolts)
            translate([fx, front_t + flange_h/2, -1])
                hole(m4_hole, wall_t + flange_t + 2, [0, 0, 1]);

        // 4. Furos M4 laterais para travar nas paredes laterais (eixo X, parede a parede)
        for (fz = side_bolts_z)
            for (x0 = [-1, chassis_w - wall_t - flange_t - 1])
                translate([x0, front_t + flange_h/2, fz])
                    hole(m4_hole, wall_t + flange_t + 2, [1, 0, 0]);

        // 5. Furos M4 da aba central (eixo X)
        for (fz = center_bolts_z)
            translate([chassis_w/2 - flange_t - 1, front_t + flange_h/2, fz])
                hole(m4_hole, flange_t * 2 + 2, [1, 0, 0]);
    }
}

module front_piece(x0, x1) {
    intersection() {
        front_panel_full();
        translate([x0, -1, -1])
            cube([x1 - x0, front_t + flange_h + 2, chassis_h + 2]);
    }
}
module front_left()  { front_piece(-ear_w - 1, chassis_w/2); }
module front_right() { front_piece(chassis_w/2, chassis_w + ear_w + 1); }

// ============================================================================
// MÓDULO: BANDEJA BASE + PAREDES LATERAIS INTEGRAIS COM VENTOINHAS
// ============================================================================
// Coluna de união da parede esquerda (em Y = 190). split = true: só o bloco
// superior (chanfrado a 45°) + a nervura transversal, deixando a borda da
// placa-mãe livre. split = false: coluna inteira (x = 4..20, altura total).
module wall_column(split) {
    if (split) {
        translate([wall_t, chassis_d/2 + flange_t, 0])
            rotate([90, 0, 0])
                linear_extrude(height = flange_t * 2)
                    polygon([[0, chassis_h - col_top_h - flange_h],
                             [flange_h, chassis_h - col_top_h],
                             [flange_h, chassis_h],
                             [0, chassis_h]]);
    } else {
        translate([wall_t, chassis_d/2 - flange_t, wall_t])
            cube([flange_h, flange_t * 2, chassis_h - wall_t]);
    }
}

module base_tray_full() {
    // Altura central das ventoinhas (acima da nervura inferior)
    fan_z = (chassis_h + wall_t + flange_h) / 2;
    tray_len = tray_y1 - tray_y0;

    difference() {
        union() {
            // Piso principal (entre o painel frontal e o traseiro)
            translate([0, tray_y0, 0])
                cube([chassis_w, tray_len, wall_t]);

            // Paredes laterais esquerda e direita com altura total do gabinete
            translate([0, tray_y0, 0])
                cube([wall_t, tray_len, chassis_h]);
            translate([chassis_w - wall_t, tray_y0, 0])
                cube([wall_t, tray_len, chassis_h]);

            // Nervura longitudinal central (X = 220), entre as abas dos painéis
            translate([chassis_w/2 - flange_t, tray_y0 + flange_h, wall_t])
                cube([flange_t * 2, (tray_y1 - flange_h) - (tray_y0 + flange_h), flange_h]);

            // Nervura transversal central (Y = 190)
            translate([wall_t, chassis_d/2 - flange_t, wall_t])
                cube([chassis_w - 2*wall_t, flange_t * 2, flange_h]);

            // Colunas verticais de união nas paredes laterais (Y = 190)
            wall_column(split = true);                                   // esquerda (placa-mãe passa aqui)
            translate([chassis_w, 0, 0]) mirror([1, 0, 0]) wall_column(split = false); // direita (inteira)

            // Pilares (Standoffs) da Placa-Mãe E-ATX (posições medidas do canto I/O)
            for (pt = mb_holes)
                translate([mb_hole_xy(pt).x, mb_hole_xy(pt).y, wall_t])
                    cylinder(d = mb_standoff_d, h = mb_standoff_h);
        }

        // 1. Furação e grelha das Ventoinhas Laterais (1 em cada quadrante: Y=95 e Y=285)
        for (fy = [chassis_d * 0.25, chassis_d * 0.75]) {
            if (enable_left_fans)
                intersection() {
                    side_fan_cutout(fy, fan_z);
                    translate([-2, 0, 0]) cube([wall_t + 4, chassis_d, chassis_h]);
                }
            if (enable_right_fans)
                intersection() {
                    side_fan_cutout(fy, fan_z);
                    translate([chassis_w - wall_t - 2, 0, 0]) cube([wall_t + 4, chassis_d, chassis_h]);
                }
        }

        // 2. Furos para insertos térmicos M3 nos pilares da placa-mãe (cegos, 6.5mm)
        for (pt = mb_holes)
            translate([mb_hole_xy(pt).x, mb_hole_xy(pt).y, wall_t + mb_standoff_h - 6.5])
                cylinder(d = m3_insert_hole, h = 7.5);

        // 3. Furos M4 na nervura longitudinal (X = 220, eixo X)
        for (fy = rib_x_bolts_y)
            translate([chassis_w/2 - flange_t - 1, fy, wall_t + flange_h/2])
                hole(m4_hole, flange_t * 2 + 2, [1, 0, 0]);

        // 4. Furos M4 na nervura transversal (Y = 190, eixo Y)
        for (fx = rib_y_bolts_x)
            translate([fx, chassis_d/2 - flange_t - 1, wall_t + flange_h/2])
                hole(m4_hole, flange_t * 2 + 2, [0, 1, 0]);

        // 5. Furos M4 nas colunas de união das paredes laterais (eixo Y)
        //    Esquerda (dividida): bloco inferior + bloco superior
        for (fz = [wall_t + flange_h/2, chassis_h - col_top_h/2])
            translate([wall_t + flange_h/2, chassis_d/2 - flange_t - 1, fz])
                hole(m4_hole, flange_t * 2 + 2, [0, 1, 0]);
        //    Direita (inteira): embaixo, meio e em cima
        for (fz = [wall_t + flange_h/2, chassis_h/2, chassis_h - col_top_h/2])
            translate([chassis_w - wall_t - flange_h/2, chassis_d/2 - flange_t - 1, fz])
                hole(m4_hole, flange_t * 2 + 2, [0, 1, 0]);

        // 6. Furos M4 nas paredes laterais p/ painel frontal e traseiro (eixo X, parede a parede)
        for (fz = side_bolts_z)
            for (x0 = [-1, chassis_w - wall_t - 1])
                for (fy = [front_t + flange_h/2, chassis_d - wall_t - flange_h/2])
                    translate([x0, fy, fz])
                        hole(m4_hole, wall_t + 2, [1, 0, 0]);

        // 7. Furos M4 no piso p/ as abas inferiores dos painéis (eixo Z)
        for (fx = front_floor_bolts)
            translate([fx, front_t + flange_h/2, -1])
                hole(m4_hole, wall_t + 2, [0, 0, 1]);
        for (fx = rear_floor_bolts)
            translate([fx, chassis_d - wall_t - flange_h/2, -1])
                hole(m4_hole, wall_t + 2, [0, 0, 1]);
    }
}

module base_quadrant(qx, qy) {
    intersection() {
        base_tray_full();
        translate([qx * (chassis_w/2), qy * (chassis_d/2), -1])
            cube([chassis_w/2, chassis_d/2, chassis_h + 2]);
    }
}

// ============================================================================
// MÓDULO: PAINEL TRASEIRO COMPLETO (DIVIDIDO EM 3 PEÇAS EM `rear_seams`)
// ============================================================================
// Um bloco de união inferior em uma emenda só é possível se nenhum espaçador da
// placa-mãe cair sobre ele; caso contrário a emenda recebe apenas o bloco superior.
function seam_bottom_ok(sx) =
    let (dists = [for (pt = mb_holes)
                  let (p = mb_hole_xy(pt))
                  if (p.y + mb_standoff_d/2 + standoff_clear > rear_fl_y)
                      abs(p.x - sx)])
    (len(dists) == 0) || (min(dists) > flange_t + mb_standoff_d/2 + standoff_clear + 1);

module rear_panel_full() {
    difference() {
        union() {
            // Parede traseira principal
            translate([0, chassis_d - wall_t, 0])
                cube([chassis_w, wall_t, chassis_h]);

            // Aba inferior para parafusar na base
            translate([wall_t, rear_fl_y, wall_t])
                cube([chassis_w - 2*wall_t, flange_h, flange_t]);

            // Abas laterais internas para parafusar nas paredes laterais
            translate([wall_t, rear_fl_y, wall_t])
                cube([flange_t, flange_h, chassis_h - wall_t]);
            translate([chassis_w - wall_t - flange_t, rear_fl_y, wall_t])
                cube([flange_t, flange_h, chassis_h - wall_t]);

            // Blocos de união nas emendas (4mm para cada lado do corte)
            for (sx = rear_seams) {
                translate([sx - flange_t, rear_fl_y, chassis_h - col_top_h])
                    cube([flange_t * 2, flange_h, col_top_h]);
                if (seam_bottom_ok(sx))
                    translate([sx - flange_t, rear_fl_y, wall_t])
                        cube([flange_t * 2, flange_h, flange_h]);
            }
        }

        // 1. Recorte do Espelho I/O ATX (160 x 45.5mm), encostado na borda I/O da placa
        //    (lado da fonte = X maior; lado ESQUERDO visto por trás)
        translate([io_start_x, chassis_d - wall_t - 1, io_start_z])
            cube([io_w, wall_t + 2, io_h]);

        // 2. Recorte dos 6 Slots PCIe + furo do parafuso de fixação do bracket.
        //    Slot 0 fica junto ao espelho I/O; os demais seguem p/ X menor (direita, visto por trás)
        for (s = [0 : pcie_slots - 1]) {
            slot_x = pcie_slot_x(s);
            translate([slot_x, chassis_d - wall_t - 1, mb_z_base + 8.0])
                cube([pcie_slot_w, wall_t + 2, pcie_slot_h]);
            translate([slot_x + pcie_slot_w/2, chassis_d - wall_t - 1, mb_z_base + 8.0 + pcie_slot_h + 5.0])
                hole(3.2, wall_t + 2, [0, 1, 0]);
        }

        // 3. Recorte da Fonte de Alimentação (Traseira Direita)
        if (psu_type == "ATX_VERTICAL") {
            translate([psu_x, chassis_d - wall_t - 1, psu_z])
                cube([86.0, wall_t + 2, 150.0]);
            for (fz = [psu_z + 6, psu_z + 144])
                for (fx = [psu_x + 6, psu_x + 80])
                    translate([fx, chassis_d - wall_t - 1, fz])
                        hole(4.0, wall_t + 2, [0, 1, 0]);
        } else {
            translate([psu_x, chassis_d - wall_t - 1, psu_z])
                cube([81.5, wall_t + 2, 40.5]);
        }

        // 4. Grelha de Exaustão Traseira (Acima do Espelho I/O)
        for (gx = [io_start_x + 10 : 12 : io_start_x + io_w - 10])
            for (gz = [io_start_z + io_h + 15 : 12 : chassis_h - 15])
                translate([gx, chassis_d - wall_t - 1, gz])
                    rotate([-90, 0, 0]) cylinder(d = 8.0, h = wall_t + 2, $fn = 6);

        // 5. Recortes na aba inferior ao redor dos espaçadores da placa-mãe
        for (pt = mb_holes) {
            p = mb_hole_xy(pt);
            if (p.y + mb_standoff_d/2 + standoff_clear > rear_fl_y)
                translate([p.x, p.y, -1])
                    cylinder(d = mb_standoff_d + 2 * standoff_clear, h = wall_t + flange_t + 2);
        }

        // 6. Furos M4 de fixação com a base (eixo Z)
        for (fx = rear_floor_bolts)
            translate([fx, chassis_d - wall_t - flange_h/2, -1])
                hole(m4_hole, wall_t + flange_t + 2, [0, 0, 1]);

        // 7. Furos M4 laterais para travar nas paredes laterais (eixo X, parede a parede)
        for (fz = side_bolts_z)
            for (x0 = [-1, chassis_w - wall_t - flange_t - 1])
                translate([x0, chassis_d - wall_t - flange_h/2, fz])
                    hole(m4_hole, wall_t + flange_t + 2, [1, 0, 0]);

        // 8. Furos M4 dos blocos de união das emendas (eixo X)
        for (sx = rear_seams) {
            translate([sx - flange_t - 1, chassis_d - wall_t - flange_h/2, chassis_h - col_top_h/2])
                hole(m4_hole, flange_t * 2 + 2, [1, 0, 0]);
            if (seam_bottom_ok(sx))
                translate([sx - flange_t - 1, chassis_d - wall_t - flange_h/2, wall_t + flange_h/2])
                    hole(m4_hole, flange_t * 2 + 2, [1, 0, 0]);
        }
    }
}

module rear_piece(i) {
    x0 = rear_bounds[i];
    x1 = rear_bounds[i + 1];
    intersection() {
        rear_panel_full();
        translate([x0, rear_fl_y - 1, -1])
            cube([x1 - x0, wall_t + flange_h + 2, chassis_h + 2]);
    }
}
module rear_left()  { rear_piece(0); }
module rear_mid()   { rear_piece(1); }
module rear_right() { rear_piece(n_rear - 1); }

// ============================================================================
// GHOST DA PLACA-MÃE (só visualização): PCB, bloco I/O e conectores PCIe,
// p/ conferir a orientação em relação aos recortes do painel traseiro.
// ============================================================================
module mb_ghost() {
    translate([mb_origin_x, mb_origin_y, mb_z_base])
        cube([mb_w, mb_d, 1.6]);
    // Bloco de conectores I/O atravessando o espelho
    translate([io_start_x + 1, mb_rear_y - 30, mb_z_base + 1.6])
        cube([io_w - 2, 30 + wall_t + 1, io_h - 2]);
    // Conectores PCIe (slot 0 junto ao I/O), apenas ilustrativos
    for (s = [0 : pcie_slots - 1])
        translate([pcie_slot_x(s) + pcie_slot_w/2 - 4, mb_rear_y - 115, mb_z_base + 1.6])
            cube([8, 90, 11]);
}

// ============================================================================
// SELETOR DE RENDERIZAÇÃO E EXPORTAÇÃO
// (cada peça já sai deitada na orientação de impressão, com a face externa na cama)
// ============================================================================
if (part_to_render == "assembly") {
    for (n = all_parts) check_part(n);

    color("DarkSlateGray") front_left($print_up = [0, 1, 0]);
    color("SlateGray")     front_right($print_up = [0, 1, 0]);
    color("DimGray")       base_quadrant(0, 0);
    color("Gray")          base_quadrant(1, 0);
    color("Gray")          base_quadrant(0, 1);
    color("DimGray")       base_quadrant(1, 1);
    color("SteelBlue")     rear_left($print_up = [0, -1, 0]);
    color("LightSteelBlue") rear_mid($print_up = [0, -1, 0]);
    color("CadetBlue")     rear_right($print_up = [0, -1, 0]);

    // Ghost da Placa-Mãe Oracyn X99 Dual Vortex Plus (PCB + bloco I/O + PCIe)
    %mb_ghost();
}
else if (part_to_render == "front_left") {
    check_part(part_to_render);
    rotate([90, 0, 0]) translate([ear_w, 0, -chassis_h]) front_left($print_up = [0, 1, 0]);
}
else if (part_to_render == "front_right") {
    check_part(part_to_render);
    rotate([90, 0, 0]) translate([-chassis_w/2, 0, -chassis_h]) front_right($print_up = [0, 1, 0]);
}
else if (part_to_render == "rear_left" || part_to_render == "rear_mid" || part_to_render == "rear_right") {
    check_part(part_to_render);
    i = rear_index(part_to_render);
    rotate([-90, 0, 0]) translate([-rear_bounds[i], -chassis_d, 0]) rear_piece(i, $print_up = [0, -1, 0]);
}
else if (part_to_render == "base_fl") {
    check_part(part_to_render);
    translate([0, -tray_y0, 0]) base_quadrant(0, 0);
}
else if (part_to_render == "base_fr") {
    check_part(part_to_render);
    translate([-chassis_w/2, -tray_y0, 0]) base_quadrant(1, 0);
}
else if (part_to_render == "base_rl") {
    check_part(part_to_render);
    translate([0, -chassis_d/2, 0]) base_quadrant(0, 1);
}
else if (part_to_render == "base_rr") {
    check_part(part_to_render);
    translate([-chassis_w/2, -chassis_d/2, 0]) base_quadrant(1, 1);
}
