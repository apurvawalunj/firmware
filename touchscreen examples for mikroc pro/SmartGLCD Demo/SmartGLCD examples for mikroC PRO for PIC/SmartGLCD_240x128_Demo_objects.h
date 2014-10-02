#include "__T6963C.h"
enum GlcdColor {_clClear, _clDraw, _clInvert};

typedef struct Screen TScreen;

typedef struct  Label {
  TScreen       *OwnerScreen;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          *Caption;
  const char    *FontName;
  char          FontWidth;
  char          FontHeight;
  char          FontOffset;
  char          FontColor;
  char          Visible;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Image {
  TScreen       *OwnerScreen;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          PictureWidth;
  char          PictureHeight;
  const char    *PictureName;
  char          Visible;
  char          AutoSize;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef struct  CaptionButton {
  TScreen       *OwnerScreen;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          BorderWidth;
  char          *Caption;
  const char    *FontName;
  char          FontWidth;
  char          FontHeight;
  char          FontOffset;
  char          FontColor;
  char          Visible;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TCaptionButton;

typedef struct  CaptionButton_Round {
  TScreen       *OwnerScreen;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          BorderWidth;
  char          Round_Radius;
  char          *Caption;
  const char    *FontName;
  char          FontWidth;
  char          FontHeight;
  char          FontOffset;
  char          FontColor;
  char          Visible;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TCaptionButton_Round;

typedef struct  Rectangle {
  TScreen       *OwnerScreen;
  char          Left;
  char          Top;
  char          Width;
  char          Height;
  char          Visible;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TRectangle;

struct Screen {
  unsigned int           LabelsCount;
  TLabel                 **Labels;
  unsigned int           ImagesCount;
  TImage                 **Images;
  unsigned int           CaptionButtonsCount;
  TCaptionButton         **CaptionButtons;
  unsigned int           CaptionButtons_RoundCount;
  TCaptionButton_Round   **CaptionButtons_Round;
  unsigned int           RectanglesCount;
  TRectangle             **Rectangles;
};

extern   TScreen                Screen1;
extern   TLabel                 Label1;
extern   TLabel                 Label2;
extern   TCaptionButton_Round   RoundCaptionButton1;
extern   TCaptionButton_Round   RoundCaptionButton2;
extern   TImage                 Image2;
extern   TCaptionButton_Round   RoundCaptionButton14;

extern   TScreen                Screen2;
extern   TCaptionButton_Round   RoundCaptionButton3;
extern   TLabel                 Label8;
extern   TLabel                 Label9;
extern   TLabel                 Label10;
extern   TLabel                 Label11;
extern   TLabel                 Label12;
extern   TLabel                 Label13;
extern   TLabel                 Label14;
extern   TLabel                 Label15;

extern   TScreen                Screen3;
extern   TCaptionButton_Round   RoundCaptionButton4;
extern   TCaptionButton         CaptionButton1;
extern   TCaptionButton         CaptionButton2;
extern   TCaptionButton         CaptionButton3;
extern   TCaptionButton         CaptionButton4;
extern   TCaptionButton         CaptionButton5;
extern   TCaptionButton         CaptionButton6;
extern   TCaptionButton         CaptionButton7;
extern   TCaptionButton         CaptionButton8;
extern   TCaptionButton         CaptionButton9;
extern   TCaptionButton         CaptionButton10;
extern   TCaptionButton         CaptionButton11;
extern   TCaptionButton         CaptionButton12;
extern   TCaptionButton         CaptionButton13;
extern   TCaptionButton         CaptionButton14;
extern   TCaptionButton         CaptionButton15;
extern   TCaptionButton         CaptionButton16;
extern   TCaptionButton         CaptionButton17;
extern   TCaptionButton         CaptionButton18;
extern   TCaptionButton         CaptionButton19;
extern   TCaptionButton         CaptionButton20;
extern   TCaptionButton         CaptionButton21;
extern   TCaptionButton         CaptionButton22;
extern   TCaptionButton         CaptionButton23;
extern   TCaptionButton         CaptionButton24;
extern   TCaptionButton         CaptionButton25;
extern   TCaptionButton         CaptionButton26;
extern   TImage                 Image1;
extern   TCaptionButton         CaptionButton27;
extern   TLabel                 Label7;
extern   TRectangle             Rectangle2;
extern   TCaptionButton_Round   RoundCaptionButton13;

extern   TScreen                Screen4;
extern   TCaptionButton_Round   RoundCaptionButton5;
extern   TLabel                 Label16;
extern   TLabel                 Label17;
extern   TLabel                 Label18;
extern   TLabel                 Label19;
extern   TLabel                 Label20;
extern   TLabel                 Label21;
extern   TLabel                 Label22;

extern   TScreen                Screen5;
extern   TCaptionButton_Round   RoundCaptionButton6;
extern   TCaptionButton_Round   RoundCaptionButton7;
extern   TCaptionButton_Round   RoundCaptionButton8;
extern   TCaptionButton_Round   RoundCaptionButton9;
extern   TLabel                 Label3;
extern   TLabel                 Label4;
extern   TLabel                 Label5;
extern   TCaptionButton_Round   RoundCaptionButton11;
extern   TCaptionButton_Round   RoundCaptionButton12;
extern   TCaptionButton_Round   RoundCaptionButton10;

extern   TScreen                Screen6;
extern   TCaptionButton         CaptionButton28;


/////////////////////////
// Events Code Declarations
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
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
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
/////////////////////////////////

void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *Alabel);
void DrawImage(TImage *Aimage);
void DrawCaptionButton(TCaptionButton *Acaption_button);
void DrawRoundCaptionButton(TCaptionButton_Round *Around_caption_button);
void DrawRectangle(TRectangle *Arectangle);
void Check_TP();
void Start_TP();