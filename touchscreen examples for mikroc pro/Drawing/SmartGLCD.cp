#line 1 "C:/Users/Bill Gates/school/ee5100-advanced-electronics/touchscreen/smartglcd_examples/SmartGLCD 240x128 Examples/Examples HW rev 1.51/SmartGLCD 240x128 - mikroC PRO for PIC Examples/Drawing/SmartGLCD.c"
#line 1 "c:/users/bill gates/school/ee5100-advanced-electronics/touchscreen/smartglcd_examples/smartglcd 240x128 examples/examples hw rev 1.51/smartglcd 240x128 - mikroc pro for pic examples/drawing/__t6963c.h"
#line 165 "c:/users/bill gates/school/ee5100-advanced-electronics/touchscreen/smartglcd_examples/smartglcd 240x128 examples/examples hw rev 1.51/smartglcd 240x128 - mikroc pro for pic examples/drawing/__t6963c.h"
void T6963C_init(unsigned int w, unsigned char h, unsigned char fntW);
void T6963C_writeData(unsigned char mydata);
void T6963C_writeCommand(unsigned char mydata);
void T6963C_setPtr(unsigned int addr, unsigned char t);
void T6963C_waitReady(void);
void T6963C_fill(unsigned char mydata, unsigned int start, unsigned int len);
void T6963C_dot(int x, int y, unsigned char color);
void T6963C_write_char(unsigned char c, unsigned char x, unsigned char y, unsigned char mode);
void T6963C_write_text(unsigned char *str, unsigned char x, unsigned char y, unsigned char mode);
void T6963C_line(int px0, int py0, int px1, int py1, unsigned char pcolor);
void T6963C_rectangle(int x0, int y0, int x1, int y1, unsigned char pcolor);
void T6963C_box(int x0, int y0, int x1, int y1, unsigned char pcolor);
void T6963C_circle(int x, int y, long r, unsigned char pcolor);
void T6963C_image(const char *pic);
void T6963C_sprite(unsigned char px, unsigned char py, const char *pic, unsigned char sx, unsigned char sy);
void T6963C_set_cursor(unsigned char x, unsigned char y);
void T6963C_PartialImage(unsigned int x_left, unsigned int y_top, unsigned int width,
 unsigned int height, code const unsigned short * image);
void T6963C_Rectangle_Round_Edges(unsigned int x_upper_left, unsigned int y_upper_left,
 unsigned int x_bottom_right, unsigned int y_bottom_right,
 unsigned int round_radius, unsigned short color);
void T6963C_Rectangle_Round_Edges_Fill(unsigned int x_upper_left, unsigned int y_upper_left,
 unsigned int x_bottom_right, unsigned int y_bottom_right,
 unsigned int round_radius, unsigned short color);
void T6963C_Circle_Fill(int x_center, int y_center, int radius, unsigned short color);
#line 194 "c:/users/bill gates/school/ee5100-advanced-electronics/touchscreen/smartglcd_examples/smartglcd 240x128 examples/examples hw rev 1.51/smartglcd 240x128 - mikroc pro for pic examples/drawing/__t6963c.h"
extern sfr char T6963C_dataPort;
extern sfr char T6963C_cntlPort;

extern unsigned int T6963C_grWidth;
extern unsigned int T6963C_grHeight;
extern unsigned int T6963C_txtCols;

extern unsigned int T6963C_fontWidth;
extern unsigned int T6963C_grHomeAddr;
extern unsigned int T6963C_textHomeAddr;
extern unsigned int T6963C_grMemSize;
extern unsigned int T6963C_txtMemSize;

extern sfr sbit T6963C_cntlwr;
extern sfr sbit T6963C_cntlrd;
extern sfr sbit T6963C_cntlcd;
extern sfr sbit T6963C_cntlrst;

extern unsigned char T6963C_display;
#line 29 "C:/Users/Bill Gates/school/ee5100-advanced-electronics/touchscreen/smartglcd_examples/SmartGLCD 240x128 Examples/Examples HW rev 1.51/SmartGLCD 240x128 - mikroC PRO for PIC Examples/Drawing/SmartGLCD.c"
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

sbit BacklightRed_Direction at TRISC2_bit;
sbit BacklightGreen_Direction at TRISC1_bit;
sbit BacklightBlue_Direction at TRISG0_bit;
sbit BacklightRed at LATC2_bit;
sbit BacklightGreen at LATC1_bit;
sbit BacklightBlue at LATG0_bit;




sbit DriveA at LATG3_bit;
sbit DriveB at LATG4_bit;
sbit DriveA_Direction at TRISG3_bit;
sbit DriveB_Direction at TRISG4_bit;


char write_erase;
unsigned int x_coord240, y_coord128;
char write_msg[] = "WRITE";
char clear_msg[] = "CLEAR";
char erase_msg[] = "ERASE";
const unsigned int ADC_THRESHOLD = 500;

void Calibrate() {

 T6963C_box(0,126,1,127,  0b1000 );
 T6963C_write_text("TOUCH BOTTOM LEFT", 6, 6, 1);

 TP_Calibrate_Bottom_Left();
 Delay_ms(700);

  T6963C_fill(0, 0, (T6963C_grMemSize + T6963C_txtMemSize) ) ;
 T6963C_box(238, 1, 240, 0, 0b1000 );
 T6963C_write_text("TOUCH UPPER RIGHT", 6, 6, 1);

 TP_Calibrate_Upper_Right();
 Delay_ms(1500);
}

