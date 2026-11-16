// =====================================================================
//  Suporte de fan 80 mm para placa PCIe x16 -> 4x M.2 NVMe
//  Placa: XS44 VER:2.3 (bifurcation x4x4x4x4)
//
//  Fixa nos 4 furos M3 (com anel dourado) que a placa ja tem em volta
//  dos SSDs. O fan fica centrado sobre os 4 SSDs, soprando para baixo.
//
//  ATENCAO: as medidas dos furos foram estimadas a partir de uma FOTO
//  (escala calibrada pelos contatos PCIe, passo 1,00 mm). Confirme com
//  paquimetro "furos_x" e "furos_y" antes de imprimir.
//
//  Impressao: sem suportes, com a face de cima da chapa na mesa
//  (o STL ja sai nessa posicao). PETG ou ABS/ASA de preferencia.
// =====================================================================

/* [Furos da placa PCIe - CONFIRMAR COM PAQUIMETRO] */
// Distancia entre centros dos furos, no sentido do comprimento da placa (mm)
furos_x = 107.4;
// Distancia entre centros dos furos, no sentido do comprimento dos SSDs (mm)
furos_y = 71.5;

/* [Altura] */
// Altura livre entre a PCB e a parte de baixo da chapa (mm). Aumente se o dissipador dos SSDs for alto.
altura_pernas = 16;
// Espessura da chapa onde o fan apoia (mm)
esp_placa = 3;

/* [Fan] */
// Distancia entre furos do fan (80 mm = 71.5 | 92 mm = 82.5)
fan_furos = 71.5;
// Diametro da abertura de ar (80 mm = 76)
fan_abertura = 76;
// Diametro dos furos do fan (5.0 = parafuso de fan padrao passa livre; 4.5 = M4)
fan_furo_d = 5.0;

/* [Pernas e fixacao M3] */
// Diametro da perna na ponta que encosta na PCB (o anel dourado tem ~6.3 mm)
perna_d_ponta = 7.0;
// Diametro da perna junto da chapa
perna_d_base = 9.2;
// Furo da perna: 2.8 = M3 rosqueia direto no plastico | 3.4 = M3 passante (parafuso longo + porca)
furo_m3_d = 2.8;

/* [Reforcos] */
// Sobra da chapa para fora do centro dos furos, em Y (mm)
margem_y = 6.75;
// Altura da aba de reforco nas laterais (0 = sem aba)
aba_alt = 5;
// Espessura da aba e do bocal
aba_esp = 2;
// Bocal por baixo, em volta da abertura (0 = sem). Atencao: tira esta altura da folga sobre os SSDs
bocal_alt = 0;

/* [Visualizacao] */
// true = posicao de impressao (chapa na mesa) | false = posicao montada
posicao_impressao = true;
// Mostra a placa PCIe, os SSDs e o fan (so para conferir; desligue para exportar o STL)
mostrar_conjunto = false;
// Espessura do fan mostrado no conjunto
fan_esp = 25;

/* [Hidden] */
$fn = 96;
eps = 0.01;
margem_x = perna_d_base / 2;
comp = furos_x + 2 * margem_x;                       // tamanho em X
larg = max(furos_y + 2 * margem_y, fan_furos + 10.5); // tamanho em Y
topo = altura_pernas + esp_placa;

module cantos(dx, dy) {
    for (sx = [-1, 1], sy = [-1, 1])
        translate([sx * dx / 2, sy * dy / 2, 0]) children();
}

module chapa() {
    translate([0, 0, altura_pernas])
        linear_extrude(esp_placa)
            offset(r = margem_x)
                square([comp - 2 * margem_x, larg - 2 * margem_x], center = true);
}

