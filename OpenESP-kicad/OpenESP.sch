EESchema Schematic File Version 2
LIBS:OpenESP-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:503552-1220
LIBS:OpenESP-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L VCC #PWR?
U 1 1 57AEC439
P 4700 2200
F 0 "#PWR?" H 4700 2050 50  0001 C CNN
F 1 "VCC" H 4700 2350 50  0000 C CNN
F 2 "" H 4700 2200 50  0000 C CNN
F 3 "" H 4700 2200 50  0000 C CNN
	1    4700 2200
	1    0    0    -1  
$EndComp
Text Label 6900 2500 0    60   ~ 0
LIGHT
$Comp
L ATMEGA328P-A IC?
U 1 1 57AEC2DB
P 5600 3400
F 0 "IC?" H 4850 4650 50  0000 L BNN
F 1 "ATMEGA328P-A" H 6000 2000 50  0000 L BNN
F 2 "TQFP32" H 5600 3400 50  0000 C CIN
F 3 "" H 5600 3400 50  0000 C CNN
	1    5600 3400
	1    0    0    -1  
$EndComp
Text Label 6900 3750 0    60   ~ 0
RST
$Comp
L Crystal_Small Y?
U 1 1 57B3D7E2
P 7900 3000
F 0 "Y?" H 7900 3100 50  0000 C CNN
F 1 "Crystal_Small" H 7900 2900 50  0000 C CNN
F 2 "" H 7900 3000 50  0000 C CNN
F 3 "" H 7900 3000 50  0000 C CNN
	1    7900 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 2200 4700 2600
Wire Wire Line
	6600 2500 7400 2500
Wire Wire Line
	6600 3750 7950 3750
Wire Wire Line
	6600 2900 7900 2900
Wire Wire Line
	6600 3000 7650 3000
Wire Wire Line
	7650 3000 7650 3100
Wire Wire Line
	7650 3100 7900 3100
Wire Wire Line
	6600 3550 7400 3550
Wire Wire Line
	6600 3650 7400 3650
$Comp
L C C?
U 1 1 57B3D9F2
P 8100 3750
F 0 "C?" H 8125 3850 50  0000 L CNN
F 1 "0.1uF" H 8125 3650 50  0000 L CNN
F 2 "" H 8138 3600 50  0000 C CNN
F 3 "" H 8100 3750 50  0000 C CNN
	1    8100 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 3750 8800 3750
Connection ~ 7550 3750
Text Label 8600 3750 0    60   ~ 0
DTR
$Comp
L R R?
U 1 1 57B3DAF1
P 7550 3500
F 0 "R?" V 7630 3500 50  0000 C CNN
F 1 "10k" V 7550 3500 50  0000 C CNN
F 2 "" V 7480 3500 50  0000 C CNN
F 3 "" H 7550 3500 50  0000 C CNN
	1    7550 3500
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 57B3DB2D
P 7550 3350
F 0 "#PWR?" H 7550 3200 50  0001 C CNN
F 1 "VCC" H 7550 3500 50  0000 C CNN
F 2 "" H 7550 3350 50  0000 C CNN
F 3 "" H 7550 3350 50  0000 C CNN
	1    7550 3350
	1    0    0    -1  
$EndComp
Text Label 6900 3650 0    60   ~ 0
SCL
Text Label 6900 3550 0    60   ~ 0
SDA
Wire Wire Line
	7550 3650 7550 3750
Wire Wire Line
	6600 3900 7400 3900
Wire Wire Line
	6600 4000 7400 4000
Text Label 6900 3900 0    60   ~ 0
RX
Text Label 6900 4000 0    60   ~ 0
TX
$Comp
L C C?
U 1 1 57B3E0E4
P 3400 3250
F 0 "C?" H 3425 3350 50  0000 L CNN
F 1 "0.1uF" H 3425 3150 50  0000 L CNN
F 2 "" H 3438 3100 50  0000 C CNN
F 3 "" H 3400 3250 50  0000 C CNN
	1    3400 3250
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 57B3E131
P 3050 3250
F 0 "C?" H 3075 3350 50  0000 L CNN
F 1 "10uF" H 3075 3150 50  0000 L CNN
F 2 "" H 3088 3100 50  0000 C CNN
F 3 "" H 3050 3250 50  0000 C CNN
	1    3050 3250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 57B3E17B
P 3050 3100
F 0 "#PWR?" H 3050 2950 50  0001 C CNN
F 1 "VCC" H 3050 3250 50  0000 C CNN
F 2 "" H 3050 3100 50  0000 C CNN
F 3 "" H 3050 3100 50  0000 C CNN
	1    3050 3100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 57B3E1BB
P 3400 3100
F 0 "#PWR?" H 3400 2950 50  0001 C CNN
F 1 "VCC" H 3400 3250 50  0000 C CNN
F 2 "" H 3400 3100 50  0000 C CNN
F 3 "" H 3400 3100 50  0000 C CNN
	1    3400 3100
	1    0    0    -1  