void main() {
 ANCON0 = 0;
 ANCON1 = 0;
 ANCON2 = 0;

 ANCON0.B0 = 1;
 ANCON0.B1 = 1;

 TRISA.B0 = 1;
 TRISA.B1 = 1;

 ADC_Init();
 T6963C_ctrlce_Direction = 0;
 T6963C_ctrlce = 0;
 T6963C_ctrlmd_Direction = 0;
 T6963C_ctrlmd = 0;
 T6963C_ctrlfs_Direction = 0;
 T6963C_ctrlfs = 0;

 BacklightRed_Direction = 0;
 BacklightGreen_Direction = 0;
 BacklightBlue_Direction = 0;
 BacklightRed = 0;
 BacklightGreen = 0;
 BacklightBlue = 0;


 T6963C_init(240, 128, 8);
  T6963C_display. F3  = 1; T6963C_writeCommand(T6963C_display) ;
  T6963C_display. F2  = 1; T6963C_writeCommand(T6963C_display) ;
  T6963C_display. F1  = 0; T6963C_writeCommand(T6963C_display) ;

 TP_Init(240, 128, 0, 1);
 TP_Set_ADC_Threshold(500);

  T6963C_display. F3  = 1; T6963C_writeCommand(T6963C_display) ;
  T6963C_display. F2  = 1; T6963C_writeCommand(T6963C_display) ;

  T6963C_fill(0, 0, (T6963C_grMemSize + T6963C_txtMemSize) ) ;
 T6963C_write_text("CALIBRATION", 8, 6, 1);
 Delay_ms(2000);

  T6963C_fill(0, 0, (T6963C_grMemSize + T6963C_txtMemSize) ) ;
 Calibrate();
  T6963C_fill(0, 0, (T6963C_grMemSize + T6963C_txtMemSize) ) ;

 T6963C_write_text("WRITE ON SCREEN", 7, 6, 1) ;
 Delay_ms(1000);
  T6963C_fill(0, 0, (T6963C_grMemSize + T6963C_txtMemSize) ) ;


 T6963C_box(0,0,42,7, 0b1000 );
 T6963C_write_text(clear_msg,0,0,0);
 T6963C_box(200,0,240,7, 0b1000 );
 T6963C_write_text(erase_msg,25,0,0);
 T6963C_box(57,0,65,7, 0b1000 );
 T6963C_write_char('R',7,0,0);
 T6963C_box(73,0,81,7, 0b1000 );
 T6963C_write_char('G',9,0,0);
 T6963C_box(89,0,97,7, 0b1000 );
 T6963C_write_char('B',11,0,0);
 T6963C_box(105,0,145,7, 0b1000 );
 T6963C_write_text("Light",13,0,0);

 write_erase = 1;

 while (1) {

 if (TP_Press_Detect()) {

 if (TP_Get_Coordinates(&x_coord240, &y_coord128) == 0){


 if ((x_coord240 < 32) && (y_coord128 < 8)) {

  T6963C_fill(0, 0, (T6963C_grMemSize + T6963C_txtMemSize) ) ;


 T6963C_box(0,0,42,7, 0b1000 );
 T6963C_write_text(clear_msg,0,0,0);
 T6963C_box(200,0,240,7, 0b1000 );
 if (write_erase)
 T6963C_write_text(erase_msg,25,0,0);
 else
 T6963C_write_text(write_msg,25,0,0);

 T6963C_box(57,0,65,7, 0b1000 );
 T6963C_write_char('R',7,0,0);
 T6963C_box(73,0,81,7, 0b1000 );
 T6963C_write_char('G',9,0,0);
 T6963C_box(89,0,97,7, 0b1000 );
 T6963C_write_char('B',11,0,0);
 T6963C_box(105,0,145,7, 0b1000 );
 T6963C_write_text("Light",13,0,0);
 }


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


 if ((x_coord240 >= 57) && (x_coord240 <= 65) && (y_coord128 <= 7)) {
 PORTC.F2 = !PORTC.F2;
 Delay_ms(100);
 }


 if ((x_coord240 >= 73) && (x_coord240 <= 81) && (y_coord128 <= 7)) {
 PORTC.F1 = !PORTC.F1;
 Delay_ms(100);
 }


 if ((x_coord240 >= 89) && (x_coord240 <= 97) && (y_coord128 <= 7)) {
 PORTG.F0 = !PORTG.F0;
 Delay_ms(100);
 }

 if ((x_coord240 >= 105) && (x_coord240 <= 146) && (y_coord128 <= 7)) {
 PORTC.F2 = !PORTC.F2;
 PORTC.F1 = !PORTC.F1;
 PORTG.F0 = !PORTG.F0;
 Delay_ms(100);
 }


 if (y_coord128 > 8)
 {
 if (write_erase) T6963C_dot(x_coord240, y_coord128,  0b1000 );
 else T6963C_dot(x_coord240, y_coord128,  0 );
 }
 }
 }
 }
}
