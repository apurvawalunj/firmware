#line 1 "C:/Users/BILLGA~1/school/EE5100~1/TOUCHS~1/SMARTG~1/SMARTG~1/EXAMPL~1.51/SMARTG~2/SMARTG~1/SMARTG~1/SmartGLCD_240x128_Demo_driver.c"
#line 1 "c:/users/billga~1/school/ee5100~1/touchs~1/smartg~1/smartg~1/exampl~1.51/smartg~2/smartg~1/smartg~1/smartglcd_240x128_demo_objects.h"
#line 1 "c:/users/billga~1/school/ee5100~1/touchs~1/smartg~1/smartg~1/exampl~1.51/smartg~2/smartg~1/smartg~1/__t6963c.h"
#line 165 "c:/users/billga~1/school/ee5100~1/touchs~1/smartg~1/smartg~1/exampl~1.51/smartg~2/smartg~1/smartg~1/__t6963c.h"
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
#line 194 "c:/users/billga~1/school/ee5100~1/touchs~1/smartg~1/smartg~1/exampl~1.51/smartg~2/smartg~1/smartg~1/__t6963c.h"
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
#line 2 "c:/users/billga~1/school/ee5100~1/touchs~1/smartg~1/smartg~1/exampl~1.51/smartg~2/smartg~1/smartg~1/smartglcd_240x128_demo_objects.h"
enum GlcdColor {_clClear, _clDraw, _clInvert};

typedef struct Screen TScreen;

