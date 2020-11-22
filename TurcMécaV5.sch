EESchema Schematic File Version 4
LIBS:TurcMécaV5-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Turc Mécanique V5"
Date ""
Rev "5"
Comp "Demain On Change Tout"
Comment1 "L293D"
Comment2 "Mesh Bee"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5C1ABB30
P 8150 3650
F 0 "A1" H 8150 3650 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 8150 4350 50  0000 C CNN
F 2 "Module:Arduino_NanoPersonnalisé" H 8300 2700 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 8150 2650 50  0001 C CNN
	1    8150 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:RJ12 J3
U 1 1 5C1ABCA9
P 5250 5600
F 0 "J3" H 4920 5604 50  0000 R CNN
F 1 "RJ12" H 4920 5695 50  0000 R CNN
F 2 "Connector_RJ:RJ12_Amphenol_54601" V 5250 5625 50  0001 C CNN
F 3 "~" V 5250 5625 50  0001 C CNN
	1    5250 5600
	-1   0    0    1   
$EndComp
$Comp
L Connector:RJ12 J4
U 1 1 5C1ABE3E
P 5250 6400
F 0 "J4" H 4920 6404 50  0000 R CNN
F 1 "RJ12" H 4920 6495 50  0000 R CNN
F 2 "Connector_RJ:RJ12_Amphenol_54601" V 5250 6425 50  0001 C CNN
F 3 "~" V 5250 6425 50  0001 C CNN
	1    5250 6400
	-1   0    0    1   
$EndComp
$Comp
L Connector:RJ12 J5
U 1 1 5C1ABE9E
P 5250 7200
F 0 "J5" H 4920 7204 50  0000 R CNN
F 1 "RJ12" H 4920 7295 50  0000 R CNN
F 2 "Connector_RJ:RJ12_Amphenol_54601" V 5250 7225 50  0001 C CNN
F 3 "~" V 5250 7225 50  0001 C CNN
	1    5250 7200
	-1   0    0    1   
$EndComp
$Comp
L Connector:RJ12 J2
U 1 1 5C1AC024
P 5250 4750
F 0 "J2" H 4920 4754 50  0000 R CNN
F 1 "RJ12" H 4920 4845 50  0000 R CNN
F 2 "Connector_RJ:RJ12_Amphenol_54601" V 5250 4775 50  0001 C CNN
F 3 "~" V 5250 4775 50  0001 C CNN
	1    5250 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7650 3250 7350 3250
Wire Wire Line
	7650 3350 7350 3350
Wire Wire Line
	7650 3950 7350 3950
Wire Wire Line
	7650 4050 7350 4050
Wire Wire Line
	7650 4150 7350 4150
Text Label 7350 3250 0    50   ~ 0
Interupt
Wire Wire Line
	8650 3650 8950 3650
Wire Wire Line
	8650 3750 8950 3750
Wire Wire Line
	8650 3850 8950 3850
Wire Wire Line
	8650 4050 8950 4050
Wire Wire Line
	8650 4150 8950 4150
Text Label 8950 3750 0    50   ~ 0
Telecommande
Text Label 8800 4050 0    50   ~ 0
SDA
Text Label 8800 4150 0    50   ~ 0
SCL
$Comp
L Connector:RJ9 J6
U 1 1 5C1AD649
P 9550 5650
F 0 "J6" H 9221 5654 50  0000 R CNN
F 1 "RJ9" H 9221 5745 50  0000 R CNN
F 2 "Connector_RJ:RJ9_Amphenol_personnalisé" V 9550 5700 50  0001 C CNN
F 3 "~" V 9550 5700 50  0001 C CNN
	1    9550 5650
	-1   0    0    1   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 5C1ADCDE
P 2050 2200
F 0 "F1" H 2110 2246 50  0000 L CNN
F 1 "Fuse" H 2110 2155 50  0000 L CNN
F 2 "Fuse:Fusible_Fuse_Perso" V 1980 2200 50  0001 C CNN
F 3 "~" H 2050 2200 50  0001 C CNN
	1    2050 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5C1AE3B5
P 2050 1450
F 0 "J1" V 1990 1262 50  0000 R CNN
F 1 "Conn_01x02_Female" V 1899 1262 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2050 1450 50  0001 C CNN
F 3 "~" H 2050 1450 50  0001 C CNN
	1    2050 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2050 1650 2050 2050
Wire Wire Line
	2050 2350 2050 2500