module suporte() {
    difference() {
        union() {
            chapa();
            // pernas conicas (ponta fina na PCB, base larga na chapa)
            cantos(furos_x, furos_y)
                cylinder(d1 = perna_d_ponta, d2 = perna_d_base, h = altura_pernas + eps);
            // abas de reforco nas laterais, ligando as pernas
            if (aba_alt > 0)
                for (sx = [-1, 1])
                    translate([sx * (comp / 2 - aba_esp / 2), 0, altura_pernas - aba_alt / 2])
                        cube([aba_esp, furos_y, aba_alt + eps], center = true);
            // bocal em volta da abertura
            if (bocal_alt > 0)
                translate([0, 0, altura_pernas - bocal_alt])
                    cylinder(d = fan_abertura + 2 * aba_esp, h = bocal_alt + eps);
        }
        // abertura de ar
        translate([0, 0, -1]) cylinder(d = fan_abertura, h = topo + 2);
        // furos do fan
        cantos(fan_furos, fan_furos)
            translate([0, 0, altura_pernas - 1]) cylinder(d = fan_furo_d, h = esp_placa + 2, $fn = 48);
        // furos M3 das pernas (atravessam perna + chapa)
        cantos(furos_x, furos_y)
            translate([0, 0, -1]) cylinder(d = furo_m3_d, h = topo + 2, $fn = 48);
    }
}

// ---------------------------------------------------------------------
//  Conjunto (apenas visual) - posicoes medidas na foto, origem no centro
//  dos 4 furos, Z = 0 na face de cima da PCB
// ---------------------------------------------------------------------
module conjunto() {
    // PCB
    color([0.08, 0.08, 0.08]) {
        translate([-84.3, -49.2, -1.6]) cube([142.7, 91.95, 1.6]);
        translate([-40.7, -58.8, -1.6]) cube([84.65, 9.7, 1.6]);
    }
    // contatos PCIe
    color([0.85, 0.7, 0.2]) translate([-40.7, -58.6, -1.61]) cube([84.65, 5, 1.62]);
    // espelho
    color([0.25, 0.25, 0.27]) translate([-86.0, -62, -6]) cube([1, 112, 20]);
    // furos com anel
    color([0.85, 0.75, 0.45]) cantos(107.4, 71.5)
        difference() { cylinder(d = 6.3, h = 0.05); translate([0, 0, -1]) cylinder(d = 3.2, h = 2); }
    // 4 SSDs 2280 + soquetes
    for (i = [0:3]) translate([-48.4 + i * 24.9, 0, 0]) {
        color([0.1, 0.45, 0.2]) translate([0, -40.3, 2.05]) cube([22, 80, 0.8]);
        color([0.05, 0.05, 0.05]) translate([2.2, -5, 2.85]) cube([18, 14, 1.2]);
        color([0.7, 0.7, 0.72]) translate([4, -30, 2.85]) cube([8, 8, 1.0]);
        color([0.12, 0.12, 0.12]) translate([0, -45, 0]) cube([22, 8.6, 4]);
        color([0.75, 0.75, 0.78]) translate([11, 39.7, 0]) cylinder(d = 5.5, h = 4.6, $fn = 24);
    }
    // dissipador do 4o SSD
    color([0.15, 0.15, 0.15]) translate([-48.4 + 3 * 24.9 + 1, -35, 4.6]) cube([20, 70, 7]);
    // fan
    color([0.2, 0.3, 0.55, 0.28]) translate([0, 0, topo])
        difference() {
            linear_extrude(fan_esp) offset(r = 4) square([fan_furos + 0.5, fan_furos + 0.5], center = true);
            translate([0, 0, -1]) cylinder(d = fan_abertura, h = fan_esp + 2);
        }
    color([0.2, 0.3, 0.55, 0.4]) translate([0, 0, topo + 2]) cylinder(d = 32, h = fan_esp - 4);
}

if (mostrar_conjunto) {
    color([0.95, 0.45, 0.1]) suporte();
    conjunto();
} else if (posicao_impressao) {
    translate([0, 0, topo]) rotate([180, 0, 0]) suporte();
} else {
    suporte();
}