typedef struct Label {
 TScreen *OwnerScreen;
 char Left;
 char Top;
 char Width;
 char Height;
 char *Caption;
 const char *FontName;
 char FontWidth;
 char FontHeight;
 char FontOffset;
 char FontColor;
 char Visible;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen *OwnerScreen;
 char Left;
 char Top;
 char Width;
 char Height;
 char PictureWidth;
 char PictureHeight;
 const char *PictureName;
 char Visible;
 char AutoSize;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct CaptionButton {
 TScreen *OwnerScreen;
 char Left;
 char Top;
 char Width;
 char Height;
 char BorderWidth;
 char *Caption;
 const char *FontName;
 char FontWidth;
 char FontHeight;
 char FontOffset;
 char FontColor;
 char Visible;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCaptionButton;

typedef struct CaptionButton_Round {
 TScreen *OwnerScreen;
 char Left;
 char Top;
 char Width;
 char Height;
 char BorderWidth;
 char Round_Radius;
 char *Caption;
 const char *FontName;
 char FontWidth;
 char FontHeight;
 char FontOffset;
 char FontColor;
 char Visible;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCaptionButton_Round;

typedef struct Rectangle {
 TScreen *OwnerScreen;
 char Left;
 char Top;
 char Width;
 char Height;
 char Visible;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TRectangle;

struct Screen {
 unsigned int LabelsCount;
 TLabel **Labels;
 unsigned int ImagesCount;
 TImage **Images;
 unsigned int CaptionButtonsCount;
 TCaptionButton **CaptionButtons;
 unsigned int CaptionButtons_RoundCount;
 TCaptionButton_Round **CaptionButtons_Round;
 unsigned int RectanglesCount;
 TRectangle **Rectangles;
};

extern TScreen Screen1;
extern TLabel Label1;
extern TLabel Label2;
extern TCaptionButton_Round RoundCaptionButton1;
extern TCaptionButton_Round RoundCaptionButton2;
extern TImage Image2;
extern TCaptionButton_Round RoundCaptionButton14;

extern TScreen Screen2;
extern TCaptionButton_Round RoundCaptionButton3;
extern TLabel Label8;
extern TLabel Label9;
extern TLabel Label10;
extern TLabel Label11;
extern TLabel Label12;
extern TLabel Label13;
extern TLabel Label14;
extern TLabel Label15;

extern TScreen Screen3;
extern TCaptionButton_Round RoundCaptionButton4;
extern TCaptionButton CaptionButton1;
extern TCaptionButton CaptionButton2;
extern TCaptionButton CaptionButton3;
extern TCaptionButton CaptionButton4;
extern TCaptionButton CaptionButton5;
extern TCaptionButton CaptionButton6;
extern TCaptionButton CaptionButton7;
extern TCaptionButton CaptionButton8;
extern TCaptionButton CaptionButton9;
extern TCaptionButton CaptionButton10;
extern TCaptionButton CaptionButton11;
extern TCaptionButton CaptionButton12;
extern TCaptionButton CaptionButton13;
extern TCaptionButton CaptionButton14;
extern TCaptionButton CaptionButton15;
extern TCaptionButton CaptionButton16;
extern TCaptionButton CaptionButton17;
extern TCaptionButton CaptionButton18;
extern TCaptionButton CaptionButton19;
extern TCaptionButton CaptionButton20;
extern TCaptionButton CaptionButton21;
extern TCaptionButton CaptionButton22;
extern TCaptionButton CaptionButton23;
extern TCaptionButton CaptionButton24;
extern TCaptionButton CaptionButton25;
extern TCaptionButton CaptionButton26;
extern TImage Image1;
extern TCaptionButton CaptionButton27;
extern TLabel Label7;
extern TRectangle Rectangle2;
extern TCaptionButton_Round RoundCaptionButton13;

extern TScreen Screen4;
extern TCaptionButton_Round RoundCaptionButton5;
extern TLabel Label16;
extern TLabel Label17;
extern TLabel Label18;
extern TLabel Label19;
extern TLabel Label20;
extern TLabel Label21;
extern TLabel Label22;

extern TScreen Screen5;
extern TCaptionButton_Round RoundCaptionButton6;
extern TCaptionButton_Round RoundCaptionButton7;
extern TCaptionButton_Round RoundCaptionButton8;
extern TCaptionButton_Round RoundCaptionButton9;
extern TLabel Label3;
extern TLabel Label4;
extern TLabel Label5;
extern TCaptionButton_Round RoundCaptionButton11;
extern TCaptionButton_Round RoundCaptionButton12;
extern TCaptionButton_Round RoundCaptionButton10;

extern TScreen Screen6;
extern TCaptionButton CaptionButton28;




void RoundCaptionButton1Click();
void RoundCaptionButton2Click();
void RoundCaptionButton3Click();
void RoundCaptionButton4Click();
void RoundCaptionButton14Click();
void CaptionButton1Click();
void CaptionButton2Click();
void CaptionButton3Click();
void CaptionButton4Click();
void CaptionButton5Click();
void CaptionButton6Click();
void CaptionButton7Click();
void CaptionButton8Click();
void CaptionButton9Click();
void CaptionButton10Click();
void CaptionButton11Click();
void CaptionButton12Click();
void CaptionButton13Click();
void CaptionButton14Click();
void CaptionButton15Click();
void CaptionButton16Click();
void CaptionButton17Click();
void CaptionButton18Click();
void CaptionButton19Click();
void CaptionButton20Click();
void CaptionButton21Click();
void CaptionButton22Click();
void CaptionButton23Click();
void CaptionButton24Click();
void CaptionButton25Click();
void CaptionButton26Click();
void Image1Click();
void CaptionButton27Click();
void RoundCaptionButton13Click();
void RoundCaptionButton5Click();
void RoundCaptionButton6Click();
void RoundCaptionButton7Click();
void RoundCaptionButton8Click();
void RoundCaptionButton9Click();
void RoundCaptionButton11Click();
void RoundCaptionButton12Click();
void RoundCaptionButton10Click();
void CaptionButton28Click();




extern char Label1_Caption[];
extern char Label2_Caption[];
extern char RoundCaptionButton1_Caption[];
extern char RoundCaptionButton2_Caption[];
extern char RoundCaptionButton14_Caption[];
extern char RoundCaptionButton3_Caption[];
extern char Label8_Caption[];
extern char Label9_Caption[];
extern char Label10_Caption[];
extern char Label11_Caption[];
extern char Label12_Caption[];
extern char Label13_Caption[];
extern char Label14_Caption[];
extern char Label15_Caption[];
extern char RoundCaptionButton4_Caption[];
extern char CaptionButton1_Caption[];
extern char CaptionButton2_Caption[];
extern char CaptionButton3_Caption[];
extern char CaptionButton4_Caption[];
extern char CaptionButton5_Caption[];
extern char CaptionButton6_Caption[];
extern char CaptionButton7_Caption[];
extern char CaptionButton8_Caption[];
extern char CaptionButton9_Caption[];
extern char CaptionButton10_Caption[];
extern char CaptionButton11_Caption[];
extern char CaptionButton12_Caption[];
extern char CaptionButton13_Caption[];
extern char CaptionButton14_Caption[];
extern char CaptionButton15_Caption[];
extern char CaptionButton16_Caption[];
extern char CaptionButton17_Caption[];
extern char CaptionButton18_Caption[];
extern char CaptionButton19_Caption[];
extern char CaptionButton20_Caption[];
extern char CaptionButton21_Caption[];
extern char CaptionButton22_Caption[];
extern char CaptionButton23_Caption[];
extern char CaptionButton24_Caption[];
extern char CaptionButton25_Caption[];
extern char CaptionButton26_Caption[];
extern char CaptionButton27_Caption[];
extern char Label7_Caption[];
extern char RoundCaptionButton13_Caption[];
extern char RoundCaptionButton5_Caption[];
extern char Label16_Caption[];
extern char Label17_Caption[];
extern char Label18_Caption[];
extern char Label19_Caption[];
extern char Label20_Caption[];
extern char Label21_Caption[];
extern char Label22_Caption[];
extern char RoundCaptionButton6_Caption[];
extern char RoundCaptionButton7_Caption[];
extern char RoundCaptionButton8_Caption[];
extern char RoundCaptionButton9_Caption[];
extern char Label3_Caption[];
extern char Label4_Caption[];
extern char Label5_Caption[];
extern char RoundCaptionButton11_Caption[];
extern char RoundCaptionButton12_Caption[];
extern char RoundCaptionButton10_Caption[];
extern char CaptionButton28_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *Alabel);
void DrawImage(TImage *Aimage);
void DrawCaptionButton(TCaptionButton *Acaption_button);
void DrawRoundCaptionButton(TCaptionButton_Round *Around_caption_button);
void DrawRectangle(TRectangle *Arectangle);
void Check_TP();
void Start_TP();
#line 5 "C:/Users/BILLGA~1/school/EE5100~1/TOUCHS~1/SMARTG~1/SMARTG~1/EXAMPL~1.51/SMARTG~2/SMARTG~1/SMARTG~1/SmartGLCD_240x128_Demo_driver.c"
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



unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
static void InitializeTouchPanel() {
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
 TP_Set_ADC_Threshold(900);

 PenDown = 0;
 PressedObject = 0;
}

void Calibrate() {

 T6963C_dot(0,127, 0b1000 );
 T6963C_write_text("TOUCH BOTTOM LEFT",3,12, 0b10000001 );
 TP_Calibrate_Bottom_Left();
 Delay_ms(1000);

 T6963C_dot(0,127, 0 );
 T6963C_dot(239,0, 0b1000 );
 T6963C_write_text("                 ",3,12, 0b10000001 );
 T6963C_write_text("TOUCH UPPER RIGHT",12,3, 0b10000001 );
 TP_Calibrate_Upper_Right();

 Delay_ms(1000);
}



const code char mikro_logo[378] = {
 63, 255, 255, 255, 255, 255, 240,
127, 255, 255, 255, 255, 255, 252,
224, 0, 0, 0, 0, 0, 12,
223, 255, 255, 255, 255, 255, 246,
223, 255, 255, 255, 255, 255, 246,
223, 1, 255, 240, 7, 255, 246,
220, 0, 127, 128, 0, 255, 246,
220, 0, 62, 0, 0, 63, 246,
220, 255, 60, 0, 0, 15, 246,
221, 255, 48, 0, 0, 7, 246,
220, 0, 112, 0, 0, 7, 246,
220, 0, 96, 0, 0, 3, 246,
222, 0, 224, 1, 192, 1, 246,
223, 255, 192, 1, 224, 1, 246,
223, 255, 192, 3, 224, 1, 246,
220, 127, 192, 3, 224, 0, 246,
220, 63, 192, 3, 224, 0, 246,
220, 1, 192, 3, 224, 0, 246,
220, 1, 192, 3, 224, 0, 246,
220, 1, 192, 3, 224, 0, 246,
223, 255, 192, 1, 224, 0, 246,
221, 253, 192, 0, 0, 0, 246,
220, 49, 192, 0, 0, 0, 246,
220, 33, 192, 0, 0, 0, 246,
223, 3, 192, 0, 0, 0, 246,
221, 1, 192, 0, 0, 0, 246,
220, 1, 192, 0, 0, 0, 246,
220, 1, 192, 1, 255, 255, 246,
221, 255, 192, 3, 255, 255, 246,
223, 255, 192, 3, 255, 255, 246,
221, 129, 192, 3, 240, 0, 246,
221, 129, 192, 3, 240, 0, 246,
221, 1, 192, 3, 240, 0, 246,
223, 255, 192, 3, 240, 0, 246,
223, 255, 192, 3, 240, 0, 246,
220, 1, 192, 3, 240, 0, 246,
220, 1, 192, 3, 240, 0, 246,
220, 0, 192, 3, 240, 0, 246,
221, 255, 192, 3, 240, 0, 246,
223, 255, 192, 1, 224, 1, 246,
220, 0, 224, 1, 224, 1, 246,
220, 0, 96, 0, 128, 1, 246,
220, 0, 112, 0, 0, 3, 246,
221, 255, 240, 0, 0, 7, 246,
221, 255, 248, 0, 0, 15, 246,
220, 0, 28, 0, 0, 31, 246,
220, 0, 15, 0, 0, 63, 246,
220, 0, 7, 192, 0, 255, 246,
223, 255, 255, 255, 255, 255, 246,
223, 255, 255, 255, 255, 255, 246,
223, 255, 255, 255, 255, 255, 238,
 96, 0, 0, 0, 0, 0, 12,
127, 255, 255, 255, 255, 255, 248,
 31, 255, 255, 255, 255, 255, 240
};

const code char backspace[126] = {
255, 225, 255, 255, 255, 255, 192,
255, 193, 255, 255, 255, 255, 192,
255, 129, 255, 255, 255, 255, 192,
255, 3, 255, 255, 255, 255, 192,
254, 7, 255, 255, 255, 255, 192,
252, 15, 255, 255, 255, 255, 192,
252, 0, 0, 0, 0, 255, 192,
248, 0, 0, 0, 0, 255, 192,
248, 0, 0, 0, 0, 255, 192,
252, 0, 0, 0, 0, 255, 192,
252, 0, 0, 0, 0, 255, 192,
254, 15, 255, 255, 255, 255, 192,
255, 7, 255, 255, 255, 255, 192,
255, 3, 255, 255, 255, 255, 192,
255, 129, 255, 255, 255, 255, 192,
255, 193, 255, 255, 255, 255, 192,
255, 193, 255, 255, 255, 255, 192,
255, 227, 255, 255, 255, 255, 192
};



 TScreen *CurrentScreen;

 TScreen Screen1;
 TLabel Label1;
 char Label1_Caption[19] = "Smart GLCD 240x128";

 TLabel Label2;
 char Label2_Caption[20] = "by MikroElektronika";

 TCaptionButton_Round RoundCaptionButton1;
 char RoundCaptionButton1_Caption[17] = "  Keypad Demo   ";

 TCaptionButton_Round RoundCaptionButton2;
 char RoundCaptionButton2_Caption[17] = "Backlight Change";

 TImage Image2;
 TCaptionButton_Round RoundCaptionButton14;
 char RoundCaptionButton14_Caption[17] = "Backlight Colors";

 TLabel *Screen0_Labels[2];
 TImage *Screen0_Images[1];
 TCaptionButton_Round *Screen0_CaptionButtons_Round[3];

 TScreen Screen2;
 TCaptionButton_Round RoundCaptionButton3;
 char RoundCaptionButton3_Caption[5] = "Next";

 TLabel Label8;
 char Label8_Caption[27] = "Keypad Demo shows onscreen";

 TLabel Label9;
 char Label9_Caption[27] = "keyboard. Each key pressed";

 TLabel Label10;
 char Label10_Caption[28] = "is displayed in bottom bar.";

 TLabel Label11;
 char Label11_Caption[21] = "Space, Caps Lock and";

 TLabel Label12;
 char Label12_Caption[29] = "Backspace functions are also";

 TLabel Label13;
 char Label13_Caption[29] = "supported. To return to main";

 TLabel Label14;
 char Label14_Caption[19] = "screen press Back.";

 TLabel Label15;
 char Label15_Caption[6] = "INFO:";

 TLabel *Screen1_Labels[8];
 TCaptionButton_Round *Screen1_CaptionButtons_Round[1];

 TScreen Screen3;
 TCaptionButton_Round RoundCaptionButton4;
 char RoundCaptionButton4_Caption[5] = "Back";

 TCaptionButton CaptionButton1;
 char CaptionButton1_Caption[2] = "Q";

 TCaptionButton CaptionButton2;
 char CaptionButton2_Caption[2] = "W";

 TCaptionButton CaptionButton3;
 char CaptionButton3_Caption[2] = "E";

 TCaptionButton CaptionButton4;
 char CaptionButton4_Caption[2] = "R";

 TCaptionButton CaptionButton5;
 char CaptionButton5_Caption[2] = "T";

 TCaptionButton CaptionButton6;
 char CaptionButton6_Caption[2] = "Y";

 TCaptionButton CaptionButton7;
 char CaptionButton7_Caption[2] = "U";

 TCaptionButton CaptionButton8;
 char CaptionButton8_Caption[2] = "I";

 TCaptionButton CaptionButton9;
 char CaptionButton9_Caption[2] = "O";

 TCaptionButton CaptionButton10;
 char CaptionButton10_Caption[2] = "P";

 TCaptionButton CaptionButton11;
 char CaptionButton11_Caption[2] = "A";

 TCaptionButton CaptionButton12;
 char CaptionButton12_Caption[2] = "S";

 TCaptionButton CaptionButton13;
 char CaptionButton13_Caption[2] = "D";

 TCaptionButton CaptionButton14;
 char CaptionButton14_Caption[2] = "F";

 TCaptionButton CaptionButton15;
 char CaptionButton15_Caption[2] = "G";

 TCaptionButton CaptionButton16;
 char CaptionButton16_Caption[2] = "H";

 TCaptionButton CaptionButton17;
 char CaptionButton17_Caption[2] = "J";

 TCaptionButton CaptionButton18;
 char CaptionButton18_Caption[2] = "K";

 TCaptionButton CaptionButton19;
 char CaptionButton19_Caption[2] = "L";

 TCaptionButton CaptionButton20;
 char CaptionButton20_Caption[2] = "Z";

 TCaptionButton CaptionButton21;
 char CaptionButton21_Caption[2] = "X";

 TCaptionButton CaptionButton22;
 char CaptionButton22_Caption[2] = "C";

 TCaptionButton CaptionButton23;
 char CaptionButton23_Caption[2] = "V";

 TCaptionButton CaptionButton24;
 char CaptionButton24_Caption[2] = "B";

 TCaptionButton CaptionButton25;
 char CaptionButton25_Caption[2] = "N";

 TCaptionButton CaptionButton26;
 char CaptionButton26_Caption[2] = "M";

 TImage Image1;
 TCaptionButton CaptionButton27;
 char CaptionButton27_Caption[14] = "    Space    ";

 TLabel Label7;
 char Label7_Caption[21] = "";

 TRectangle Rectangle2;
 TCaptionButton_Round RoundCaptionButton13;
 char RoundCaptionButton13_Caption[10] = "CAPS: OFF";

 TLabel *Screen2_Labels[1];
 TImage *Screen2_Images[1];
 TCaptionButton *Screen2_CaptionButtons[27];
 TCaptionButton_Round *Screen2_CaptionButtons_Round[2];
 TRectangle *Screen2_Rectangles[1];

 TScreen Screen4;
 TCaptionButton_Round RoundCaptionButton5;
 char RoundCaptionButton5_Caption[5] = "Next";

 TLabel Label16;
 char Label16_Caption[6] = "INFO:";

 TLabel Label17;
 char Label17_Caption[24] = "Backlight Demo lets you";

 TLabel Label18;
 char Label18_Caption[27] = "change Red, Blue and Green";

 TLabel Label19;
 char Label19_Caption[25] = "components of backlight.";

 TLabel Label20;
 char Label20_Caption[24] = "Complete turn ON/OFF of";

 TLabel Label21;
 char Label21_Caption[29] = "as well as inverting of each";

 TLabel Label22;
 char Label22_Caption[27] = "RGB component individualy.";

 TLabel *Screen3_Labels[7];
 TCaptionButton_Round *Screen3_CaptionButtons_Round[1];

 TScreen Screen5;
 TCaptionButton_Round RoundCaptionButton6;
 char RoundCaptionButton6_Caption[5] = "Back";

 TCaptionButton_Round RoundCaptionButton7;
 char RoundCaptionButton7_Caption[6] = " RED ";

 TCaptionButton_Round RoundCaptionButton8;
 char RoundCaptionButton8_Caption[6] = "BLUE ";

 TCaptionButton_Round RoundCaptionButton9;
 char RoundCaptionButton9_Caption[6] = "GREEN";

 TLabel Label3;
 char Label3_Caption[4] = "ON";

 TLabel Label4;
 char Label4_Caption[4] = "ON";

 TLabel Label5;
 char Label5_Caption[4] = "ON";

 TCaptionButton_Round RoundCaptionButton11;
 char RoundCaptionButton11_Caption[14] = "Backlight ON ";

 TCaptionButton_Round RoundCaptionButton12;
 char RoundCaptionButton12_Caption[14] = " Invert RGB  ";

 TCaptionButton_Round RoundCaptionButton10;
 char RoundCaptionButton10_Caption[14] = "Backlight OFF";

 TLabel *Screen4_Labels[3];
 TCaptionButton_Round *Screen4_CaptionButtons_Round[7];

 TScreen Screen6;
 TCaptionButton CaptionButton28;
 char CaptionButton28_Caption[10] = "Main menu";

 TCaptionButton *Screen5_CaptionButtons[1];



static void InitializeObjects() {
 Screen1.LabelsCount = 2;
 Screen1.Labels = Screen0_Labels;
 Screen1.ImagesCount = 1;
 Screen1.Images = Screen0_Images;
 Screen1.CaptionButtonsCount = 0;
 Screen1.CaptionButtons_RoundCount = 3;
 Screen1.CaptionButtons_Round = Screen0_CaptionButtons_Round;
 Screen1.RectanglesCount = 0;
 Screen0_Labels[0] = &Label1;
 Screen0_Labels[1] = &Label2;
 Screen0_CaptionButtons_Round[0] = &RoundCaptionButton1;
 Screen0_CaptionButtons_Round[1] = &RoundCaptionButton2;
 Screen0_Images[0] = &Image2;
 Screen0_CaptionButtons_Round[2] = &RoundCaptionButton14;

 Screen2.LabelsCount = 8;
 Screen2.Labels = Screen1_Labels;
 Screen2.ImagesCount = 0;
 Screen2.CaptionButtonsCount = 0;
 Screen2.CaptionButtons_RoundCount = 1;
 Screen2.CaptionButtons_Round = Screen1_CaptionButtons_Round;
 Screen2.RectanglesCount = 0;
 Screen1_CaptionButtons_Round[0] = &RoundCaptionButton3;
 Screen1_Labels[0] = &Label8;
 Screen1_Labels[1] = &Label9;
 Screen1_Labels[2] = &Label10;
 Screen1_Labels[3] = &Label11;
 Screen1_Labels[4] = &Label12;
 Screen1_Labels[5] = &Label13;
 Screen1_Labels[6] = &Label14;
 Screen1_Labels[7] = &Label15;

 Screen3.LabelsCount = 1;
 Screen3.Labels = Screen2_Labels;
 Screen3.ImagesCount = 1;
 Screen3.Images = Screen2_Images;
 Screen3.CaptionButtonsCount = 27;
 Screen3.CaptionButtons = Screen2_CaptionButtons;
 Screen3.CaptionButtons_RoundCount = 2;
 Screen3.CaptionButtons_Round = Screen2_CaptionButtons_Round;
 Screen3.RectanglesCount = 1;
 Screen3.Rectangles = Screen2_Rectangles;
 Screen2_CaptionButtons_Round[0] = &RoundCaptionButton4;
 Screen2_CaptionButtons[0] = &CaptionButton1;
 Screen2_CaptionButtons[1] = &CaptionButton2;
 Screen2_CaptionButtons[2] = &CaptionButton3;
 Screen2_CaptionButtons[3] = &CaptionButton4;
 Screen2_CaptionButtons[4] = &CaptionButton5;
 Screen2_CaptionButtons[5] = &CaptionButton6;
 Screen2_CaptionButtons[6] = &CaptionButton7;
 Screen2_CaptionButtons[7] = &CaptionButton8;
 Screen2_CaptionButtons[8] = &CaptionButton9;
 Screen2_CaptionButtons[9] = &CaptionButton10;
 Screen2_CaptionButtons[10] = &CaptionButton11;
 Screen2_CaptionButtons[11] = &CaptionButton12;
 Screen2_CaptionButtons[12] = &CaptionButton13;
 Screen2_CaptionButtons[13] = &CaptionButton14;
 Screen2_CaptionButtons[14] = &CaptionButton15;
 Screen2_CaptionButtons[15] = &CaptionButton16;
 Screen2_CaptionButtons[16] = &CaptionButton17;
 Screen2_CaptionButtons[17] = &CaptionButton18;
 Screen2_CaptionButtons[18] = &CaptionButton19;
 Screen2_CaptionButtons[19] = &CaptionButton20;
 Screen2_CaptionButtons[20] = &CaptionButton21;
 Screen2_CaptionButtons[21] = &CaptionButton22;
 Screen2_CaptionButtons[22] = &CaptionButton23;
 Screen2_CaptionButtons[23] = &CaptionButton24;
 Screen2_CaptionButtons[24] = &CaptionButton25;
 Screen2_CaptionButtons[25] = &CaptionButton26;
 Screen2_Images[0] = &Image1;
 Screen2_CaptionButtons[26] = &CaptionButton27;
 Screen2_Labels[0] = &Label7;
 Screen2_Rectangles[0] = &Rectangle2;
 Screen2_CaptionButtons_Round[1] = &RoundCaptionButton13;

 Screen4.LabelsCount = 7;
 Screen4.Labels = Screen3_Labels;
 Screen4.ImagesCount = 0;
 Screen4.CaptionButtonsCount = 0;
 Screen4.CaptionButtons_RoundCount = 1;
 Screen4.CaptionButtons_Round = Screen3_CaptionButtons_Round;
 Screen4.RectanglesCount = 0;
 Screen3_CaptionButtons_Round[0] = &RoundCaptionButton5;
 Screen3_Labels[0] = &Label16;
 Screen3_Labels[1] = &Label17;
 Screen3_Labels[2] = &Label18;
 Screen3_Labels[3] = &Label19;
 Screen3_Labels[4] = &Label20;
 Screen3_Labels[5] = &Label21;
 Screen3_Labels[6] = &Label22;

 Screen5.LabelsCount = 3;
 Screen5.Labels = Screen4_Labels;
 Screen5.ImagesCount = 0;
 Screen5.CaptionButtonsCount = 0;
 Screen5.CaptionButtons_RoundCount = 7;
 Screen5.CaptionButtons_Round = Screen4_CaptionButtons_Round;
 Screen5.RectanglesCount = 0;
 Screen4_CaptionButtons_Round[0] = &RoundCaptionButton6;
 Screen4_CaptionButtons_Round[1] = &RoundCaptionButton7;
 Screen4_CaptionButtons_Round[2] = &RoundCaptionButton8;
 Screen4_CaptionButtons_Round[3] = &RoundCaptionButton9;
 Screen4_Labels[0] = &Label3;
 Screen4_Labels[1] = &Label4;
 Screen4_Labels[2] = &Label5;
 Screen4_CaptionButtons_Round[4] = &RoundCaptionButton11;
 Screen4_CaptionButtons_Round[5] = &RoundCaptionButton12;
 Screen4_CaptionButtons_Round[6] = &RoundCaptionButton10;

 Screen6.LabelsCount = 0;
 Screen6.ImagesCount = 0;
 Screen6.CaptionButtonsCount = 1;
 Screen6.CaptionButtons = Screen5_CaptionButtons;
 Screen6.CaptionButtons_RoundCount = 0;
 Screen6.RectanglesCount = 0;
 Screen5_CaptionButtons[0] = &CaptionButton28;


 Label1.OwnerScreen = &Screen1;
 Label1.Left = 0;
 Label1.Top = 24;
 Label1.Width = 144;
 Label1.Height = 8;
 Label1.Caption = Label1_Caption;
 Label1.FontName = 0;
 Label1.FontWidth = 7;
 Label1.FontHeight = 7;
 Label1.FontOffset = 32;
 Label1.FontColor = _clInvert;
 Label1.Visible = 1;
 Label1.OnUpPtr = 0;
 Label1.OnDownPtr = 0;
 Label1.OnClickPtr = 0;
 Label1.OnPressPtr = 0;

 Label2.OwnerScreen = &Screen1;
 Label2.Left = 0;
 Label2.Top = 40;
 Label2.Width = 152;
 Label2.Height = 8;
 Label2.Caption = Label2_Caption;
 Label2.FontName = 0;
 Label2.FontWidth = 7;
 Label2.FontHeight = 7;
 Label2.FontOffset = 32;
 Label2.FontColor = _clInvert;
 Label2.Visible = 1;
 Label2.OnUpPtr = 0;
 Label2.OnDownPtr = 0;
 Label2.OnClickPtr = 0;
 Label2.OnPressPtr = 0;

 RoundCaptionButton1.OwnerScreen = &Screen1;
 RoundCaptionButton1.Left = 3;
 RoundCaptionButton1.Top = 59;
 RoundCaptionButton1.Width = 138;
 RoundCaptionButton1.Height = 18;
 RoundCaptionButton1.BorderWidth = 3;
 RoundCaptionButton1.Round_Radius = 4;
 RoundCaptionButton1.Caption = RoundCaptionButton1_Caption;
 RoundCaptionButton1.FontName = 0;
 RoundCaptionButton1.FontWidth = 7;
 RoundCaptionButton1.FontHeight = 7;
 RoundCaptionButton1.FontOffset = 32;
 RoundCaptionButton1.FontColor = _clInvert;
 RoundCaptionButton1.Visible = 1;
 RoundCaptionButton1.OnUpPtr = 0;
 RoundCaptionButton1.OnDownPtr = 0;
 RoundCaptionButton1.OnClickPtr = RoundCaptionButton1Click;
 RoundCaptionButton1.OnPressPtr = 0;

 RoundCaptionButton2.OwnerScreen = &Screen1;
 RoundCaptionButton2.Left = 3;
 RoundCaptionButton2.Top = 83;
 RoundCaptionButton2.Width = 138;
 RoundCaptionButton2.Height = 18;
 RoundCaptionButton2.BorderWidth = 3;
 RoundCaptionButton2.Round_Radius = 4;
 RoundCaptionButton2.Caption = RoundCaptionButton2_Caption;
 RoundCaptionButton2.FontName = 0;
 RoundCaptionButton2.FontWidth = 7;
 RoundCaptionButton2.FontHeight = 7;
 RoundCaptionButton2.FontOffset = 32;
 RoundCaptionButton2.FontColor = _clInvert;
 RoundCaptionButton2.Visible = 1;
 RoundCaptionButton2.OnUpPtr = 0;
 RoundCaptionButton2.OnDownPtr = 0;
 RoundCaptionButton2.OnClickPtr = RoundCaptionButton2Click;
 RoundCaptionButton2.OnPressPtr = 0;

 Image2.OwnerScreen = &Screen1;
 Image2.Left = 177;
 Image2.Top = 6;
 Image2.Width = 55;
 Image2.Height = 54;
 Image2.PictureWidth = 55;
 Image2.PictureHeight = 54;
 Image2.PictureName = mikro_logo;
 Image2.Visible = 1;
 Image2.AutoSize = 0;
 Image2.OnUpPtr = 0;
 Image2.OnDownPtr = 0;
 Image2.OnClickPtr = 0;
 Image2.OnPressPtr = 0;

 RoundCaptionButton14.OwnerScreen = &Screen1;
 RoundCaptionButton14.Left = 3;
 RoundCaptionButton14.Top = 107;
 RoundCaptionButton14.Width = 138;
 RoundCaptionButton14.Height = 18;
 RoundCaptionButton14.BorderWidth = 3;
 RoundCaptionButton14.Round_Radius = 4;
 RoundCaptionButton14.Caption = RoundCaptionButton14_Caption;
 RoundCaptionButton14.FontName = 0;
 RoundCaptionButton14.FontWidth = 7;
 RoundCaptionButton14.FontHeight = 7;
 RoundCaptionButton14.FontOffset = 32;
 RoundCaptionButton14.FontColor = _clInvert;
 RoundCaptionButton14.Visible = 1;
 RoundCaptionButton14.OnUpPtr = 0;
 RoundCaptionButton14.OnDownPtr = 0;
 RoundCaptionButton14.OnClickPtr = RoundCaptionButton14Click;
 RoundCaptionButton14.OnPressPtr = 0;

 RoundCaptionButton3.OwnerScreen = &Screen2;
 RoundCaptionButton3.Left = 187;
 RoundCaptionButton3.Top = 99;
 RoundCaptionButton3.Width = 42;
 RoundCaptionButton3.Height = 18;
 RoundCaptionButton3.BorderWidth = 3;
 RoundCaptionButton3.Round_Radius = 4;
 RoundCaptionButton3.Caption = RoundCaptionButton3_Caption;
 RoundCaptionButton3.FontName = 0;
 RoundCaptionButton3.FontWidth = 7;
 RoundCaptionButton3.FontHeight = 7;
 RoundCaptionButton3.FontOffset = 32;
 RoundCaptionButton3.FontColor = _clInvert;
 RoundCaptionButton3.Visible = 1;
 RoundCaptionButton3.OnUpPtr = 0;
 RoundCaptionButton3.OnDownPtr = 0;
 RoundCaptionButton3.OnClickPtr = RoundCaptionButton3Click;
 RoundCaptionButton3.OnPressPtr = 0;

 Label8.OwnerScreen = &Screen2;
 Label8.Left = 8;
 Label8.Top = 24;
 Label8.Width = 208;
 Label8.Height = 8;
 Label8.Caption = Label8_Caption;
 Label8.FontName = 0;
 Label8.FontWidth = 7;
 Label8.FontHeight = 7;
 Label8.FontOffset = 32;
 Label8.FontColor = _clInvert;
 Label8.Visible = 1;
 Label8.OnUpPtr = 0;
 Label8.OnDownPtr = 0;
 Label8.OnClickPtr = 0;
 Label8.OnPressPtr = 0;

 Label9.OwnerScreen = &Screen2;
 Label9.Left = 8;
 Label9.Top = 32;
 Label9.Width = 208;
 Label9.Height = 8;
 Label9.Caption = Label9_Caption;
 Label9.FontName = 0;
 Label9.FontWidth = 7;
 Label9.FontHeight = 7;
 Label9.FontOffset = 32;
 Label9.FontColor = _clInvert;
 Label9.Visible = 1;
 Label9.OnUpPtr = 0;
 Label9.OnDownPtr = 0;
 Label9.OnClickPtr = 0;
 Label9.OnPressPtr = 0;

 Label10.OwnerScreen = &Screen2;
 Label10.Left = 8;
 Label10.Top = 40;
 Label10.Width = 216;
 Label10.Height = 8;
 Label10.Caption = Label10_Caption;
 Label10.FontName = 0;
 Label10.FontWidth = 7;
 Label10.FontHeight = 7;
 Label10.FontOffset = 32;
 Label10.FontColor = _clInvert;
 Label10.Visible = 1;
 Label10.OnUpPtr = 0;
 Label10.OnDownPtr = 0;
 Label10.OnClickPtr = 0;
 Label10.OnPressPtr = 0;

 Label11.OwnerScreen = &Screen2;
 Label11.Left = 8;
 Label11.Top = 48;
 Label11.Width = 160;
 Label11.Height = 8;
 Label11.Caption = Label11_Caption;
 Label11.FontName = 0;
 Label11.FontWidth = 7;
 Label11.FontHeight = 7;
 Label11.FontOffset = 32;
 Label11.FontColor = _clInvert;
 Label11.Visible = 1;
 Label11.OnUpPtr = 0;
 Label11.OnDownPtr = 0;
 Label11.OnClickPtr = 0;
 Label11.OnPressPtr = 0;

 Label12.OwnerScreen = &Screen2;
 Label12.Left = 8;
 Label12.Top = 56;
 Label12.Width = 224;
 Label12.Height = 8;
 Label12.Caption = Label12_Caption;
 Label12.FontName = 0;
 Label12.FontWidth = 7;
 Label12.FontHeight = 7;
 Label12.FontOffset = 32;
 Label12.FontColor = _clInvert;
 Label12.Visible = 1;
 Label12.OnUpPtr = 0;
 Label12.OnDownPtr = 0;
 Label12.OnClickPtr = 0;
 Label12.OnPressPtr = 0;

 Label13.OwnerScreen = &Screen2;
 Label13.Left = 8;
 Label13.Top = 64;
 Label13.Width = 224;
 Label13.Height = 8;
 Label13.Caption = Label13_Caption;
 Label13.FontName = 0;
 Label13.FontWidth = 7;
 Label13.FontHeight = 7;
 Label13.FontOffset = 32;
 Label13.FontColor = _clInvert;
 Label13.Visible = 1;
 Label13.OnUpPtr = 0;
 Label13.OnDownPtr = 0;
 Label13.OnClickPtr = 0;
 Label13.OnPressPtr = 0;

 Label14.OwnerScreen = &Screen2;
 Label14.Left = 8;
 Label14.Top = 72;
 Label14.Width = 144;
 Label14.Height = 8;
 Label14.Caption = Label14_Caption;
 Label14.FontName = 0;
 Label14.FontWidth = 7;
 Label14.FontHeight = 7;
 Label14.FontOffset = 32;
 Label14.FontColor = _clInvert;
 Label14.Visible = 1;
 Label14.OnUpPtr = 0;
 Label14.OnDownPtr = 0;
 Label14.OnClickPtr = 0;
 Label14.OnPressPtr = 0;

 Label15.OwnerScreen = &Screen2;
 Label15.Left = 88;
 Label15.Top = 8;
 Label15.Width = 40;
 Label15.Height = 8;
 Label15.Caption = Label15_Caption;
 Label15.FontName = 0;
 Label15.FontWidth = 7;
 Label15.FontHeight = 7;
 Label15.FontOffset = 32;
 Label15.FontColor = _clInvert;
 Label15.Visible = 1;
 Label15.OnUpPtr = 0;
 Label15.OnDownPtr = 0;
 Label15.OnClickPtr = 0;
 Label15.OnPressPtr = 0;

 RoundCaptionButton4.OwnerScreen = &Screen3;
 RoundCaptionButton4.Left = 187;
 RoundCaptionButton4.Top = 99;
 RoundCaptionButton4.Width = 42;
 RoundCaptionButton4.Height = 18;
 RoundCaptionButton4.BorderWidth = 3;
 RoundCaptionButton4.Round_Radius = 4;
 RoundCaptionButton4.Caption = RoundCaptionButton4_Caption;
 RoundCaptionButton4.FontName = 0;
 RoundCaptionButton4.FontWidth = 7;
 RoundCaptionButton4.FontHeight = 7;
 RoundCaptionButton4.FontOffset = 32;
 RoundCaptionButton4.FontColor = _clInvert;
 RoundCaptionButton4.Visible = 1;
 RoundCaptionButton4.OnUpPtr = 0;
 RoundCaptionButton4.OnDownPtr = 0;
 RoundCaptionButton4.OnClickPtr = RoundCaptionButton4Click;
 RoundCaptionButton4.OnPressPtr = 0;

 CaptionButton1.OwnerScreen = &Screen3;
 CaptionButton1.Left = 3;
 CaptionButton1.Top = 3;
 CaptionButton1.Width = 18;
 CaptionButton1.Height = 18;
 CaptionButton1.BorderWidth = 3;
 CaptionButton1.Caption = CaptionButton1_Caption;
 CaptionButton1.FontName = 0;
 CaptionButton1.FontWidth = 7;
 CaptionButton1.FontHeight = 7;
 CaptionButton1.FontOffset = 32;
 CaptionButton1.FontColor = _clInvert;
 CaptionButton1.Visible = 1;
 CaptionButton1.OnUpPtr = 0;
 CaptionButton1.OnDownPtr = 0;
 CaptionButton1.OnClickPtr = CaptionButton1Click;
 CaptionButton1.OnPressPtr = 0;

 CaptionButton2.OwnerScreen = &Screen3;
 CaptionButton2.Left = 27;
 CaptionButton2.Top = 3;
 CaptionButton2.Width = 18;
 CaptionButton2.Height = 18;
 CaptionButton2.BorderWidth = 3;
 CaptionButton2.Caption = CaptionButton2_Caption;
 CaptionButton2.FontName = 0;
 CaptionButton2.FontWidth = 7;
 CaptionButton2.FontHeight = 7;
 CaptionButton2.FontOffset = 32;
 CaptionButton2.FontColor = _clInvert;
 CaptionButton2.Visible = 1;
 CaptionButton2.OnUpPtr = 0;
 CaptionButton2.OnDownPtr = 0;
 CaptionButton2.OnClickPtr = CaptionButton2Click;
 CaptionButton2.OnPressPtr = 0;

 CaptionButton3.OwnerScreen = &Screen3;
 CaptionButton3.Left = 51;
 CaptionButton3.Top = 3;
 CaptionButton3.Width = 18;
 CaptionButton3.Height = 18;
 CaptionButton3.BorderWidth = 3;
 CaptionButton3.Caption = CaptionButton3_Caption;
 CaptionButton3.FontName = 0;
 CaptionButton3.FontWidth = 7;
 CaptionButton3.FontHeight = 7;
 CaptionButton3.FontOffset = 32;
 CaptionButton3.FontColor = _clInvert;
 CaptionButton3.Visible = 1;
 CaptionButton3.OnUpPtr = 0;
 CaptionButton3.OnDownPtr = 0;
 CaptionButton3.OnClickPtr = CaptionButton3Click;
 CaptionButton3.OnPressPtr = 0;

 CaptionButton4.OwnerScreen = &Screen3;
 CaptionButton4.Left = 75;
 CaptionButton4.Top = 3;
 CaptionButton4.Width = 18;
 CaptionButton4.Height = 18;
 CaptionButton4.BorderWidth = 3;
 CaptionButton4.Caption = CaptionButton4_Caption;
 CaptionButton4.FontName = 0;
 CaptionButton4.FontWidth = 7;
 CaptionButton4.FontHeight = 7;
 CaptionButton4.FontOffset = 32;
 CaptionButton4.FontColor = _clInvert;
 CaptionButton4.Visible = 1;
 CaptionButton4.OnUpPtr = 0;
 CaptionButton4.OnDownPtr = 0;
 CaptionButton4.OnClickPtr = CaptionButton4Click;
 CaptionButton4.OnPressPtr = 0;

 CaptionButton5.OwnerScreen = &Screen3;
 CaptionButton5.Left = 99;
 CaptionButton5.Top = 3;
 CaptionButton5.Width = 18;
 CaptionButton5.Height = 18;
 CaptionButton5.BorderWidth = 3;
 CaptionButton5.Caption = CaptionButton5_Caption;
 CaptionButton5.FontName = 0;
 CaptionButton5.FontWidth = 7;
 CaptionButton5.FontHeight = 7;
 CaptionButton5.FontOffset = 32;
 CaptionButton5.FontColor = _clInvert;
 CaptionButton5.Visible = 1;
 CaptionButton5.OnUpPtr = 0;
 CaptionButton5.OnDownPtr = 0;
 CaptionButton5.OnClickPtr = CaptionButton5Click;
 CaptionButton5.OnPressPtr = 0;

 CaptionButton6.OwnerScreen = &Screen3;
 CaptionButton6.Left = 123;
 CaptionButton6.Top = 3;
 CaptionButton6.Width = 18;
 CaptionButton6.Height = 18;
 CaptionButton6.BorderWidth = 3;
 CaptionButton6.Caption = CaptionButton6_Caption;
 CaptionButton6.FontName = 0;
 CaptionButton6.FontWidth = 7;
 CaptionButton6.FontHeight = 7;
 CaptionButton6.FontOffset = 32;
 CaptionButton6.FontColor = _clInvert;
 CaptionButton6.Visible = 1;
 CaptionButton6.OnUpPtr = 0;
 CaptionButton6.OnDownPtr = 0;
 CaptionButton6.OnClickPtr = CaptionButton6Click;
 CaptionButton6.OnPressPtr = 0;

 CaptionButton7.OwnerScreen = &Screen3;
 CaptionButton7.Left = 147;
 CaptionButton7.Top = 3;
 CaptionButton7.Width = 18;
 CaptionButton7.Height = 18;
 CaptionButton7.BorderWidth = 3;
 CaptionButton7.Caption = CaptionButton7_Caption;
 CaptionButton7.FontName = 0;
 CaptionButton7.FontWidth = 7;
 CaptionButton7.FontHeight = 7;
 CaptionButton7.FontOffset = 32;
 CaptionButton7.FontColor = _clInvert;
 CaptionButton7.Visible = 1;
 CaptionButton7.OnUpPtr = 0;
 CaptionButton7.OnDownPtr = 0;
 CaptionButton7.OnClickPtr = CaptionButton7Click;
 CaptionButton7.OnPressPtr = 0;

 CaptionButton8.OwnerScreen = &Screen3;
 CaptionButton8.Left = 171;
 CaptionButton8.Top = 3;
 CaptionButton8.Width = 18;
 CaptionButton8.Height = 18;
 CaptionButton8.BorderWidth = 3;
 CaptionButton8.Caption = CaptionButton8_Caption;
 CaptionButton8.FontName = 0;
 CaptionButton8.FontWidth = 7;
 CaptionButton8.FontHeight = 7;
 CaptionButton8.FontOffset = 32;
 CaptionButton8.FontColor = _clInvert;
 CaptionButton8.Visible = 1;
 CaptionButton8.OnUpPtr = 0;
 CaptionButton8.OnDownPtr = 0;
 CaptionButton8.OnClickPtr = CaptionButton8Click;
 CaptionButton8.OnPressPtr = 0;

 CaptionButton9.OwnerScreen = &Screen3;
 CaptionButton9.Left = 195;
 CaptionButton9.Top = 3;
 CaptionButton9.Width = 18;
 CaptionButton9.Height = 18;
 CaptionButton9.BorderWidth = 3;
 CaptionButton9.Caption = CaptionButton9_Caption;
 CaptionButton9.FontName = 0;
 CaptionButton9.FontWidth = 7;
 CaptionButton9.FontHeight = 7;
 CaptionButton9.FontOffset = 32;
 CaptionButton9.FontColor = _clInvert;
 CaptionButton9.Visible = 1;
 CaptionButton9.OnUpPtr = 0;
 CaptionButton9.OnDownPtr = 0;
 CaptionButton9.OnClickPtr = CaptionButton9Click;
 CaptionButton9.OnPressPtr = 0;

 CaptionButton10.OwnerScreen = &Screen3;
 CaptionButton10.Left = 219;
 CaptionButton10.Top = 3;
 CaptionButton10.Width = 18;
 CaptionButton10.Height = 18;
 CaptionButton10.BorderWidth = 3;
 CaptionButton10.Caption = CaptionButton10_Caption;
 CaptionButton10.FontName = 0;
 CaptionButton10.FontWidth = 7;
 CaptionButton10.FontHeight = 7;
 CaptionButton10.FontOffset = 32;
 CaptionButton10.FontColor = _clInvert;
 CaptionButton10.Visible = 1;
 CaptionButton10.OnUpPtr = 0;
 CaptionButton10.OnDownPtr = 0;
 CaptionButton10.OnClickPtr = CaptionButton10Click;
 CaptionButton10.OnPressPtr = 0;

 CaptionButton11.OwnerScreen = &Screen3;
 CaptionButton11.Left = 11;
 CaptionButton11.Top = 27;
 CaptionButton11.Width = 18;
 CaptionButton11.Height = 18;
 CaptionButton11.BorderWidth = 3;
 CaptionButton11.Caption = CaptionButton11_Caption;
 CaptionButton11.FontName = 0;
 CaptionButton11.FontWidth = 7;
 CaptionButton11.FontHeight = 7;
 CaptionButton11.FontOffset = 32;
 CaptionButton11.FontColor = _clInvert;
 CaptionButton11.Visible = 1;
 CaptionButton11.OnUpPtr = 0;
 CaptionButton11.OnDownPtr = 0;
 CaptionButton11.OnClickPtr = CaptionButton11Click;
 CaptionButton11.OnPressPtr = 0;

 CaptionButton12.OwnerScreen = &Screen3;
 CaptionButton12.Left = 35;
 CaptionButton12.Top = 27;
 CaptionButton12.Width = 18;
 CaptionButton12.Height = 18;
 CaptionButton12.BorderWidth = 3;
 CaptionButton12.Caption = CaptionButton12_Caption;
 CaptionButton12.FontName = 0;
 CaptionButton12.FontWidth = 7;
 CaptionButton12.FontHeight = 7;
 CaptionButton12.FontOffset = 32;
 CaptionButton12.FontColor = _clInvert;
 CaptionButton12.Visible = 1;
 CaptionButton12.OnUpPtr = 0;
 CaptionButton12.OnDownPtr = 0;
 CaptionButton12.OnClickPtr = CaptionButton12Click;
 CaptionButton12.OnPressPtr = 0;

 CaptionButton13.OwnerScreen = &Screen3;
 CaptionButton13.Left = 59;
 CaptionButton13.Top = 27;
 CaptionButton13.Width = 18;
 CaptionButton13.Height = 18;
 CaptionButton13.BorderWidth = 3;
 CaptionButton13.Caption = CaptionButton13_Caption;
 CaptionButton13.FontName = 0;
 CaptionButton13.FontWidth = 7;
 CaptionButton13.FontHeight = 7;
 CaptionButton13.FontOffset = 32;
 CaptionButton13.FontColor = _clInvert;
 CaptionButton13.Visible = 1;
 CaptionButton13.OnUpPtr = 0;
 CaptionButton13.OnDownPtr = 0;
 CaptionButton13.OnClickPtr = CaptionButton13Click;
 CaptionButton13.OnPressPtr = 0;

 CaptionButton14.OwnerScreen = &Screen3;
 CaptionButton14.Left = 83;
 CaptionButton14.Top = 27;
 CaptionButton14.Width = 18;
 CaptionButton14.Height = 18;
 CaptionButton14.BorderWidth = 3;
 CaptionButton14.Caption = CaptionButton14_Caption;
 CaptionButton14.FontName = 0;
 CaptionButton14.FontWidth = 7;
 CaptionButton14.FontHeight = 7;
 CaptionButton14.FontOffset = 32;
 CaptionButton14.FontColor = _clInvert;
 CaptionButton14.Visible = 1;
 CaptionButton14.OnUpPtr = 0;
 CaptionButton14.OnDownPtr = 0;
 CaptionButton14.OnClickPtr = CaptionButton14Click;
 CaptionButton14.OnPressPtr = 0;

 CaptionButton15.OwnerScreen = &Screen3;
 CaptionButton15.Left = 107;
 CaptionButton15.Top = 27;
 CaptionButton15.Width = 18;
 CaptionButton15.Height = 18;
 CaptionButton15.BorderWidth = 3;
 CaptionButton15.Caption = CaptionButton15_Caption;
 CaptionButton15.FontName = 0;
 CaptionButton15.FontWidth = 7;
 CaptionButton15.FontHeight = 7;
 CaptionButton15.FontOffset = 32;
 CaptionButton15.FontColor = _clInvert;
 CaptionButton15.Visible = 1;
 CaptionButton15.OnUpPtr = 0;
 CaptionButton15.OnDownPtr = 0;
 CaptionButton15.OnClickPtr = CaptionButton15Click;
 CaptionButton15.OnPressPtr = 0;

 CaptionButton16.OwnerScreen = &Screen3;
 CaptionButton16.Left = 131;
 CaptionButton16.Top = 27;
 CaptionButton16.Width = 18;
 CaptionButton16.Height = 18;
 CaptionButton16.BorderWidth = 3;
 CaptionButton16.Caption = CaptionButton16_Caption;
 CaptionButton16.FontName = 0;
 CaptionButton16.FontWidth = 7;
 CaptionButton16.FontHeight = 7;
 CaptionButton16.FontOffset = 32;
 CaptionButton16.FontColor = _clInvert;
 CaptionButton16.Visible = 1;
 CaptionButton16.OnUpPtr = 0;
 CaptionButton16.OnDownPtr = 0;
 CaptionButton16.OnClickPtr = CaptionButton16Click;
 CaptionButton16.OnPressPtr = 0;

 CaptionButton17.OwnerScreen = &Screen3;
 CaptionButton17.Left = 155;
 CaptionButton17.Top = 27;
 CaptionButton17.Width = 18;
 CaptionButton17.Height = 18;
 CaptionButton17.BorderWidth = 3;
 CaptionButton17.Caption = CaptionButton17_Caption;
 CaptionButton17.FontName = 0;
 CaptionButton17.FontWidth = 7;
 CaptionButton17.FontHeight = 7;
 CaptionButton17.FontOffset = 32;
 CaptionButton17.FontColor = _clInvert;
 CaptionButton17.Visible = 1;
 CaptionButton17.OnUpPtr = 0;
 CaptionButton17.OnDownPtr = 0;
 CaptionButton17.OnClickPtr = CaptionButton17Click;
 CaptionButton17.OnPressPtr = 0;

 CaptionButton18.OwnerScreen = &Screen3;
 CaptionButton18.Left = 179;
 CaptionButton18.Top = 27;
 CaptionButton18.Width = 18;
 CaptionButton18.Height = 18;
 CaptionButton18.BorderWidth = 3;
 CaptionButton18.Caption = CaptionButton18_Caption;
 CaptionButton18.FontName = 0;
 CaptionButton18.FontWidth = 7;
 CaptionButton18.FontHeight = 7;
 CaptionButton18.FontOffset = 32;
 CaptionButton18.FontColor = _clInvert;
 CaptionButton18.Visible = 1;
 CaptionButton18.OnUpPtr = 0;
 CaptionButton18.OnDownPtr = 0;
 CaptionButton18.OnClickPtr = CaptionButton18Click;
 CaptionButton18.OnPressPtr = 0;

 CaptionButton19.OwnerScreen = &Screen3;
 CaptionButton19.Left = 203;
 CaptionButton19.Top = 27;
 CaptionButton19.Width = 18;
 CaptionButton19.Height = 18;
 CaptionButton19.BorderWidth = 3;
 CaptionButton19.Caption = CaptionButton19_Caption;
 CaptionButton19.FontName = 0;
 CaptionButton19.FontWidth = 7;
 CaptionButton19.FontHeight = 7;
 CaptionButton19.FontOffset = 32;
 CaptionButton19.FontColor = _clInvert;
 CaptionButton19.Visible = 1;
 CaptionButton19.OnUpPtr = 0;
 CaptionButton19.OnDownPtr = 0;
 CaptionButton19.OnClickPtr = CaptionButton19Click;
 CaptionButton19.OnPressPtr = 0;

 CaptionButton20.OwnerScreen = &Screen3;
 CaptionButton20.Left = 19;
 CaptionButton20.Top = 51;
 CaptionButton20.Width = 18;
 CaptionButton20.Height = 18;
 CaptionButton20.BorderWidth = 3;
 CaptionButton20.Caption = CaptionButton20_Caption;
 CaptionButton20.FontName = 0;
 CaptionButton20.FontWidth = 7;
 CaptionButton20.FontHeight = 7;
 CaptionButton20.FontOffset = 32;
 CaptionButton20.FontColor = _clInvert;
 CaptionButton20.Visible = 1;
 CaptionButton20.OnUpPtr = 0;
 CaptionButton20.OnDownPtr = 0;
 CaptionButton20.OnClickPtr = CaptionButton20Click;
 CaptionButton20.OnPressPtr = 0;

 CaptionButton21.OwnerScreen = &Screen3;
 CaptionButton21.Left = 43;
 CaptionButton21.Top = 51;
 CaptionButton21.Width = 18;
 CaptionButton21.Height = 18;
 CaptionButton21.BorderWidth = 3;
 CaptionButton21.Caption = CaptionButton21_Caption;
 CaptionButton21.FontName = 0;
 CaptionButton21.FontWidth = 7;
 CaptionButton21.FontHeight = 7;
 CaptionButton21.FontOffset = 32;
 CaptionButton21.FontColor = _clInvert;
 CaptionButton21.Visible = 1;
 CaptionButton21.OnUpPtr = 0;
 CaptionButton21.OnDownPtr = 0;
 CaptionButton21.OnClickPtr = CaptionButton21Click;
 CaptionButton21.OnPressPtr = 0;

 CaptionButton22.OwnerScreen = &Screen3;
 CaptionButton22.Left = 67;
 CaptionButton22.Top = 51;
 CaptionButton22.Width = 18;
 CaptionButton22.Height = 18;
 CaptionButton22.BorderWidth = 3;
 CaptionButton22.Caption = CaptionButton22_Caption;
 CaptionButton22.FontName = 0;
 CaptionButton22.FontWidth = 7;
 CaptionButton22.FontHeight = 7;
 CaptionButton22.FontOffset = 32;
 CaptionButton22.FontColor = _clInvert;
 CaptionButton22.Visible = 1;
 CaptionButton22.OnUpPtr = 0;
 CaptionButton22.OnDownPtr = 0;
 CaptionButton22.OnClickPtr = CaptionButton22Click;
 CaptionButton22.OnPressPtr = 0;

 CaptionButton23.OwnerScreen = &Screen3;
 CaptionButton23.Left = 91;
 CaptionButton23.Top = 51;
 CaptionButton23.Width = 18;
 CaptionButton23.Height = 18;
 CaptionButton23.BorderWidth = 3;
 CaptionButton23.Caption = CaptionButton23_Caption;
 CaptionButton23.FontName = 0;
 CaptionButton23.FontWidth = 7;
 CaptionButton23.FontHeight = 7;
 CaptionButton23.FontOffset = 32;
 CaptionButton23.FontColor = _clInvert;
 CaptionButton23.Visible = 1;
 CaptionButton23.OnUpPtr = 0;
 CaptionButton23.OnDownPtr = 0;
 CaptionButton23.OnClickPtr = CaptionButton23Click;
 CaptionButton23.OnPressPtr = 0;

 CaptionButton24.OwnerScreen = &Screen3;
 CaptionButton24.Left = 115;
 CaptionButton24.Top = 51;
 CaptionButton24.Width = 18;
 CaptionButton24.Height = 18;
 CaptionButton24.BorderWidth = 3;
 CaptionButton24.Caption = CaptionButton24_Caption;
 CaptionButton24.FontName = 0;
 CaptionButton24.FontWidth = 7;
 CaptionButton24.FontHeight = 7;
 CaptionButton24.FontOffset = 32;
 CaptionButton24.FontColor = _clInvert;
 CaptionButton24.Visible = 1;
 CaptionButton24.OnUpPtr = 0;
 CaptionButton24.OnDownPtr = 0;
 CaptionButton24.OnClickPtr = CaptionButton24Click;
 CaptionButton24.OnPressPtr = 0;

 CaptionButton25.OwnerScreen = &Screen3;
 CaptionButton25.Left = 139;
 CaptionButton25.Top = 51;
 CaptionButton25.Width = 18;
 CaptionButton25.Height = 18;
 CaptionButton25.BorderWidth = 3;
 CaptionButton25.Caption = CaptionButton25_Caption;
 CaptionButton25.FontName = 0;
 CaptionButton25.FontWidth = 7;
 CaptionButton25.FontHeight = 7;
 CaptionButton25.FontOffset = 32;
 CaptionButton25.FontColor = _clInvert;
 CaptionButton25.Visible = 1;
 CaptionButton25.OnUpPtr = 0;
 CaptionButton25.OnDownPtr = 0;
 CaptionButton25.OnClickPtr = CaptionButton25Click;
 CaptionButton25.OnPressPtr = 0;

 CaptionButton26.OwnerScreen = &Screen3;
 CaptionButton26.Left = 163;
 CaptionButton26.Top = 51;
 CaptionButton26.Width = 18;
 CaptionButton26.Height = 18;
 CaptionButton26.BorderWidth = 3;
 CaptionButton26.Caption = CaptionButton26_Caption;
 CaptionButton26.FontName = 0;
 CaptionButton26.FontWidth = 7;
 CaptionButton26.FontHeight = 7;
 CaptionButton26.FontOffset = 32;
 CaptionButton26.FontColor = _clInvert;
 CaptionButton26.Visible = 1;
 CaptionButton26.OnUpPtr = 0;
 CaptionButton26.OnDownPtr = 0;
 CaptionButton26.OnClickPtr = CaptionButton26Click;
 CaptionButton26.OnPressPtr = 0;

 Image1.OwnerScreen = &Screen3;
 Image1.Left = 186;
 Image1.Top = 51;
 Image1.Width = 50;
 Image1.Height = 18;
 Image1.PictureWidth = 50;
 Image1.PictureHeight = 18;
 Image1.PictureName = backspace;
 Image1.Visible = 1;
 Image1.AutoSize = 0;
 Image1.OnUpPtr = 0;
 Image1.OnDownPtr = 0;
 Image1.OnClickPtr = Image1Click;
 Image1.OnPressPtr = 0;

 CaptionButton27.OwnerScreen = &Screen3;
 CaptionButton27.Left = 27;
 CaptionButton27.Top = 75;
 CaptionButton27.Width = 114;
 CaptionButton27.Height = 18;
 CaptionButton27.BorderWidth = 3;
 CaptionButton27.Caption = CaptionButton27_Caption;
 CaptionButton27.FontName = 0;
 CaptionButton27.FontWidth = 7;
 CaptionButton27.FontHeight = 7;
 CaptionButton27.FontOffset = 32;
 CaptionButton27.FontColor = _clInvert;
 CaptionButton27.Visible = 1;
 CaptionButton27.OnUpPtr = 0;
 CaptionButton27.OnDownPtr = 0;
 CaptionButton27.OnClickPtr = CaptionButton27Click;
 CaptionButton27.OnPressPtr = 0;

 Label7.OwnerScreen = &Screen3;
 Label7.Left = 8;
 Label7.Top = 104;
 Label7.Width = 1;
 Label7.Height = 8;
 Label7.Caption = Label7_Caption;
 Label7.FontName = 0;
 Label7.FontWidth = 7;
 Label7.FontHeight = 7;
 Label7.FontOffset = 32;
 Label7.FontColor = _clInvert;
 Label7.Visible = 1;
 Label7.OnUpPtr = 0;
 Label7.OnDownPtr = 0;
 Label7.OnClickPtr = 0;
 Label7.OnPressPtr = 0;

 Rectangle2.OwnerScreen = &Screen3;
 Rectangle2.Left = 5;
 Rectangle2.Top = 99;
 Rectangle2.Width = 176;
 Rectangle2.Height = 19;
 Rectangle2.Visible = 1;
 Rectangle2.OnUpPtr = 0;
 Rectangle2.OnDownPtr = 0;
 Rectangle2.OnClickPtr = 0;
 Rectangle2.OnPressPtr = 0;

 RoundCaptionButton13.OwnerScreen = &Screen3;
 RoundCaptionButton13.Left = 155;
 RoundCaptionButton13.Top = 75;
 RoundCaptionButton13.Width = 82;
 RoundCaptionButton13.Height = 18;
 RoundCaptionButton13.BorderWidth = 3;
 RoundCaptionButton13.Round_Radius = 4;
 RoundCaptionButton13.Caption = RoundCaptionButton13_Caption;
 RoundCaptionButton13.FontName = 0;
 RoundCaptionButton13.FontWidth = 7;
 RoundCaptionButton13.FontHeight = 7;
 RoundCaptionButton13.FontOffset = 32;
 RoundCaptionButton13.FontColor = _clInvert;
 RoundCaptionButton13.Visible = 1;
 RoundCaptionButton13.OnUpPtr = 0;
 RoundCaptionButton13.OnDownPtr = 0;
 RoundCaptionButton13.OnClickPtr = RoundCaptionButton13Click;
 RoundCaptionButton13.OnPressPtr = 0;

 RoundCaptionButton5.OwnerScreen = &Screen4;
 RoundCaptionButton5.Left = 187;
 RoundCaptionButton5.Top = 99;
 RoundCaptionButton5.Width = 42;
 RoundCaptionButton5.Height = 18;
 RoundCaptionButton5.BorderWidth = 3;
 RoundCaptionButton5.Round_Radius = 4;
 RoundCaptionButton5.Caption = RoundCaptionButton5_Caption;
 RoundCaptionButton5.FontName = 0;
 RoundCaptionButton5.FontWidth = 7;
 RoundCaptionButton5.FontHeight = 7;
 RoundCaptionButton5.FontOffset = 32;
 RoundCaptionButton5.FontColor = _clInvert;
 RoundCaptionButton5.Visible = 1;
 RoundCaptionButton5.OnUpPtr = 0;
 RoundCaptionButton5.OnDownPtr = 0;
 RoundCaptionButton5.OnClickPtr = RoundCaptionButton5Click;
 RoundCaptionButton5.OnPressPtr = 0;

 Label16.OwnerScreen = &Screen4;
 Label16.Left = 96;
 Label16.Top = 16;
 Label16.Width = 40;
 Label16.Height = 8;
 Label16.Caption = Label16_Caption;
 Label16.FontName = 0;
 Label16.FontWidth = 7;
 Label16.FontHeight = 7;
 Label16.FontOffset = 32;
 Label16.FontColor = _clInvert;
 Label16.Visible = 1;
 Label16.OnUpPtr = 0;
 Label16.OnDownPtr = 0;
 Label16.OnClickPtr = 0;
 Label16.OnPressPtr = 0;

 Label17.OwnerScreen = &Screen4;
 Label17.Left = 8;
 Label17.Top = 32;
 Label17.Width = 184;
 Label17.Height = 8;
 Label17.Caption = Label17_Caption;
 Label17.FontName = 0;
 Label17.FontWidth = 7;
 Label17.FontHeight = 7;
 Label17.FontOffset = 32;
 Label17.FontColor = _clInvert;
 Label17.Visible = 1;
 Label17.OnUpPtr = 0;
 Label17.OnDownPtr = 0;
 Label17.OnClickPtr = 0;
 Label17.OnPressPtr = 0;

 Label18.OwnerScreen = &Screen4;
 Label18.Left = 8;
 Label18.Top = 40;
 Label18.Width = 208;
 Label18.Height = 8;
 Label18.Caption = Label18_Caption;
 Label18.FontName = 0;
 Label18.FontWidth = 7;
 Label18.FontHeight = 7;
 Label18.FontOffset = 32;
 Label18.FontColor = _clInvert;
 Label18.Visible = 1;
 Label18.OnUpPtr = 0;
 Label18.OnDownPtr = 0;
 Label18.OnClickPtr = 0;
 Label18.OnPressPtr = 0;

 Label19.OwnerScreen = &Screen4;
 Label19.Left = 8;
 Label19.Top = 48;
 Label19.Width = 192;
 Label19.Height = 8;
 Label19.Caption = Label19_Caption;
 Label19.FontName = 0;
 Label19.FontWidth = 7;
 Label19.FontHeight = 7;
 Label19.FontOffset = 32;
 Label19.FontColor = _clInvert;
 Label19.Visible = 1;
 Label19.OnUpPtr = 0;
 Label19.OnDownPtr = 0;
 Label19.OnClickPtr = 0;
 Label19.OnPressPtr = 0;

 Label20.OwnerScreen = &Screen4;
 Label20.Left = 8;
 Label20.Top = 56;
 Label20.Width = 184;
 Label20.Height = 8;
 Label20.Caption = Label20_Caption;
 Label20.FontName = 0;
 Label20.FontWidth = 7;
 Label20.FontHeight = 7;
 Label20.FontOffset = 32;
 Label20.FontColor = _clInvert;
 Label20.Visible = 1;
 Label20.OnUpPtr = 0;
 Label20.OnDownPtr = 0;
 Label20.OnClickPtr = 0;
 Label20.OnPressPtr = 0;

 Label21.OwnerScreen = &Screen4;
 Label21.Left = 8;
 Label21.Top = 64;
 Label21.Width = 224;
 Label21.Height = 8;
 Label21.Caption = Label21_Caption;
 Label21.FontName = 0;
 Label21.FontWidth = 7;
 Label21.FontHeight = 7;
 Label21.FontOffset = 32;
 Label21.FontColor = _clInvert;
 Label21.Visible = 1;
 Label21.OnUpPtr = 0;
 Label21.OnDownPtr = 0;
 Label21.OnClickPtr = 0;
 Label21.OnPressPtr = 0;

 Label22.OwnerScreen = &Screen4;
 Label22.Left = 8;
 Label22.Top = 72;
 Label22.Width = 208;
 Label22.Height = 8;
 Label22.Caption = Label22_Caption;
 Label22.FontName = 0;
 Label22.FontWidth = 7;
 Label22.FontHeight = 7;
 Label22.FontOffset = 32;
 Label22.FontColor = _clInvert;
 Label22.Visible = 1;
 Label22.OnUpPtr = 0;
 Label22.OnDownPtr = 0;
 Label22.OnClickPtr = 0;
 Label22.OnPressPtr = 0;

 RoundCaptionButton6.OwnerScreen = &Screen5;
 RoundCaptionButton6.Left = 187;
 RoundCaptionButton6.Top = 99;
 RoundCaptionButton6.Width = 42;
 RoundCaptionButton6.Height = 18;
 RoundCaptionButton6.BorderWidth = 3;
 RoundCaptionButton6.Round_Radius = 4;
 RoundCaptionButton6.Caption = RoundCaptionButton6_Caption;
 RoundCaptionButton6.FontName = 0;
 RoundCaptionButton6.FontWidth = 7;
 RoundCaptionButton6.FontHeight = 7;
 RoundCaptionButton6.FontOffset = 32;
 RoundCaptionButton6.FontColor = _clInvert;
 RoundCaptionButton6.Visible = 1;
 RoundCaptionButton6.OnUpPtr = 0;
 RoundCaptionButton6.OnDownPtr = 0;
 RoundCaptionButton6.OnClickPtr = RoundCaptionButton6Click;
 RoundCaptionButton6.OnPressPtr = 0;

 RoundCaptionButton7.OwnerScreen = &Screen5;
 RoundCaptionButton7.Left = 19;
 RoundCaptionButton7.Top = 11;
 RoundCaptionButton7.Width = 50;
 RoundCaptionButton7.Height = 18;
 RoundCaptionButton7.BorderWidth = 3;
 RoundCaptionButton7.Round_Radius = 4;
 RoundCaptionButton7.Caption = RoundCaptionButton7_Caption;
 RoundCaptionButton7.FontName = 0;
 RoundCaptionButton7.FontWidth = 7;
 RoundCaptionButton7.FontHeight = 7;
 RoundCaptionButton7.FontOffset = 32;
 RoundCaptionButton7.FontColor = _clInvert;
 RoundCaptionButton7.Visible = 1;
 RoundCaptionButton7.OnUpPtr = 0;
 RoundCaptionButton7.OnDownPtr = 0;
 RoundCaptionButton7.OnClickPtr = RoundCaptionButton7Click;
 RoundCaptionButton7.OnPressPtr = 0;

 RoundCaptionButton8.OwnerScreen = &Screen5;
 RoundCaptionButton8.Left = 91;
 RoundCaptionButton8.Top = 11;
 RoundCaptionButton8.Width = 50;
 RoundCaptionButton8.Height = 18;
 RoundCaptionButton8.BorderWidth = 3;
 RoundCaptionButton8.Round_Radius = 4;
 RoundCaptionButton8.Caption = RoundCaptionButton8_Caption;
 RoundCaptionButton8.FontName = 0;
 RoundCaptionButton8.FontWidth = 7;
 RoundCaptionButton8.FontHeight = 7;
 RoundCaptionButton8.FontOffset = 32;
 RoundCaptionButton8.FontColor = _clInvert;
 RoundCaptionButton8.Visible = 1;
 RoundCaptionButton8.OnUpPtr = 0;
 RoundCaptionButton8.OnDownPtr = 0;
 RoundCaptionButton8.OnClickPtr = RoundCaptionButton8Click;
 RoundCaptionButton8.OnPressPtr = 0;

 RoundCaptionButton9.OwnerScreen = &Screen5;
 RoundCaptionButton9.Left = 163;
 RoundCaptionButton9.Top = 11;
 RoundCaptionButton9.Width = 50;
 RoundCaptionButton9.Height = 18;
 RoundCaptionButton9.BorderWidth = 3;
 RoundCaptionButton9.Round_Radius = 4;
 RoundCaptionButton9.Caption = RoundCaptionButton9_Caption;
 RoundCaptionButton9.FontName = 0;
 RoundCaptionButton9.FontWidth = 7;
 RoundCaptionButton9.FontHeight = 7;
 RoundCaptionButton9.FontOffset = 32;
 RoundCaptionButton9.FontColor = _clInvert;
 RoundCaptionButton9.Visible = 1;
 RoundCaptionButton9.OnUpPtr = 0;
 RoundCaptionButton9.OnDownPtr = 0;
 RoundCaptionButton9.OnClickPtr = RoundCaptionButton9Click;
 RoundCaptionButton9.OnPressPtr = 0;

 Label3.OwnerScreen = &Screen5;
 Label3.Left = 32;
 Label3.Top = 32;
 Label3.Width = 16;
 Label3.Height = 8;
 Label3.Caption = Label3_Caption;
 Label3.FontName = 0;
 Label3.FontWidth = 7;
 Label3.FontHeight = 7;
 Label3.FontOffset = 32;
 Label3.FontColor = _clInvert;
 Label3.Visible = 1;
 Label3.OnUpPtr = 0;
 Label3.OnDownPtr = 0;
 Label3.OnClickPtr = 0;
 Label3.OnPressPtr = 0;

 Label4.OwnerScreen = &Screen5;
 Label4.Left = 104;
 Label4.Top = 32;
 Label4.Width = 16;
 Label4.Height = 8;
 Label4.Caption = Label4_Caption;
 Label4.FontName = 0;
 Label4.FontWidth = 7;
 Label4.FontHeight = 7;
 Label4.FontOffset = 32;
 Label4.FontColor = _clInvert;
 Label4.Visible = 1;
 Label4.OnUpPtr = 0;
 Label4.OnDownPtr = 0;
 Label4.OnClickPtr = 0;
 Label4.OnPressPtr = 0;

 Label5.OwnerScreen = &Screen5;
 Label5.Left = 176;
 Label5.Top = 32;
 Label5.Width = 16;
 Label5.Height = 8;
 Label5.Caption = Label5_Caption;
 Label5.FontName = 0;
 Label5.FontWidth = 7;
 Label5.FontHeight = 7;
 Label5.FontOffset = 32;
 Label5.FontColor = _clInvert;
 Label5.Visible = 1;
 Label5.OnUpPtr = 0;
 Label5.OnDownPtr = 0;
 Label5.OnClickPtr = 0;
 Label5.OnPressPtr = 0;

 RoundCaptionButton11.OwnerScreen = &Screen5;
 RoundCaptionButton11.Left = 59;
 RoundCaptionButton11.Top = 51;
 RoundCaptionButton11.Width = 114;
 RoundCaptionButton11.Height = 18;
 RoundCaptionButton11.BorderWidth = 3;
 RoundCaptionButton11.Round_Radius = 4;
 RoundCaptionButton11.Caption = RoundCaptionButton11_Caption;
 RoundCaptionButton11.FontName = 0;
 RoundCaptionButton11.FontWidth = 7;
 RoundCaptionButton11.FontHeight = 7;
 RoundCaptionButton11.FontOffset = 32;
 RoundCaptionButton11.FontColor = _clInvert;
 RoundCaptionButton11.Visible = 1;
 RoundCaptionButton11.OnUpPtr = 0;
 RoundCaptionButton11.OnDownPtr = 0;
 RoundCaptionButton11.OnClickPtr = RoundCaptionButton11Click;
 RoundCaptionButton11.OnPressPtr = 0;

 RoundCaptionButton12.OwnerScreen = &Screen5;
 RoundCaptionButton12.Left = 59;
 RoundCaptionButton12.Top = 75;
 RoundCaptionButton12.Width = 114;
 RoundCaptionButton12.Height = 18;
 RoundCaptionButton12.BorderWidth = 3;
 RoundCaptionButton12.Round_Radius = 4;
 RoundCaptionButton12.Caption = RoundCaptionButton12_Caption;
 RoundCaptionButton12.FontName = 0;
 RoundCaptionButton12.FontWidth = 7;
 RoundCaptionButton12.FontHeight = 7;
 RoundCaptionButton12.FontOffset = 32;
 RoundCaptionButton12.FontColor = _clInvert;
 RoundCaptionButton12.Visible = 1;
 RoundCaptionButton12.OnUpPtr = 0;
 RoundCaptionButton12.OnDownPtr = 0;
 RoundCaptionButton12.OnClickPtr = RoundCaptionButton12Click;
 RoundCaptionButton12.OnPressPtr = 0;

 RoundCaptionButton10.OwnerScreen = &Screen5;
 RoundCaptionButton10.Left = 59;
 RoundCaptionButton10.Top = 99;
 RoundCaptionButton10.Width = 114;
 RoundCaptionButton10.Height = 18;
 RoundCaptionButton10.BorderWidth = 3;
 RoundCaptionButton10.Round_Radius = 4;
 RoundCaptionButton10.Caption = RoundCaptionButton10_Caption;
 RoundCaptionButton10.FontName = 0;
 RoundCaptionButton10.FontWidth = 7;
 RoundCaptionButton10.FontHeight = 7;
 RoundCaptionButton10.FontOffset = 32;
 RoundCaptionButton10.FontColor = _clInvert;
 RoundCaptionButton10.Visible = 1;
 RoundCaptionButton10.OnUpPtr = 0;
 RoundCaptionButton10.OnDownPtr = 0;
 RoundCaptionButton10.OnClickPtr = RoundCaptionButton10Click;
 RoundCaptionButton10.OnPressPtr = 0;

 CaptionButton28.OwnerScreen = &Screen6;
 CaptionButton28.Left = 155;
 CaptionButton28.Top = 107;
 CaptionButton28.Width = 82;
 CaptionButton28.Height = 18;
 CaptionButton28.BorderWidth = 3;
 CaptionButton28.Caption = CaptionButton28_Caption;
 CaptionButton28.FontName = 0;
 CaptionButton28.FontWidth = 7;
 CaptionButton28.FontHeight = 7;
 CaptionButton28.FontOffset = 32;
 CaptionButton28.FontColor = _clInvert;
 CaptionButton28.Visible = 0;
 CaptionButton28.OnUpPtr = 0;
 CaptionButton28.OnDownPtr = 0;
 CaptionButton28.OnClickPtr = CaptionButton28Click;
 CaptionButton28.OnPressPtr = 0;
}

static char IsInsideObject (unsigned int X, unsigned int Y, char Left, char Top, char Width, char Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}









void DrawCaptionButton(TCaptionButton *Acaption_button) {
 T6963C_box(Acaption_button->Left, Acaption_button->Top,
 Acaption_button->Left + Acaption_button->Width - 1,
 Acaption_button->Top + Acaption_button->Height - 1,  0b1000 );
 if ((Acaption_button->Width >= 5) && (Acaption_button->Height >= 5))
 T6963C_rectangle(Acaption_button->Left + 1, Acaption_button->Top + 1,
 Acaption_button->Left + Acaption_button->Width - 2,
 Acaption_button->Top + Acaption_button->Height - 2,  0 );
 T6963C_write_text(Acaption_button->Caption,
 (Acaption_button->Left + Acaption_button->BorderWidth + 2) / 8,
 (Acaption_button->Top + Acaption_button->BorderWidth + 2) / 8,  0b10000001 );
}

static void DrawCaptionButtons() {
 int i;
 TCaptionButton *local_caption_button;

 for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
 local_caption_button =  CurrentScreen->CaptionButtons[i] ;
 if (local_caption_button->Visible == 1) {
 DrawCaptionButton(local_caption_button);
 }
 }
}


void DrawRoundCaptionButton(TCaptionButton_Round *Around_caption_button) {
 T6963C_Rectangle_Round_Edges_Fill(Around_caption_button->Left, Around_caption_button->Top,
 Around_caption_button->Left + Around_caption_button->Width - 1,
 Around_caption_button->Top + Around_caption_button->Height - 1, Around_caption_button->Round_Radius,  0b1000 );
 if ((Around_caption_button->Width >= 5) && (Around_caption_button->Height >= 5))
 T6963C_Rectangle_Round_Edges(Around_caption_button->Left + 1, Around_caption_button->Top + 1,
 Around_caption_button->Left + Around_caption_button->Width - 2,
 Around_caption_button->Top + Around_caption_button->Height - 2, Around_caption_button->Round_Radius,  0 );
 T6963C_write_text(Around_caption_button->Caption,
 (Around_caption_button->Left + Around_caption_button->BorderWidth + 2) / 8,
 (Around_caption_button->Top + Around_caption_button->BorderWidth + 2) / 8,  0b10000001 );
}

static void DrawRoundCaptionButtons() {
 int i;
 TCaptionButton_Round *local_round_caption_button;

 for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
 local_round_caption_button =  CurrentScreen->CaptionButtons_Round[i] ;
 if (local_round_caption_button->Visible == 1) {
 DrawRoundCaptionButton(local_round_caption_button);
 }
 }
}


void DrawLabel(TLabel *Alabel) {
 T6963C_write_text(Alabel->Caption, Alabel->Left / 8,
 Alabel->Top / 8,  0b10000001 );
}

static void DrawLabels() {
 int i;
 TLabel *local_label;

 for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
 local_label =  CurrentScreen->Labels[i] ;
 if (local_label->Visible == 1) {
 DrawLabel(local_label);
 }
 }
}