$EndComp
Connection ~ 4700 2400
$Comp
L GND #PWR?
U 1 1 57B3E35F
P 3400 3400
F 0 "#PWR?" H 3400 3150 50  0001 C CNN
F 1 "GND" H 3400 3250 50  0000 C CNN
F 2 "" H 3400 3400 50  0000 C CNN
F 3 "" H 3400 3400 50  0000 C CNN
	1    3400 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57B3E3ED
P 3050 3400
F 0 "#PWR?" H 3050 3150 50  0001 C CNN
F 1 "GND" H 3050 3250 50  0000 C CNN
F 2 "" H 3050 3400 50  0000 C CNN
F 3 "" H 3050 3400 50  0000 C CNN
	1    3050 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3150 7400 3150
Text Label 6900 3150 0    60   ~ 0
ID
$Comp
L VCC #PWR?
U 1 1 57B3E372
P 2900 5550
F 0 "#PWR?" H 2900 5400 50  0001 C CNN
F 1 "VCC" H 2900 5700 50  0000 C CNN
F 2 "" H 2900 5550 50  0000 C CNN
F 3 "" H 2900 5550 50  0000 C CNN
	1    2900 5550
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 57B3E3A2
P 2700 5500
F 0 "#PWR?" H 2700 5350 50  0001 C CNN
F 1 "+BATT" H 2700 5640 50  0000 C CNN
F 2 "" H 2700 5500 50  0000 C CNN
F 3 "" H 2700 5500 50  0000 C CNN
	1    2700 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5750 2100 5750
Wire Wire Line
	2900 5850 2100 5850
Wire Wire Line
	1300 6250 2900 6250
Text Label 2100 6250 0    60   ~ 0
ID
Text Label 2100 5750 0    60   ~ 0
SCL
Text Label 2100 5850 0    60   ~ 0
SDA
Wire Wire Line
	2900 6350 2100 6350
Wire Wire Line
	2900 6450 2100 6450
Text Label 2100 6350 0    60   ~ 0
TX
Text Label 2100 6450 0    60   ~ 0
RX
Wire Wire Line
	2900 6550 2100 6550
Text Label 2100 6550 0    60   ~ 0
DTR
$Comp
L GND #PWR?
U 1 1 57B3E54F
P 2900 6650
F 0 "#PWR?" H 2900 6400 50  0001 C CNN
F 1 "GND" H 2900 6500 50  0000 C CNN
F 2 "" H 2900 6650 50  0000 C CNN
F 3 "" H 2900 6650 50  0000 C CNN
	1    2900 6650
	1    0    0    -1  
$EndComp
$Comp
L 503552-1220 J?
U 1 1 57B3E2A8
P 3650 6100
F 0 "J?" H 3650 6000 50  0000 C CNN
F 1 "503552-1220" H 3650 6200 50  0000 C CNN
F 2 "MODULE" H 3650 6100 50  0001 C CNN
F 3 "DOCUMENTATION" H 3650 6100 50  0001 C CNN
	1    3650 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 5950 2100 5950
Wire Wire Line
	2900 6050 2100 6050
Wire Wire Line
	2900 6150 2100 6150
Wire Wire Line
	6600 3250 7400 3250
Text Label 6900 3250 0    60   ~ 0
ADC
Text Label 2100 5950 0    60   ~ 0
ADC
Text Label 2100 6050 0    60   ~ 0
PWM
Wire Wire Line
	6600 4200 7400 4200
Text Label 6900 4200 0    60   ~ 0
PWM
Wire Wire Line
	6600 4400 7400 4400
Text Label 6900 4400 0    60   ~ 0
PWM2
Text Label 2100 6150 0    60   ~ 0
PWM2
Wire Wire Line
	2700 5500 2700 5650
Wire Wire Line
	2700 5650 2900 5650
$Comp
L GND #PWR?
U 1 1 57B3F861
P 4700 4800
F 0 "#PWR?" H 4700 4550 50  0001 C CNN
F 1 "GND" H 4700 4650 50  0000 C CNN
F 2 "" H 4700 4800 50  0000 C CNN
F 3 "" H 4700 4800 50  0000 C CNN
	1    4700 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4400 4700 4800
Connection ~ 4700 4500
Connection ~ 4700 4600
Wire Wire Line
	1300 6250 1300 6400
$Comp
L R R?
U 1 1 57B50245
P 1300 6550
F 0 "R?" V 1380 6550 50  0000 C CNN
F 1 "10k" V 1300 6550 50  0000 C CNN
F 2 "" V 1230 6550 50  0000 C CNN
F 3 "" H 1300 6550 50  0000 C CNN
	1    1300 6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 57B5028C
P 1300 6700
F 0 "#PWR?" H 1300 6450 50  0001 C CNN
F 1 "GND" H 1300 6550 50  0000 C CNN
F 2 "" H 1300 6700 50  0000 C CNN
F 3 "" H 1300 6700 50  0000 C CNN
	1    1300 6700
	1    0    0    -1  
$EndComp
$EndSCHEMATC