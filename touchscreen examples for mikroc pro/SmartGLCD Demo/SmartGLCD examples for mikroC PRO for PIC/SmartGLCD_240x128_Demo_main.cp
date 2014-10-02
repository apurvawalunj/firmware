#line 1 "C:/Users/BILLGA~1/school/EE5100~1/TOUCHS~1/SMARTG~1/SMARTG~1/EXAMPL~1.51/SMARTG~2/SMARTG~1/SMARTG~1/SmartGLCD_240x128_Demo_main.c"
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
#line 34 "C:/Users/BILLGA~1/school/EE5100~1/TOUCHS~1/SMARTG~1/SMARTG~1/EXAMPL~1.51/SMARTG~2/SMARTG~1/SMARTG~1/SmartGLCD_240x128_Demo_main.c"
void main() {

 Start_TP();

 while (1) {
 Check_TP();

 }

}
