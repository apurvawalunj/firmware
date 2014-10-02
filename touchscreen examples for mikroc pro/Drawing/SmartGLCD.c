/* Project Name:
     TouchPanel (Demo for working with TouchPanel Controller)
 * Copyright:
     (c) mikroElektronika, 2011.
 * Revision History:
     20110110:
       - Initial release (TL)
     20110613:
       - Adapted GLCD and touch panel declarations for 18F8722 (ZR)
     20130829:
       - Modified for h.Rev 1.51 (JK)
 * Description:
     This code in intended to work with TouchPanel and SmartGLCD.
* Test configuration:
     MCU:             PIC18F87K22
                      http://ww1.microchip.com/downloads/en/DeviceDoc/39960d.pdf
     Dev.Tool:        SmartGLCD : ac:SmartGLCD
                      http://www.mikroe.com/smartglcd/
                      mikroProg with mikroICD support
                      http://www.mikroe.com/mikroprog/pic-dspic-pic32/
     Oscillator:      HS-PLL 4x, 48.0000 MHz
     SW:              mikroPascal PRO for PIC
                      http://www.mikroe.com/mikropascal/pic/
*/

#include        "__T6963C.h"

// T6963C module connections
char T6963C_dataPort at PORTH;
sbit T6963C_ctrlwr at LATJ2_bit;
sbit T6963C_ctrlrd at LATJ1_bit;
sbit T6963C_ctrlcd at LATJ0_bit;
sbit T6963C_ctrlrst at LATJ4_bit;
sbit T6963C_ctrlwr_Direction at TRISJ2_bit;
sbit T6963C_ctrlrd_Direction at TRISJ1_bit;
sbit T6963C_ctrlcd_Direction at TRISJ0_bit;
sbit T6963C_ctrlrst_Direction at TRISJ4_bit;
sbit T6963C_ctrlce at LATJ3_bit;
sbit T6963C_ctrlfs at LATJ6_bit;
sbit T6963C_ctrlmd at LATJ5_bit;
sbit T6963C_ctrlce_Direction at TRISJ3_bit;
sbit T6963C_ctrlfs_Direction at TRISJ6_bit;
sbit T6963C_ctrlmd_Direction at TRISJ5_bit;

sbit BacklightRed_Direction  at TRISC2_bit;
sbit BacklightGreen_Direction at TRISC1_bit;
sbit BacklightBlue_Direction  at TRISG0_bit;
sbit BacklightRed   at LATC2_bit;
sbit BacklightGreen at LATC1_bit;
sbit BacklightBlue  at LATG0_bit;
// End T6963C module connections


// Touch Panel module connections
sbit DriveA at LATG3_bit;
sbit DriveB at LATG4_bit;
sbit DriveA_Direction at TRISG3_bit;
sbit DriveB_Direction at TRISG4_bit;
// End Touch Panel module connections

char write_erase;
unsigned int x_coord240, y_coord128;            // x-y position
char write_msg[] = "WRITE";                     // GLCD menu messages
char clear_msg[] = "CLEAR";
char erase_msg[] = "ERASE";
const unsigned int ADC_THRESHOLD = 500;         // Threshold value for press detecting

void Calibrate() {

  T6963C_box(0,126,1,127, T6963C_WHITE);
  T6963C_write_text("TOUCH BOTTOM LEFT", 6, 6, 1);

  TP_Calibrate_Bottom_Left();
  Delay_ms(700);

  T6963C_panelFill(0);
  T6963C_box(238, 1, 240, 0,T6963C_WHITE);
  T6963C_write_text("TOUCH UPPER RIGHT", 6, 6, 1);

  TP_Calibrate_Upper_Right();
  Delay_ms(1500);
}