void DrawImage(TImage *Aimage) {
 if (Aimage->AutoSize == 1) {
 Aimage->Width = Aimage->PictureWidth;
 Aimage->Height = Aimage->PictureHeight;
 }
 T6963C_PartialImage(Aimage->Left, Aimage->Top, Aimage->Width,
 Aimage->Height, Aimage->PictureWidth, Aimage->PictureHeight,
 Aimage->PictureName);
}

static void DrawImages() {
 int i;
 TImage *local_image;

 for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
 local_image =  CurrentScreen->Images[i] ;
 if (local_image->Visible == 1) {
 DrawImage(local_image);
 }
 }
}


void DrawRectangle(TRectangle *Arectangle) {
 T6963C_Rectangle(Arectangle->Left, Arectangle->Top,
 Arectangle->Left + Arectangle->Width - 1,
 Arectangle->Top + Arectangle->Height - 1,  0b1000 );
}

static void DrawRectangles() {
 int i;
 TRectangle *local_rectangle;

 for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
 local_rectangle =  CurrentScreen->Rectangles[i] ;
 if (local_rectangle->Visible == 1) {
 DrawRectangle(local_rectangle);
 }
 }
}

void DrawScreen(TScreen *aScreen) {
  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemsize, T6963C_txtMemSize) ;

 CurrentScreen = aScreen;

 DrawImages();

 DrawCaptionButtons();

 DrawRoundCaptionButtons();

 DrawRectangles();


 DrawLabels();

}

