/* Project name:
     SmartGLCD_240x128_Demo
 * Copyright:
     (c) Mikroelektronika, 2011.
 * Revision History:
     20100910
       - initial release MZ
     20110106
       - adapted for SmartGLCD 240x128 (TL)
     20110613:
       - Adapted GLCD and touch panel declarations for 18F8722 (ZR)
     20130829:
       - Modified for h.Rev 1.51 (JK)
 * Description:
     This example demonstrates advanced usage of Visual GLCD Tool.
     It consisted of two parts, Backlight Change and Keyboard Demo.
     Backlight Change lets you change backlight color of Serial GLCD with Touch Screen.
     Keyboard Demo detects which key is pressed and displays it on screen. Space bar,
     Backspace and Caps Lock keys are supported also.
 * Test configuration:
     MCU:             PIC18F87K22
                      http://ww1.microchip.com/downloads/en/DeviceDoc/39960d.pdf
     dev.tool:        SmartGLCD : ac:SmartGLCD
                      http://www.mikroe.com/smartglcd/
                      mikroProg with mikroICD support
                      http://www.mikroe.com/mikroprog/pic-dspic-pic32/
     Oscillator:      HS-PLL 4x, 48.0000 MHz
     SW:              mikroC PRO for PIC
                      http://www.mikroe.com/mikroc/pic/
*/

#include "SmartGLCD_240x128_Demo_objects.h"

void main() {

  Start_TP();

  while (1) {
    Check_TP();

  }

}