$Comp
L Device:C C2
U 1 1 5C1AEB52
P 8350 5650
F 0 "C2" V 8098 5650 50  0000 C CNN
F 1 "C" V 8189 5650 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 8388 5500 50  0001 C CNN
F 3 "~" H 8350 5650 50  0001 C CNN
	1    8350 5650
	0    1    1    0   
$EndComp
$Comp
L Device:CP C1
U 1 1 5C1AF45C
P 2450 2200
F 0 "C1" H 2332 2154 50  0000 R CNN
F 1 "CP" H 2332 2245 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2488 2050 50  0001 C CNN
F 3 "~" H 2450 2200 50  0001 C CNN
	1    2450 2200
	-1   0    0    1   
$EndComp
Text Label 2050 2500 0    50   ~ 0
Alim
Wire Wire Line
	2150 1650 2150 2000
Wire Wire Line
	2150 2000 2450 2000
Wire Wire Line
	2450 2000 2450 2050
Wire Wire Line
	2450 2000 2700 2000
Connection ~ 2450 2000
Text Label 2700 2000 0    50   ~ 0
GND
Wire Wire Line
	2450 2350 2050 2350
Connection ~ 2050 2350
$Comp
L RF_ZigBee:MeshBeeZigBeePro Bee1
U 1 1 5C4CB27E
P 4900 3400
F 0 "Bee1" H 5325 4699 50  0000 C CNN
F 1 "MeshBeeZigBeePro" H 5325 4615 40  0000 C CNN
F 2 "RF_Module:MeshBeeZigBeePro" H 5150 3900 50  0001 C CNN
F 3 "" H 5150 3900 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2400 4550 2400
Wire Wire Line
	8250 2650 8250 2300
Text Label 4550 2400 0    50   ~ 0
3V3
Text Label 8250 2300 0    50   ~ 0
3V3
Wire Wire Line
	4800 3300 4600 3300
Text Label 4600 3300 0    50   ~ 0
GND
Wire Wire Line
	8250 4650 8250 4800
Text Label 8250 4800 1    50   ~ 0
GND
$Comp
L Device:R R2
U 1 1 5C5DCCBB
P 4200 2600
F 0 "R2" V 3993 2600 50  0000 C CNN
F 1 "10K" V 4084 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 4130 2600 50  0001 C CNN
F 3 "~" H 4200 2600 50  0001 C CNN
	1    4200 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5C5DCD7C
P 3800 2600
F 0 "R1" V 3593 2600 50  0000 C CNN
F 1 "15K" V 3684 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P12.70mm_Horizontal" V 3730 2600 50  0001 C CNN
F 3 "~" H 3800 2600 50  0001 C CNN
	1    3800 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 2600 4350 2600
Wire Wire Line
	4050 2600 4000 2600
Wire Wire Line
	3650 2600 3450 2600
Wire Wire Line
	4000 2600 4000 2250
Connection ~ 4000 2600
Wire Wire Line
	4000 2600 3950 2600
Wire Wire Line
	4800 2500 4550 2500
Text Label 3450 2600 0    50   ~ 0
GND
Text Label 4000 2250 3    50   ~ 0
TxArd
Text Label 4550 2500 0    50   ~ 0
RxArd
Wire Wire Line
	7650 3150 7350 3150
Wire Wire Line
	7650 3050 7350 3050
Text Label 7350 3150 0    50   ~ 0
TxArd
Text Label 7350 3050 0    50   ~ 0
RxArd
Text Label 7350 3350 0    50   ~ 0
Interupt2
Wire Wire Line
	4850 4650 4600 4650
Wire Wire Line
	4850 4750 4600 4750
Wire Wire Line
	4850 4850 4600 4850
Wire Wire Line
	4850 4950 4600 4950
Wire Wire Line
	4850 5050 4600 5050
Text Label 4600 4650 0    50   ~ 0
R
Text Label 4600 4750 0    50   ~ 0
V
Text Label 4600 4850 0    50   ~ 0
B
Text Label 4600 4950 0    50   ~ 0
W
Text Label 4600 5050 0    50   ~ 0
GND
Wire Wire Line
	7650 3650 7350 3650
Text Label 7350 3650 0    50   ~ 0
r
Text Label 7350 3950 0    50   ~ 0
v
Text Label 7350 4050 0    50   ~ 0
w
Text Label 7350 4150 0    50   ~ 0
b
Wire Wire Line
	4600 5500 4850 5500
Wire Wire Line
	4850 5600 4600 5600
Wire Wire Line
	4850 5700 4600 5700
Wire Wire Line
	4850 5800 4600 5800
