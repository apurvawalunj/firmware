#include "SmartGLCD_240x128_Demo_objects.h"

//--------------------- User code ---------------------//
extern sfr sbit BacklightRed;
extern sfr sbit BacklightGreen;
extern sfr sbit BacklightBlue;

char typed_letters[22] = "";
bit  is_backspace, is_caps;

void Key_pressed(char letter_pressed){
unsigned short text_length;
char res[2] = " ";

  if (is_caps != 1)
    letter_pressed = tolower(letter_pressed);
  
  text_length = strlen(typed_letters);
  if (text_length >= 21) {
    strcpy(Label7_Caption, "                      ");
    strcpy(typed_letters, "");
    DrawLabel(&Label7);
    return;
  }

  if (is_backspace == 1) {
    if (text_length > 0) {
      typed_letters[text_length-1] = 0;
      strcpy(Label7_Caption, "                      ");
      DrawLabel(&Label7);
    }
  }
  else {
    res[0] = letter_pressed;
    strcat(typed_letters, res);
  }
  
  strcpy(Label7_Caption, typed_letters);
  DrawLabel(&Label7);
}
//----------------- End of User code ------------------//

// Event Handlers
void RoundCaptionButton1Click() {
  DrawScreen(&Screen2);
}

void RoundCaptionButton2Click() {
  DrawScreen(&Screen4);     
}

void RoundCaptionButton3Click() {
  strcpy(typed_letters, "");
  is_backspace = 0;
  is_caps = 0;
  strcpy(RoundCaptionButton13_Caption, "CAPS: OFF");
  DrawScreen(&Screen3);
}

void RoundCaptionButton4Click() {
  strcpy(typed_letters, "");
  is_backspace = 0;
  strcpy(Label7_Caption, "");
  DrawScreen(&Screen1);
}

void CaptionButton1Click() {
  Key_pressed('Q');
}

void CaptionButton2Click() {
  Key_pressed('W');
}

void CaptionButton3Click() {
  Key_pressed('E');
}

void CaptionButton4Click() {
  Key_pressed('R');
}

void CaptionButton5Click() {
  Key_pressed('T');
}

void CaptionButton6Click() {
  Key_pressed('Y');
}

void CaptionButton7Click() {
  Key_pressed('U');
}

void CaptionButton8Click() {
  Key_pressed('I');
}

void CaptionButton9Click() {
  Key_pressed('O');
}

void CaptionButton10Click() {
  Key_pressed('P');
}

void CaptionButton11Click() {
  Key_pressed('A');
}

void CaptionButton12Click() {
  Key_pressed('S');
}

void CaptionButton13Click() {
  Key_pressed('D');
}

void CaptionButton14Click() {
  Key_pressed('F');
}

void CaptionButton15Click() {
  Key_pressed('G');
}

void CaptionButton16Click() {
  Key_pressed('H');
}

void CaptionButton17Click() {
  Key_pressed('J');
}

void CaptionButton18Click() {
  Key_pressed('K');
}

void CaptionButton19Click() {
  Key_pressed('L');
}

void CaptionButton20Click() {
  Key_pressed('Z');
}

void CaptionButton21Click() {
  Key_pressed('X');
}

void CaptionButton22Click() {
  Key_pressed('C');
}

void CaptionButton23Click() {
  Key_pressed('V');
}

void CaptionButton24Click() {
  Key_pressed('B');
}

void CaptionButton25Click() {
  Key_pressed('N');
}

void CaptionButton26Click() {
  Key_pressed('M');
}

void Image1Click() {
  is_backspace = 1;
  Key_pressed(0);
  is_backspace = 0;
}

void CaptionButton27Click() {
  Key_pressed(' ');
}

void RoundCaptionButton13Click() {
  // Caps
  is_caps = !is_caps;
  if (is_caps == 1) {
    strcpy(RoundCaptionButton13_Caption, "CAPS:  ON");
  }
  else if (is_caps == 0) {
    strcpy(RoundCaptionButton13_Caption, "CAPS: OFF");
  }

  DrawRoundCaptionButton(&RoundCaptionButton13);
}

void White(){
 RC2_bit = 0;
 RG0_bit = 0;
 RC1_bit = 0;
 T6963C_write_text("  WHITE   ", 10, 6, T6963C_ROM_MODE_XOR);
}

void Green(){
 RC2_bit = 1;
 RG0_bit = 1;
 RC1_bit = 0;
 T6963C_write_text("  GREEN     ", 10, 6, T6963C_ROM_MODE_XOR);
}