void main() {
  ANCON0 = 0;
  ANCON1 = 0;
  ANCON2 = 0;

  ANCON0.B0 = 1;            // Configure RA0 pin as analog
  ANCON0.B1 = 1;            // Configure RA1 pin as analog

  TRISA.B0 = 1;             // Set RA0 pin as input
  TRISA.B1 = 1;             // Set RA1 pin as input
  
  ADC_Init();
  T6963C_ctrlce_Direction = 0;
  T6963C_ctrlce = 0;            // Enable T6963C
  T6963C_ctrlmd_Direction = 0;
  T6963C_ctrlmd = 0;            // Column number select
  T6963C_ctrlfs_Direction = 0;
  T6963C_ctrlfs = 0;            // Wide Font

  BacklightRed_Direction   = 0; // Set backlight signals as outputs
  BacklightGreen_Direction = 0;
  BacklightBlue_Direction  = 0;
  BacklightRed   = 0;           // Turn on Red component of back light
  BacklightGreen = 0;           // Turn on Green component of back light
  BacklightBlue  = 0;           // Turn on Blue component of back light

  // Initialize T6963C
  T6963C_init(240, 128, 8);
  T6963C_graphics(1);
  T6963C_text(1);
  T6963C_cursor(0);

  TP_Init(240, 128, 0, 1);      // Initialize touch panel
  TP_Set_ADC_Threshold(500);    // Set touch panel ADC threshold

  T6963C_graphics(1);
  T6963C_text(1);

  T6963C_panelFill(0);
  T6963C_write_text("CALIBRATION", 8, 6, 1);
  Delay_ms(2000);

  T6963C_panelFill(0);
  Calibrate();
  T6963C_panelFill(0);

  T6963C_write_text("WRITE ON SCREEN", 7, 6, 1) ;
  Delay_ms(1000);
  T6963C_panelFill(0);

  //Draw menus:
  T6963C_box(0,0,42,7,T6963C_WHITE);
  T6963C_write_text(clear_msg,0,0,0);
  T6963C_box(200,0,240,7,T6963C_WHITE);
  T6963C_write_text(erase_msg,25,0,0);
  T6963C_box(57,0,65,7,T6963C_WHITE);
  T6963C_write_char('R',7,0,0);
  T6963C_box(73,0,81,7,T6963C_WHITE);
  T6963C_write_char('G',9,0,0);
  T6963C_box(89,0,97,7,T6963C_WHITE);
  T6963C_write_char('B',11,0,0);
  T6963C_box(105,0,145,7,T6963C_WHITE);
  T6963C_write_text("Light",13,0,0);

  write_erase = 1;

  while (1) {

    if (TP_Press_Detect()) {
      // get coordinates
      if (TP_Get_Coordinates(&x_coord240, &y_coord128) == 0){

        // If clear is pressed
        if ((x_coord240 < 32) && (y_coord128 < 8)) {

           T6963C_panelFill(0);

           // Draw menus:
           T6963C_box(0,0,42,7,T6963C_WHITE);
           T6963C_write_text(clear_msg,0,0,0);
           T6963C_box(200,0,240,7,T6963C_WHITE);
           if (write_erase)
             T6963C_write_text(erase_msg,25,0,0);
           else
             T6963C_write_text(write_msg,25,0,0);

           T6963C_box(57,0,65,7,T6963C_WHITE);
           T6963C_write_char('R',7,0,0);
           T6963C_box(73,0,81,7,T6963C_WHITE);
           T6963C_write_char('G',9,0,0);
           T6963C_box(89,0,97,7,T6963C_WHITE);
           T6963C_write_char('B',11,0,0);
           T6963C_box(105,0,145,7,T6963C_WHITE);
           T6963C_write_text("Light",13,0,0);
         }

        // If write/erase is pressed:
        if ((x_coord240 > 201) && (y_coord128 < 8)) {
           if (write_erase) {
             write_erase = 0;
             T6963C_write_text(write_msg,25,0,0);
             Delay_ms(200);
             }
           else {
             write_erase = 1;
             T6963C_write_text(erase_msg,25,0,0);
             Delay_ms(200);
             }
           }

        // If R button is pressed:
        if ((x_coord240 >= 57) && (x_coord240 <= 65) && (y_coord128 <= 7)) {
          PORTC.F2 = !PORTC.F2;   // Red
          Delay_ms(100);
        }

        // If G button is pressed:
        if ((x_coord240 >= 73) && (x_coord240 <= 81) && (y_coord128 <= 7)) {
          PORTC.F1 = !PORTC.F1;   // Green
          Delay_ms(100);
        }

        // If B button is pressed:
        if ((x_coord240 >= 89) && (x_coord240 <= 97) && (y_coord128 <= 7)) {
          PORTG.F0 = !PORTG.F0;   // Blue
          Delay_ms(100);
        }
        // If backlight button is pressed:
        if ((x_coord240 >= 105) && (x_coord240 <= 146) && (y_coord128 <= 7)) {
          PORTC.F2 = !PORTC.F2;   // Red
          PORTC.F1 = !PORTC.F1;   // Green
          PORTG.F0 = !PORTG.F0;   // Blue
          Delay_ms(100);
        }

        // Draw on the screen
        if (y_coord128 > 8)
        {
          if (write_erase) T6963C_dot(x_coord240, y_coord128, T6963C_WHITE);
          else T6963C_dot(x_coord240, y_coord128, T6963C_BLACK);
        }
      }
    }
  }
}