Wire Wire Line
	4850 5900 4600 5900
Wire Wire Line
	4850 6300 4600 6300
Wire Wire Line
	4850 6400 4600 6400
Wire Wire Line
	4850 6500 4600 6500
Wire Wire Line
	4600 6600 4850 6600
Wire Wire Line
	4850 6700 4600 6700
Wire Wire Line
	4850 7100 4600 7100
Wire Wire Line
	4850 7200 4600 7200
Wire Wire Line
	4850 7300 4600 7300
Wire Wire Line
	4850 7400 4600 7400
Wire Wire Line
	4850 7500 4600 7500
NoConn ~ 4850 4550
NoConn ~ 4850 5400
NoConn ~ 4850 6200
NoConn ~ 4850 7000
Text Label 4600 5500 0    50   ~ 0
R
Text Label 4600 5600 0    50   ~ 0
V
Text Label 4600 5700 0    50   ~ 0
B
Text Label 4600 5800 0    50   ~ 0
W
Text Label 4600 5900 0    50   ~ 0
GND
Text Label 4600 6300 0    50   ~ 0
R
Text Label 4600 6400 0    50   ~ 0
V
Text Label 4600 6500 0    50   ~ 0
B
Text Label 4600 6600 0    50   ~ 0
W
Text Label 4600 6700 0    50   ~ 0
GND
Text Label 4600 7100 0    50   ~ 0
R
Text Label 4600 7200 0    50   ~ 0
V
Text Label 4600 7300 0    50   ~ 0
B
Text Label 4600 7400 0    50   ~ 0
W
Text Label 4600 7500 0    50   ~ 0
GND
Wire Wire Line
	8350 2450 8500 2450
Wire Wire Line
	8350 2450 8350 2650
Wire Wire Line
	8500 2450 8500 2150
$Comp
L Connector:Conn_01x03_Male J7
U 1 1 5C6312F3
P 8950 2050
F 0 "J7" H 8923 1980 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8923 2071 50  0000 R CNN
F 2 "Connector:FanPinHeader_1x03_P2.54mm_Vertical" H 8950 2050 50  0001 C CNN
F 3 "~" H 8950 2050 50  0001 C CNN
	1    8950 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	8500 2150 8750 2150
Wire Wire Line
	8050 1950 8750 1950
Wire Wire Line
	8050 1950 8050 2650
Wire Wire Line
	8750 2050 8350 2050
Text Label 8350 2050 0    50   ~ 0
Alim
Wire Wire Line
	8500 2450 8800 2450
Connection ~ 8500 2450
Text Label 8800 2450 0    50   ~ 0
5V
Wire Wire Line
	9150 5850 8800 5850
Text Label 8800 5850 0    50   ~ 0
5V
Text Label 2050 1950 1    50   ~ 0
AlimBrut
Wire Wire Line
	8500 5650 8650 5650
Wire Wire Line
	8650 5650 8650 5750
Wire Wire Line
	8650 5750 9150 5750
Wire Wire Line
	9150 5550 9050 5550
Wire Wire Line
	9050 5550 9050 5300
Text Label 9050 5300 0    50   ~ 0
GND
Wire Wire Line
	8650 5750 8650 5900
Wire Wire Line
	8650 5900 8250 5900
Connection ~ 8650 5750
Text Label 8250 5900 0    50   ~ 0
Interupt
Wire Wire Line
	8200 5650 8000 5650
Text Label 8000 5650 0    50   ~ 0
GND
Wire Wire Line
	9150 5650 8800 5650
Text Label 8800 5100 3    50   ~ 0
Telecommande
$Comp
L Driver_Motor:L293D U1
U 1 1 5C6A246D
P 2750 4300
F 0 "U1" H 2750 5478 50  0000 C CNN
F 1 "L293D" H 2750 5387 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3000 3550 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/l293.pdf" H 2450 5000 50  0001 C CNN
	1    2750 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 5100 2650 5100
Wire Wire Line
	2950 5100 2850 5100
Wire Wire Line
	2850 5100 2750 5100
Connection ~ 2850 5100
Connection ~ 2650 5100
Wire Wire Line
	2750 5100 2750 5250
Connection ~ 2750 5100
Wire Wire Line
	2750 5100 2650 5100
Text Label 2750 5250 1    50   ~ 0
GND
Wire Wire Line
	2250 3700 1800 3700
Wire Wire Line
	2250 3900 1800 3900
Wire Wire Line
	1800 3900 1800 3850