void Blue(){
 RC2_bit = 1;
 RG0_bit = 0;
 RC1_bit = 1;
 T6963C_write_text("  BLUE    ", 10, 6, T6963C_ROM_MODE_XOR);
}

void Turquoise(){
 RC2_bit = 1;
 RG0_bit = 0;
 RC1_bit = 0;
 T6963C_write_text("TURQUOISE     ", 10, 6, T6963C_ROM_MODE_XOR);
}


void Red(){
 RC2_bit = 0;
 RG0_bit = 1;
 RC1_bit = 1;
 T6963C_write_text("  RED       ", 10, 6, T6963C_ROM_MODE_XOR);
}

void Yellow(){
 RC2_bit = 0;
 RG0_bit = 1;
 RC1_bit = 0;
 T6963C_write_text(" YELLOW    ", 10, 6, T6963C_ROM_MODE_XOR);
}

void Purple(){
 RC2_bit = 0;
 RG0_bit = 0;
 RC1_bit = 1;
 T6963C_write_text(" PURPLE    ", 10, 6, T6963C_ROM_MODE_XOR);
}

void RoundCaptionButton14Click(){
  DrawScreen(&Screen6);
  Delay_ms(100);
  White();
  Delay_ms(1000);
  Green();
  Delay_ms(1000);
  Blue();
  Delay_ms(1000);
  Turquoise();
  Delay_ms(1000);
  Red();
  Delay_ms(1000);
  Yellow();
  Delay_ms(1000);
  Purple();
  Delay_ms(1000);
  RC2_bit = 0;
  RG0_bit = 0;
  RC1_bit = 0;
  CaptionButton28.Visible = 1;
  DrawScreen(&Screen6);
}



void RoundCaptionButton5Click() {
  DrawScreen(&Screen5);
}

void RoundCaptionButton6Click() {
  DrawScreen(&Screen1);
}

void RoundCaptionButton7Click() {
  // red
  BacklightRed = !BacklightRed;
  if (BacklightRed == 1) {
    strcpy(Label3_Caption, "OFF");
    }
  else if (BacklightRed == 0)
    strcpy(Label3_Caption, "ON ");

  DrawLabel(&Label3);
}

void RoundCaptionButton8Click() {
  // blue
  BacklightBlue = !BacklightBlue;
  if (BacklightBlue == 1) {
    strcpy(Label4_Caption, "OFF");
    }
  else if (BacklightBlue == 0)
    strcpy(Label4_Caption, "ON ");

  DrawLabel(&Label4);
}

void RoundCaptionButton9Click() {
  // green
  BacklightGreen = !BacklightGreen;
  if (BacklightGreen == 1) {
    strcpy(Label5_Caption, "OFF");
    }
  else if (BacklightGreen == 0)
    strcpy(Label5_Caption, "ON ");

  DrawLabel(&Label5);
}

void RoundCaptionButton11Click() {
  // switch everything to ON
  RC2_bit = 0;
  RG0_bit = 0;
  RC1_bit = 0;
  strcpy(Label3_Caption, "ON ");
  strcpy(Label4_Caption, "ON ");
  strcpy(Label5_Caption, "ON ");
  DrawLabel(&Label3);
  DrawLabel(&Label4);
  DrawLabel(&Label5);
}

void RoundCaptionButton12Click() {
  // Invert RGB
  // red
  BacklightRed = !BacklightRed;
  if (BacklightRed == 1) {
    strcpy(Label3_Caption, "OFF");
    }
  else if (BacklightRed == 0)
    strcpy(Label3_Caption, "ON ");

  // blue
  BacklightBlue = !BacklightBlue;
  if (BacklightBlue == 1) {
    strcpy(Label4_Caption, "OFF");
    }
  else if (BacklightBlue == 0)
    strcpy(Label4_Caption, "ON ");

  // green
  BacklightGreen = !BacklightGreen;
  if (BacklightGreen == 1) {
    strcpy(Label5_Caption, "OFF");
    }
  else if (BacklightGreen == 0)
    strcpy(Label5_Caption, "ON ");

  DrawLabel(&Label3);
  DrawLabel(&Label4);
  DrawLabel(&Label5);
}

void RoundCaptionButton10Click() {
  // switch everything to OFF
  BacklightBlue  = 1;
  BacklightRed   = 1;
  BacklightGreen = 1;
  
  strcpy(Label3_Caption, "OFF");
  strcpy(Label4_Caption, "OFF");
  strcpy(Label5_Caption, "OFF");
  DrawLabel(&Label3);
  DrawLabel(&Label4);
  DrawLabel(&Label5);
}

void CaptionButton28Click() {
  CaptionButton28.Visible = 0;
  DrawScreen(&Screen1);
}