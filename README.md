# Homelab-Server-3D

[![YouTube - Canal Chipset](https://img.shields.io/badge/YouTube-Canal_Chipset-FF0000?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/@Chipset-BR)

> 🎥 **Acompanhe a montagem e os testes completos deste projeto no canal [Chipset](https://www.youtube.com/@Chipset-BR)** — conteúdo sobre hardware, servidores homelab, Proxmox, redes e impressão 3D.


Modelos 3D (OpenSCAD/STL) para impressão na Anycubic Kobra 4: gabinete servidor rack 19" 4U modular para placa-mãe dual Xeon (Oracyn X99) e suportes ultra-slim de ventoinha 80mm para controladora PCIe 4x NVMe (XS44) e HBA LSI SAS 9300-16i. Foco em airflow e montagem sem suportes.

# 🖥️ Modular 4U 19" Rack Server Chassis & Ultra-Slim PCIe Coolers

Modelos 3D paramétricos (**OpenSCAD** e **STL**) projetados sob medida para impressão na **Anycubic Kobra 4** (volume de construção `250 × 250 × 260 mm`), focados em refrigeração ativa de alta eficiência e rigidez estrutural para servidores homelab em racks compactos (profundidade útil de 380 mm para racks de 470 mm).

---

## 📦 O que está incluído neste repositório

1. **Gabinete Servidor Rack 19" 4U Modular (`4U-chassis/`)**
   - Projetado para placas-mãe **Dual Xeon (Oracyn X99 Vortex Dual E-ATX 305×330mm)** e fontes ATX padrão (montagem vertical).
   - Estrutura dividida em **9 módulos** otimizados para a mesa da impressora (4 quadrantes da base/laterais, 2 seções frontais com orelhas 19" e 3 seções traseiras com espelho I/O, 6 slots PCIe e baia da fonte).
   - Recortes laterais para **4 ventoinhas** (2 na esquerda + 2 na direita) de `80 mm`, `92 mm` ou `120 mm` com grelhas hexagonais autoportantes (*support-free*) e furos horizontais em perfil lágrima (*teardrop*).
2. **Suporte Cooler Ultra-Slim para Controladora 4x NVMe (`coolers/nvme-xs44/`)**
   - Duto direcional fechado nas laterais para ventoinha de `80 mm` (15 mm ou 25 mm de espessura).
   - Compatível com placa de bifurcação **PCIe x16 4-Port M.2 NVMe (XS44 VER:2.3 / 25G01)**, direcionando o fluxo de ar diretamente sobre os dissipadores dos SSDs sem interferir nos slots PCIe adjacentes.
3. **Suporte Cooler Ultra-Slim para HBA / RAID (`coolers/lsi-9300-16i/`)**
   - Suporte dedicado com grade hexagonal central para ventoinha de `80 mm` acoplada diretamente sobre o dissipador da controladora **LSI SAS 9300-16i** (IT Mode), evitando *thermal throttling* em gabinetes sem fluxo de ar de datacenter.

---

## 🛠️ Lista de Peças e Materiais

### Filamento & Impressão
- **Material Recomendado:** **PETG** ou **ABS** (obrigatório devido à temperatura interna próxima aos VRMs, HBA e SSDs NVMe — **não utilize PLA**).
- **Consumo Estimado (Gabinete Completo):** ~1.205 g a 1.450 g (aprox. 1,5 rolos de 1 kg).
- **Tempo Estimado de Impressão:** ~39 a 43 horas totais na Anycubic Kobra 4.

### Hardware & Fixação (Parafusos, Porcas e Insertos)
| Qtd. | Item | Aplicação |
| :--- | :--- | :--- |
| **38x** | Parafusos **M4 × 12 mm** (ou 14 mm) + **38x Porcas M4** | União estrutural dos 9 módulos do chassi (base, nervuras, frente e traseira) |
| **12x** | Insertos térmicos **M3** (máx. 6 mm alt.) + **12x Parafusos M3 × 6 mm** | Fixação da placa-mãe (Oracyn X99) nos espaçadores da base |
| **6x** | Parafusos **M3 × 6 mm** (rosca grossa/fina) | Fixação dos brackets nos 6 slots PCIe traseiros |
| **4x** | Parafusos **#6-32** padrão ATX | Fixação da fonte de alimentação no painel traseiro |
| **16x** | Parafusos auto-atarraxantes para ventoinha (**KB5**) | Fixação das 4 ventoinhas laterais de 80 mm do gabinete |
| **8x** | Parafusos para ventoinha (**M4/M5 auto-atarraxantes** ou M3 longos) | Fixação das ventoinhas de 80 mm nos 2 suportes PCIe (NVMe + HBA) |
| **4x a 8x** | Parafusos **M6** + Porcas Gaiola | Fixação das orelhas do gabinete 4U nos trilhos do rack 19" |
| **2x** | Ventoinhas **80 × 80 × 15 mm** (ou 25 mm) PWM 12V | Refrigeração dedicada da placa NVMe XS44 e LSI 9300-16i |
| **4x** | Ventoinhas **80 mm** (configurável p/ 92 mm ou 120 mm) | Ventilação ativa nas laterais esquerda e direita do gabinete 4U |

---

### Links das peças (A quantidade foi a usada por mim, ajuste para o seu cenário)
| Qtd. | Item | Link |
| :--- | :--- | :--- |
| **1x** | Botão Power (16 mm) | https://s.click.aliexpress.com/e/_c3Kl13xT |
| **1x** | Controladora LSI HBA 9300 16i | https://s.click.aliexpress.com/e/_c4KmwL9P |
| **16x** | Adaptador sata | https://s.click.aliexpress.com/e/_c3lJVRPL |
| **2x** | Controladora NVME | https://s.click.aliexpress.com/e/_c4txNuDF |
| **12x** | Dissipador NVME | https://s.click.aliexpress.com/e/_c2zyA4cD |
| **2x** | Xeon 2673 V4 | https://s.click.aliexpress.com/e/_c3M4RwRn |
| **38x** | Parafusos M4 (ajustar bitola para M4×12mm) | https://s.click.aliexpress.com/e/_c3m3VnLj |
| **38x** | Porcas M4 (ajustar bitola para M4) | https://s.click.aliexpress.com/e/_c3BuRpAh |
| **2x** | Extensor sata | https://s.click.aliexpress.com/e/_c2wgFSXP |
| **1x** | Display 6,86" Thermalright | https://s.click.aliexpress.com/e/_c45OJoA5 |
| **12x** | Insertos / Porcas Latão M3 | https://s.click.aliexpress.com/e/_c3jbTFdX |
| **2x** | Cooler 12V Controladora PCI | https://s.click.aliexpress.com/e/_c4LRYwcp |
| **1x** | Extensor PWM: | https://s.click.aliexpress.com/e/_c2ulAxUz |
| **6x** | Fans 80mm PWM | https://s.click.aliexpress.com/e/_c2uvk9B7 |
| **16x** | Extensor sata Hotswap| https://s.click.aliexpress.com/e/_c3pwSj7x |
| **8x** | SSD Netac 2.5" | https://s.click.aliexpress.com/e/_c2zCaSVj |
| **12x** | SSD NVME Netac NV7000 | https://s.click.aliexpress.com/e/_c4lzdAbB |
| **4x** | Memória DDR4 ECC 32GB | https://s.click.aliexpress.com/e/_c3uyLyH3 |
| **1x** | Fonte Pcyes Aether 850w Full Modular Cybenetics Gold | https://meli.la/2tSfmxC |
| **2x** | Cooler Redragon Tyr 120mm | https://meli.la/2aHXssZ |
| **2x** | Filamento PETG | https://meli.la/2ZZB7JZ |
| **1x** | Placa Mãe Oracyn Vortex Dual | https://aliex.co/3unps |

### Links Alternativos:
| Item | Link |
| :--- | :--- |
| Memória DDR4 ECC 16GB | https://meli.la/1X9dPeD |
| SSD Netac NV3000 | https://s.click.aliexpress.com/e/_c3NHvL2p |
| SSD NVME Crucial | https://meli.la/25WENPw |
| Impressora 3D Kobra 4 Combo | https://s.click.aliexpress.com/e/_c3lkJkCZ |
| Impressora 3D Bambu Lab A1 | https://meli.la/34jcV73 |

---

## ⚙️ Configurações de Fatiamento (Anycubic Slicer Next / OrcaSlicer)

Configurações calibradas para a **Anycubic Kobra 4** (bico `0.4 mm`):

| Parâmetro | Gabinete 4U (Estrutural) | Suportes Cooler PCIe (NVMe / HBA) |
| :--- | :--- | :--- |
| **Altura de Camada** | `0.20 mm` | `0.20 mm` |
| **Paredes (Perímetros)** | `4 paredes` (alta rigidez mecânica) | `3 a 4 paredes` |
| **Camadas Topo / Base** | `5 topo / 5 base` | `4 topo / 4 base` |
| **Preenchimento (Infill)** | `25% Gyroid` | `20% Gyroid` |
| **Suportes** | **Desativado** (furos *teardrop* e colmeia) | **Desativado** (grelha hexagonal otimizada) |
| **Velocidade de Impressão** | `150 – 250 mm/s` (paredes externas a `120 mm/s`) | `150 – 200 mm/s` |
| **Temp. Bico / Mesa (PETG)** | `240 °C` / `80 °C` | `240 °C` / `80 °C` |
| **Temp. Bico / Mesa (ABS)** | `255 °C` / `100 °C` (sem ventoinha de peça) | `255 °C` / `100 °C` (sem ventoinha de peça) |

---

## 🔧 Instruções de Montagem

### 1. Montagem do Gabinete 4U
1. **União da Base:** Junte os 4 quadrantes inferiores (`base_fl`, `base_fr`, `base_rl`, `base_rr`) pelas nervuras centrais e colunas laterais utilizando **13 parafusos M4 × 12 mm + porcas M4**.
2. **Insertos da Placa-Mãe:** Com ferro de solda, instale os **12 insertos térmicos M3** nos pilares da base.
3. **Painéis Frontal e Traseiro:** Una as 2 metades frontais (`front_left` + `front_right` com 3x M4) e as 3 seções traseiras (`rear_left` + `rear_mid` + `rear_right` com 4x M4 nos blocos de emenda). Em seguida, acople ambos os painéis à base utilizando os **18 parafusos M4 × 12 mm + porcas M4** restantes nas abas inferiores e laterais.
4. **Instalação do Hardware:** Instale o botão Power frontal (16 mm), parafuse as **4 ventoinhas laterais de 80 mm** com parafusos KB5, fixe a placa-mãe **Oracyn X99** com **12 parafusos M3 × 6 mm** e prenda a fonte ATX na baia traseira com os **4 parafusos #6-32**.

### 2. Instalação dos Suportes Cooler PCIe
1. **LSI SAS 9300-16i:** Encaixe o suporte ultra-slim sobre o dissipador metálico da controladora HBA alinhando os furos de retenção. Parafuse a ventoinha de `80 mm` soprando **em direção ao dissipador** (*intake*).
2. **Placa 4x NVMe (XS44):** Posicione o duto sobre a placa com os 4 SSDs NVMe instalados. As abas laterais fechadas forçam o ar da ventoinha de `80 mm` a percorrer longitudinalmente todo o comprimento dos módulos M.2 e sair pela traseira do gabinete.

---

## 📐 Customização Paramétrica (OpenSCAD)

Os arquivos `.scad` permitem ajustar facilmente via *Customizer*:
- Exportação individual de cada uma das 9 peças (`part_to_render`) já orientadas para a mesa de impressão.
- Altura do rack (`3U` ou `4U`), tamanho das ventoinhas laterais (`80 mm`, `92 mm` ou `120 mm`) e tipo de fonte (`ATX_VERTICAL` ou `FLEX_ATX`).
- Espessura das ventoinhas dos suportes PCIe (`15 mm` slim vs. `25 mm` padrão).

---

## 📄 Licença

Distribuído sob a licença **MIT**. Sinta-se à vontade para modificar, imprimir e compartilhar melhorias para a comunidade homelab!