Wire Wire Line
	1550 4100 1550 4400
Wire Wire Line
	1550 4100 2250 4100
Wire Wire Line
	1550 4700 2250 4700
Wire Wire Line
	1550 4400 1300 4400
Connection ~ 1550 4400
Wire Wire Line
	1550 4400 1550 4700
Wire Wire Line
	2250 4300 1850 4300
Wire Wire Line
	2250 4500 1850 4500
Wire Wire Line
	3250 4300 3600 4300
Wire Wire Line
	3250 4500 3600 4500
Wire Wire Line
	3250 3900 3600 3900
Wire Wire Line
	3250 3700 3600 3700
Text Label 1300 4400 0    50   ~ 0
5V
Text Label 1800 3700 0    50   ~ 0
b
Text Label 1800 3850 0    50   ~ 0
w
Text Label 1850 4300 0    50   ~ 0
r
Text Label 1850 4500 0    50   ~ 0
v
Text Label 3600 3700 0    50   ~ 0
B
Text Label 3600 3900 0    50   ~ 0
W
Text Label 3600 4300 0    50   ~ 0
R
Text Label 3600 4500 0    50   ~ 0
V
Wire Wire Line
	2650 3300 2650 2900
Wire Wire Line
	2850 3300 2850 2900
Text Label 2650 2900 1    50   ~ 0
5V
Text Label 2850 2900 1    50   ~ 0
Alim
Wire Wire Line
	8800 5100 8800 5650
Wire Wire Line
	8150 4650 8150 4800
Text Label 8150 4800 1    50   ~ 0
GND
Text Label 8050 1950 0    50   ~ 0
Vin
Wire Wire Line
	6200 1250 6000 1250
Wire Wire Line
	6200 1350 6000 1350
Wire Wire Line
	6200 1450 6000 1450
Wire Wire Line
	6200 1550 6000 1550
Text Label 6000 1250 0    50   ~ 0
5V
Text Label 6000 1350 0    50   ~ 0
GND
Text Label 6000 1450 0    50   ~ 0
SDA
Text Label 6000 1550 0    50   ~ 0
SCL
$Comp
L Connector:Conn_01x04_Female J8
U 1 1 5C6AD0AA
P 6400 1350
F 0 "J8" H 6427 1326 50  0000 L CNN
F 1 "Conn_01x04_Female" H 6427 1235 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6400 1350 50  0001 C CNN
F 3 "~" H 6400 1350 50  0001 C CNN
	1    6400 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x08_Female J9
U 1 1 5C6CE8E0
P 8250 1150
F 0 "J9" H 8277 1126 50  0000 L CNN
F 1 "Conn_01x08_Female" H 8277 1035 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x04_P2.54mm_Vertical" H 8250 1150 50  0001 C CNN
F 3 "~" H 8250 1150 50  0001 C CNN
	1    8250 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 850  7800 850 
Wire Wire Line
	8050 950  7800 950 
Wire Wire Line
	8050 1050 7800 1050
Wire Wire Line
	8050 1150 7800 1150
Wire Wire Line
	8050 1250 7800 1250
Wire Wire Line
	8050 1350 7800 1350
Wire Wire Line
	8050 1450 7800 1450
Wire Wire Line
	8050 1550 7800 1550
Text Label 7800 850  0    50   ~ 0
5V
Text Label 7800 1050 0    50   ~ 0
Alim
Text Label 7800 950  0    50   ~ 0
GND
Text Label 7800 1150 0    50   ~ 0
A2
Text Label 7800 1250 0    50   ~ 0
D5
Text Label 7800 1350 0    50   ~ 0
A3
Text Label 7800 1450 0    50   ~ 0
D4
Text Label 7800 1550 0    50   ~ 0
Interupt2
Wire Wire Line
	8650 3950 8950 3950
Text Label 8950 3850 0    50   ~ 0
A2
Text Label 8950 3950 0    50   ~ 0
A3
Wire Wire Line
	7650 3550 7400 3550
Wire Wire Line
	7650 3450 7400 3450
Text Label 7400 3550 0    50   ~ 0
D5
Text Label 7400 3450 0    50   ~ 0
D4
NoConn ~ 7650 3750
NoConn ~ 7650 3850
NoConn ~ 7650 4250
NoConn ~ 7650 4350
NoConn ~ 8650 3450
NoConn ~ 8650 3150
NoConn ~ 8650 3050
NoConn ~ 8950 3650
NoConn ~ 8650 4250
NoConn ~ 8650 4350
$EndSCHEMATC
