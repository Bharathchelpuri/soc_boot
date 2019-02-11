//============================================================
// IO PAD CELL CONFIGURATION
//============================================================


//============================================================
// GPIO CELL
// GPIO1 - GPIO22
// PRDW0408CDG
//============================================================

CELL_CONFIG GPIO_CELL

CELL_NAME PRDW0408CDG

PORT I   = gpio_pad_out[INDEX]
PORT DS  = 1'b0
PORT OEN = ~gpio_pad_dir[INDEX]
PORT PAD = PIN_PAD
PORT C   = gpio_pad_in[INDEX]
PORT PE  = gpio_pull_en[INDEX]
PORT IE  = 1'b1

END_CELL_CONFIG



//============================================================
// GPIO0 CELL
// PRUW0408CDG
//============================================================

CELL_CONFIG GPIO_SDA_CELL

CELL_NAME PRUW0408CDG

PORT I   = gpio_pad_out[INDEX]
PORT DS  = 1'b0
PORT OEN = ~gpio_pad_dir[INDEX]
PORT PAD = PIN_PAD
PORT C   = gpio_pad_in[INDEX]
PORT PE  = gpio_pull_en[INDEX]
PORT IE  = 1'b1

END_CELL_CONFIG



//============================================================
// DIGITAL IO CELL
// JTAG input pins
// TRST, TCK, TMS, TDI
// PRDW0408CDG
//============================================================

CELL_CONFIG DIGITAL_INPUT_CELL

CELL_NAME PRDW0408CDG

PORT I   = 1'b0
PORT DS  = 1'b0
PORT OEN = 1'b1
PORT PAD = PIN_PAD
PORT C   = CORE_SIGNAL
PORT PE  = 1'b0
PORT IE  = 1'b1

END_CELL_CONFIG



//============================================================
// DIGITAL IO CELL
// JTAG output pin
// TDO
// PRDW0408CDG
//============================================================

CELL_CONFIG DIGITAL_OUTPUT_CELL

CELL_NAME PRDW0408CDG

PORT I   = CORE_SIGNAL
PORT DS  = 1'b0
PORT OEN = 1'b0
PORT PAD = PIN_PAD
PORT C   = 1'b0
PORT PE  = 1'b0
PORT IE  = 1'b0

END_CELL_CONFIG



//============================================================
// ANALOG IO CELL
// ANA0 - ANA9
// ADC_IN
// DAC_OUT
// LDO capacitor pins
// PDB3A
//============================================================

CELL_CONFIG ANALOG_IO_CELL

CELL_NAME PDB3A

PORT AIO = PIN_PAD

END_CELL_CONFIG



//============================================================
// ANALOG POWER CELL
// VDD_1_8
// VDD_2_5
//============================================================

CELL_CONFIG ANALOG_P_CELL

CELL_NAME PVDD2CDG

PORT VDDPST = PIN_PAD

END_CELL_CONFIG



//============================================================
// POWER IO CELL
// VDDPST
// VDD_1_2
//============================================================

CELL_CONFIG POWER_IO_CELL

CELL_NAME PVDD2CDG

PORT VDDPST = PIN_PAD

END_CELL_CONFIG



//============================================================
// GROUND IO CELL
// VSSPST
//============================================================

CELL_CONFIG GROUND_IO_CELL

CELL_NAME PVSS2CDG

PORT VSSPST = PIN_PAD

END_CELL_CONFIG



//============================================================
// RESET IO CELL
// RESET_N
// PRUW0408CDG
//============================================================

CELL_CONFIG RESET_IO_CELL

CELL_NAME PRUW0408CDG

PORT I   = 1'b0
PORT DS  = 1'b0
PORT OEN = 1'b1
PORT PAD = PIN_PAD
PORT C   = CORE_SIGNAL
PORT PE  = 1'b0
PORT IE  = 1'b1

END_CELL_CONFIG



//============================================================
// CLOCK / CRYSTAL CELL
// XTAL_IN / XTAL_OUT
// PXOE1CDG
//============================================================

CELL_CONFIG CLOCK_IO_CELL

CELL_NAME PXOE1CDG

PORT XC = xtal_in_btc
PORT XO = PIN_PAD_XO
PORT XI = PIN_PAD_XI
PORT XE = 1'b1

END_CELL_CONFIG