static void Process_TP_Press(unsigned int X, unsigned int Y) {
 int i;
 TCaptionButton *local_caption_button;
 TCaptionButton_Round *local_caption_round_button;
 TLabel *local_label;
 TImage *local_image;
 TRectangle *local_rectangle;


 for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
 local_caption_button =  CurrentScreen->CaptionButtons[i] ;
 if (IsInsideObject(X, Y, local_caption_button->Left, local_caption_button->Top,
 local_caption_button->Width, local_caption_button->Height) == 1) {
 if (local_caption_button->OnPressPtr != 0) {
 local_caption_button->OnPressPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
 local_caption_round_button =  CurrentScreen->CaptionButtons_Round[i] ;
 if (IsInsideObject(X, Y, local_caption_round_button->Left, local_caption_round_button->Top,
 local_caption_round_button->Width, local_caption_round_button->Height) == 1) {
 if (local_caption_round_button->OnPressPtr != 0) {
 local_caption_round_button->OnPressPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
 local_label =  CurrentScreen->Labels[i] ;
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 if (local_label->OnPressPtr != 0) {
 local_label->OnPressPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
 local_image =  CurrentScreen->Images[i] ;
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 if (local_image->OnPressPtr != 0) {
 local_image->OnPressPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
 local_rectangle =  CurrentScreen->Rectangles[i] ;
 if (IsInsideObject(X, Y, local_rectangle->Left, local_rectangle->Top,
 local_rectangle->Width, local_rectangle->Height) == 1) {
 if (local_rectangle->OnPressPtr != 0) {
 local_rectangle->OnPressPtr();
 return;
 }
 }
 }

}

static void Process_TP_Up(unsigned int X, unsigned int Y) {
 int i;
 TCaptionButton *local_caption_button;
 TCaptionButton_Round *local_caption_round_button;
 TLabel *local_label;
 TImage *local_image;
 TRectangle *local_rectangle;


 for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
 local_caption_button =  CurrentScreen->CaptionButtons[i] ;
 if (IsInsideObject(X, Y, local_caption_button->Left, local_caption_button->Top,
 local_caption_button->Width, local_caption_button->Height) == 1) {
 if (local_caption_button->OnUpPtr != 0)
 local_caption_button->OnUpPtr();

 if (PressedObject == (void *)local_caption_button)
 if (local_caption_button->OnClickPtr != 0)
 local_caption_button->OnClickPtr();

 PressedObject = 0;
 return;

 }
 }


 for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
 local_caption_round_button =  CurrentScreen->CaptionButtons_Round[i] ;
 if (IsInsideObject(X, Y, local_caption_round_button->Left, local_caption_round_button->Top,
 local_caption_round_button->Width, local_caption_round_button->Height) == 1) {
 if (local_caption_round_button->OnUpPtr != 0)
 local_caption_round_button->OnUpPtr();

 if (PressedObject == (void *)local_caption_round_button)
 if (local_caption_round_button->OnClickPtr != 0)
 local_caption_round_button->OnClickPtr();

 PressedObject = 0;
 return;

 }
 }


 for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
 local_label =  CurrentScreen->Labels[i] ;
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 if (local_label->OnUpPtr != 0)
 local_label->OnUpPtr();

 if (PressedObject == (void *)local_label)
 if (local_label->OnClickPtr != 0)
 local_label->OnClickPtr();

 PressedObject = 0;
 return;

 }
 }


 for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
 local_image =  CurrentScreen->Images[i] ;
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 if (local_image->OnUpPtr != 0)
 local_image->OnUpPtr();

 if (PressedObject == (void *)local_image)
 if (local_image->OnClickPtr != 0)
 local_image->OnClickPtr();

 PressedObject = 0;
 return;

 }
 }


 for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
 local_rectangle =  CurrentScreen->Rectangles[i] ;
 if (IsInsideObject(X, Y, local_rectangle->Left, local_rectangle->Top,
 local_rectangle->Width, local_rectangle->Height) == 1) {
 if (local_rectangle->OnUpPtr != 0)
 local_rectangle->OnUpPtr();

 if (PressedObject == (void *)local_rectangle)
 if (local_rectangle->OnClickPtr != 0)
 local_rectangle->OnClickPtr();

 PressedObject = 0;
 return;

 }
 }

 PressedObject = 0;
}

static void Process_TP_Down(unsigned int X, unsigned int Y) {
 int i;
 TCaptionButton *local_caption_button;
 TCaptionButton_Round *local_caption_round_button;
 TLabel *local_label;
 TImage *local_image;
 TRectangle *local_rectangle;


 for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
 local_caption_button =  CurrentScreen->CaptionButtons[i] ;
 if (IsInsideObject(X, Y, local_caption_button->Left, local_caption_button->Top,
 local_caption_button->Width, local_caption_button->Height) == 1) {
 PressedObject = (void *)local_caption_button;
 if (local_caption_button->OnDownPtr != 0) {
 local_caption_button->OnDownPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
 local_caption_round_button =  CurrentScreen->CaptionButtons_Round[i] ;
 if (IsInsideObject(X, Y, local_caption_round_button->Left, local_caption_round_button->Top,
 local_caption_round_button->Width, local_caption_round_button->Height) == 1) {
 PressedObject = (void *)local_caption_round_button;
 if (local_caption_round_button->OnDownPtr != 0) {
 local_caption_round_button->OnDownPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
 local_label =  CurrentScreen->Labels[i] ;
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 PressedObject = (void *)local_label;
 if (local_label->OnDownPtr != 0) {
 local_label->OnDownPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
 local_image =  CurrentScreen->Images[i] ;
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 PressedObject = (void *)local_image;
 if (local_image->OnDownPtr != 0) {
 local_image->OnDownPtr();
 return;
 }
 }
 }


 for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
 local_rectangle =  CurrentScreen->Rectangles[i] ;
 if (IsInsideObject(X, Y, local_rectangle->Left, local_rectangle->Top,
 local_rectangle->Width, local_rectangle->Height) == 1) {
 PressedObject = (void *)local_rectangle;
 if (local_rectangle->OnDownPtr != 0) {
 local_rectangle->OnDownPtr();
 return;
 }
 }
 }

}

void Check_TP() {
 if (TP_Press_Detect()) {

 if (TP_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Start_TP() {
 InitializeTouchPanel();

 T6963C_write_text("CALIBRATION",40,7, 0b10000001 );
 Delay_ms(1000);
  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemsize, T6963C_txtMemSize) ;
 Calibrate();

  T6963C_fill(0, 0, T6963C_grMemSize) ;
  T6963C_fill(0, T6963C_grMemsize, T6963C_txtMemSize) ;
 InitializeObjects();
 DrawScreen(&Screen1);
}
