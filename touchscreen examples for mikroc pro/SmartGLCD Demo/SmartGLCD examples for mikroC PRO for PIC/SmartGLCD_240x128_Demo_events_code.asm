
_Key_pressed:

;SmartGLCD_240x128_Demo_events_code.c,11 :: 		void Key_pressed(char letter_pressed){
;SmartGLCD_240x128_Demo_events_code.c,13 :: 		char res[2] = " ";
	MOVLW       32
	MOVWF       Key_pressed_res_L0+0 
	CLRF        Key_pressed_res_L0+1 
;SmartGLCD_240x128_Demo_events_code.c,15 :: 		if (is_caps != 1)
	BTFSC       _is_caps+0, BitPos(_is_caps+0) 
	GOTO        L_Key_pressed0
;SmartGLCD_240x128_Demo_events_code.c,16 :: 		letter_pressed = tolower(letter_pressed);
	MOVF        FARG_Key_pressed_letter_pressed+0, 0 
	MOVWF       FARG_tolower_character+0 
	CALL        _tolower+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Key_pressed_letter_pressed+0 
L_Key_pressed0:
;SmartGLCD_240x128_Demo_events_code.c,18 :: 		text_length = strlen(typed_letters);
	MOVLW       _typed_letters+0
	MOVWF       FARG_strlen_s+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strlen_s+1 
	CALL        _strlen+0, 0
	MOVF        R0, 0 
	MOVWF       Key_pressed_text_length_L0+0 
;SmartGLCD_240x128_Demo_events_code.c,19 :: 		if (text_length >= 21) {
	MOVLW       21
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_Key_pressed1
;SmartGLCD_240x128_Demo_events_code.c,20 :: 		strcpy(Label7_Caption, "                      ");
	MOVLW       _Label7_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label7_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr1_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr1_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,21 :: 		strcpy(typed_letters, "");
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr2_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr2_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,22 :: 		DrawLabel(&Label7);
	MOVLW       _Label7+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label7+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,23 :: 		return;
	GOTO        L_end_Key_pressed
;SmartGLCD_240x128_Demo_events_code.c,24 :: 		}
L_Key_pressed1:
;SmartGLCD_240x128_Demo_events_code.c,26 :: 		if (is_backspace == 1) {
	BTFSS       _is_backspace+0, BitPos(_is_backspace+0) 
	GOTO        L_Key_pressed2
;SmartGLCD_240x128_Demo_events_code.c,27 :: 		if (text_length > 0) {
	MOVF        Key_pressed_text_length_L0+0, 0 
	SUBLW       0
	BTFSC       STATUS+0, 0 
	GOTO        L_Key_pressed3
;SmartGLCD_240x128_Demo_events_code.c,28 :: 		typed_letters[text_length-1] = 0;
	DECF        Key_pressed_text_length_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _typed_letters+0
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_typed_letters+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;SmartGLCD_240x128_Demo_events_code.c,29 :: 		strcpy(Label7_Caption, "                      ");
	MOVLW       _Label7_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label7_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr3_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr3_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,30 :: 		DrawLabel(&Label7);
	MOVLW       _Label7+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label7+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,31 :: 		}
L_Key_pressed3:
;SmartGLCD_240x128_Demo_events_code.c,32 :: 		}
	GOTO        L_Key_pressed4
L_Key_pressed2:
;SmartGLCD_240x128_Demo_events_code.c,34 :: 		res[0] = letter_pressed;
	MOVF        FARG_Key_pressed_letter_pressed+0, 0 
	MOVWF       Key_pressed_res_L0+0 
;SmartGLCD_240x128_Demo_events_code.c,35 :: 		strcat(typed_letters, res);
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcat_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcat_to+1 
	MOVLW       Key_pressed_res_L0+0
	MOVWF       FARG_strcat_from+0 
	MOVLW       hi_addr(Key_pressed_res_L0+0)
	MOVWF       FARG_strcat_from+1 
	CALL        _strcat+0, 0
;SmartGLCD_240x128_Demo_events_code.c,36 :: 		}
L_Key_pressed4:
;SmartGLCD_240x128_Demo_events_code.c,38 :: 		strcpy(Label7_Caption, typed_letters);
	MOVLW       _Label7_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label7_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,39 :: 		DrawLabel(&Label7);
	MOVLW       _Label7+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label7+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,40 :: 		}
L_end_Key_pressed:
	RETURN      0
; end of _Key_pressed

_RoundCaptionButton1Click:

;SmartGLCD_240x128_Demo_events_code.c,44 :: 		void RoundCaptionButton1Click() {
;SmartGLCD_240x128_Demo_events_code.c,45 :: 		DrawScreen(&Screen2);
	MOVLW       _Screen2+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,46 :: 		}
L_end_RoundCaptionButton1Click:
	RETURN      0
; end of _RoundCaptionButton1Click

_RoundCaptionButton2Click:

;SmartGLCD_240x128_Demo_events_code.c,48 :: 		void RoundCaptionButton2Click() {
;SmartGLCD_240x128_Demo_events_code.c,49 :: 		DrawScreen(&Screen4);
	MOVLW       _Screen4+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,50 :: 		}
L_end_RoundCaptionButton2Click:
	RETURN      0
; end of _RoundCaptionButton2Click

_RoundCaptionButton3Click:

;SmartGLCD_240x128_Demo_events_code.c,52 :: 		void RoundCaptionButton3Click() {
;SmartGLCD_240x128_Demo_events_code.c,53 :: 		strcpy(typed_letters, "");
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr4_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr4_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,54 :: 		is_backspace = 0;
	BCF         _is_backspace+0, BitPos(_is_backspace+0) 
;SmartGLCD_240x128_Demo_events_code.c,55 :: 		is_caps = 0;
	BCF         _is_caps+0, BitPos(_is_caps+0) 
;SmartGLCD_240x128_Demo_events_code.c,56 :: 		strcpy(RoundCaptionButton13_Caption, "CAPS: OFF");
	MOVLW       _RoundCaptionButton13_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RoundCaptionButton13_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr5_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr5_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,57 :: 		DrawScreen(&Screen3);
	MOVLW       _Screen3+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,58 :: 		}
L_end_RoundCaptionButton3Click:
	RETURN      0
; end of _RoundCaptionButton3Click

_RoundCaptionButton4Click:

;SmartGLCD_240x128_Demo_events_code.c,60 :: 		void RoundCaptionButton4Click() {
;SmartGLCD_240x128_Demo_events_code.c,61 :: 		strcpy(typed_letters, "");
	MOVLW       _typed_letters+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_typed_letters+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr6_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr6_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,62 :: 		is_backspace = 0;
	BCF         _is_backspace+0, BitPos(_is_backspace+0) 
;SmartGLCD_240x128_Demo_events_code.c,63 :: 		strcpy(Label7_Caption, "");
	MOVLW       _Label7_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label7_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr7_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr7_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,64 :: 		DrawScreen(&Screen1);
	MOVLW       _Screen1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,65 :: 		}
L_end_RoundCaptionButton4Click:
	RETURN      0
; end of _RoundCaptionButton4Click

_CaptionButton1Click:

;SmartGLCD_240x128_Demo_events_code.c,67 :: 		void CaptionButton1Click() {
;SmartGLCD_240x128_Demo_events_code.c,68 :: 		Key_pressed('Q');
	MOVLW       81
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,69 :: 		}
L_end_CaptionButton1Click:
	RETURN      0
; end of _CaptionButton1Click

_CaptionButton2Click:

;SmartGLCD_240x128_Demo_events_code.c,71 :: 		void CaptionButton2Click() {
;SmartGLCD_240x128_Demo_events_code.c,72 :: 		Key_pressed('W');
	MOVLW       87
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,73 :: 		}
L_end_CaptionButton2Click:
	RETURN      0
; end of _CaptionButton2Click

_CaptionButton3Click:

;SmartGLCD_240x128_Demo_events_code.c,75 :: 		void CaptionButton3Click() {
;SmartGLCD_240x128_Demo_events_code.c,76 :: 		Key_pressed('E');
	MOVLW       69
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,77 :: 		}
L_end_CaptionButton3Click:
	RETURN      0
; end of _CaptionButton3Click

_CaptionButton4Click:

;SmartGLCD_240x128_Demo_events_code.c,79 :: 		void CaptionButton4Click() {
;SmartGLCD_240x128_Demo_events_code.c,80 :: 		Key_pressed('R');
	MOVLW       82
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,81 :: 		}
L_end_CaptionButton4Click:
	RETURN      0
; end of _CaptionButton4Click

_CaptionButton5Click:

;SmartGLCD_240x128_Demo_events_code.c,83 :: 		void CaptionButton5Click() {
;SmartGLCD_240x128_Demo_events_code.c,84 :: 		Key_pressed('T');
	MOVLW       84
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,85 :: 		}
L_end_CaptionButton5Click:
	RETURN      0
; end of _CaptionButton5Click

_CaptionButton6Click:

;SmartGLCD_240x128_Demo_events_code.c,87 :: 		void CaptionButton6Click() {
;SmartGLCD_240x128_Demo_events_code.c,88 :: 		Key_pressed('Y');
	MOVLW       89
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,89 :: 		}
L_end_CaptionButton6Click:
	RETURN      0
; end of _CaptionButton6Click

_CaptionButton7Click:

;SmartGLCD_240x128_Demo_events_code.c,91 :: 		void CaptionButton7Click() {
;SmartGLCD_240x128_Demo_events_code.c,92 :: 		Key_pressed('U');
	MOVLW       85
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,93 :: 		}
L_end_CaptionButton7Click:
	RETURN      0
; end of _CaptionButton7Click

_CaptionButton8Click:

;SmartGLCD_240x128_Demo_events_code.c,95 :: 		void CaptionButton8Click() {
;SmartGLCD_240x128_Demo_events_code.c,96 :: 		Key_pressed('I');
	MOVLW       73
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,97 :: 		}
L_end_CaptionButton8Click:
	RETURN      0
; end of _CaptionButton8Click

_CaptionButton9Click:

;SmartGLCD_240x128_Demo_events_code.c,99 :: 		void CaptionButton9Click() {
;SmartGLCD_240x128_Demo_events_code.c,100 :: 		Key_pressed('O');
	MOVLW       79
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,101 :: 		}
L_end_CaptionButton9Click:
	RETURN      0
; end of _CaptionButton9Click

_CaptionButton10Click:

;SmartGLCD_240x128_Demo_events_code.c,103 :: 		void CaptionButton10Click() {
;SmartGLCD_240x128_Demo_events_code.c,104 :: 		Key_pressed('P');
	MOVLW       80
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,105 :: 		}
L_end_CaptionButton10Click:
	RETURN      0
; end of _CaptionButton10Click

_CaptionButton11Click:

;SmartGLCD_240x128_Demo_events_code.c,107 :: 		void CaptionButton11Click() {
;SmartGLCD_240x128_Demo_events_code.c,108 :: 		Key_pressed('A');
	MOVLW       65
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,109 :: 		}
L_end_CaptionButton11Click:
	RETURN      0
; end of _CaptionButton11Click

_CaptionButton12Click:

;SmartGLCD_240x128_Demo_events_code.c,111 :: 		void CaptionButton12Click() {
;SmartGLCD_240x128_Demo_events_code.c,112 :: 		Key_pressed('S');
	MOVLW       83
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,113 :: 		}
L_end_CaptionButton12Click:
	RETURN      0
; end of _CaptionButton12Click

_CaptionButton13Click:

;SmartGLCD_240x128_Demo_events_code.c,115 :: 		void CaptionButton13Click() {
;SmartGLCD_240x128_Demo_events_code.c,116 :: 		Key_pressed('D');
	MOVLW       68
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,117 :: 		}
L_end_CaptionButton13Click:
	RETURN      0
; end of _CaptionButton13Click

_CaptionButton14Click:

;SmartGLCD_240x128_Demo_events_code.c,119 :: 		void CaptionButton14Click() {
;SmartGLCD_240x128_Demo_events_code.c,120 :: 		Key_pressed('F');
	MOVLW       70
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,121 :: 		}
L_end_CaptionButton14Click:
	RETURN      0
; end of _CaptionButton14Click

_CaptionButton15Click:

;SmartGLCD_240x128_Demo_events_code.c,123 :: 		void CaptionButton15Click() {
;SmartGLCD_240x128_Demo_events_code.c,124 :: 		Key_pressed('G');
	MOVLW       71
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,125 :: 		}
L_end_CaptionButton15Click:
	RETURN      0
; end of _CaptionButton15Click

_CaptionButton16Click:

;SmartGLCD_240x128_Demo_events_code.c,127 :: 		void CaptionButton16Click() {
;SmartGLCD_240x128_Demo_events_code.c,128 :: 		Key_pressed('H');
	MOVLW       72
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,129 :: 		}
L_end_CaptionButton16Click:
	RETURN      0
; end of _CaptionButton16Click

_CaptionButton17Click:

;SmartGLCD_240x128_Demo_events_code.c,131 :: 		void CaptionButton17Click() {
;SmartGLCD_240x128_Demo_events_code.c,132 :: 		Key_pressed('J');
	MOVLW       74
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,133 :: 		}
L_end_CaptionButton17Click:
	RETURN      0
; end of _CaptionButton17Click

_CaptionButton18Click:

;SmartGLCD_240x128_Demo_events_code.c,135 :: 		void CaptionButton18Click() {
;SmartGLCD_240x128_Demo_events_code.c,136 :: 		Key_pressed('K');
	MOVLW       75
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,137 :: 		}
L_end_CaptionButton18Click:
	RETURN      0
; end of _CaptionButton18Click

_CaptionButton19Click:

;SmartGLCD_240x128_Demo_events_code.c,139 :: 		void CaptionButton19Click() {
;SmartGLCD_240x128_Demo_events_code.c,140 :: 		Key_pressed('L');
	MOVLW       76
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,141 :: 		}
L_end_CaptionButton19Click:
	RETURN      0
; end of _CaptionButton19Click

_CaptionButton20Click:

;SmartGLCD_240x128_Demo_events_code.c,143 :: 		void CaptionButton20Click() {
;SmartGLCD_240x128_Demo_events_code.c,144 :: 		Key_pressed('Z');
	MOVLW       90
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,145 :: 		}
L_end_CaptionButton20Click:
	RETURN      0
; end of _CaptionButton20Click

_CaptionButton21Click:

;SmartGLCD_240x128_Demo_events_code.c,147 :: 		void CaptionButton21Click() {
;SmartGLCD_240x128_Demo_events_code.c,148 :: 		Key_pressed('X');
	MOVLW       88
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,149 :: 		}
L_end_CaptionButton21Click:
	RETURN      0
; end of _CaptionButton21Click

_CaptionButton22Click:

;SmartGLCD_240x128_Demo_events_code.c,151 :: 		void CaptionButton22Click() {
;SmartGLCD_240x128_Demo_events_code.c,152 :: 		Key_pressed('C');
	MOVLW       67
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,153 :: 		}
L_end_CaptionButton22Click:
	RETURN      0
; end of _CaptionButton22Click

_CaptionButton23Click:

;SmartGLCD_240x128_Demo_events_code.c,155 :: 		void CaptionButton23Click() {
;SmartGLCD_240x128_Demo_events_code.c,156 :: 		Key_pressed('V');
	MOVLW       86
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,157 :: 		}
L_end_CaptionButton23Click:
	RETURN      0
; end of _CaptionButton23Click

_CaptionButton24Click:

;SmartGLCD_240x128_Demo_events_code.c,159 :: 		void CaptionButton24Click() {
;SmartGLCD_240x128_Demo_events_code.c,160 :: 		Key_pressed('B');
	MOVLW       66
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,161 :: 		}
L_end_CaptionButton24Click:
	RETURN      0
; end of _CaptionButton24Click

_CaptionButton25Click:

;SmartGLCD_240x128_Demo_events_code.c,163 :: 		void CaptionButton25Click() {
;SmartGLCD_240x128_Demo_events_code.c,164 :: 		Key_pressed('N');
	MOVLW       78
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,165 :: 		}
L_end_CaptionButton25Click:
	RETURN      0
; end of _CaptionButton25Click

_CaptionButton26Click:

;SmartGLCD_240x128_Demo_events_code.c,167 :: 		void CaptionButton26Click() {
;SmartGLCD_240x128_Demo_events_code.c,168 :: 		Key_pressed('M');
	MOVLW       77
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,169 :: 		}
L_end_CaptionButton26Click:
	RETURN      0
; end of _CaptionButton26Click

_Image1Click:

;SmartGLCD_240x128_Demo_events_code.c,171 :: 		void Image1Click() {
;SmartGLCD_240x128_Demo_events_code.c,172 :: 		is_backspace = 1;
	BSF         _is_backspace+0, BitPos(_is_backspace+0) 
;SmartGLCD_240x128_Demo_events_code.c,173 :: 		Key_pressed(0);
	CLRF        FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,174 :: 		is_backspace = 0;
	BCF         _is_backspace+0, BitPos(_is_backspace+0) 
;SmartGLCD_240x128_Demo_events_code.c,175 :: 		}
L_end_Image1Click:
	RETURN      0
; end of _Image1Click

_CaptionButton27Click:

;SmartGLCD_240x128_Demo_events_code.c,177 :: 		void CaptionButton27Click() {
;SmartGLCD_240x128_Demo_events_code.c,178 :: 		Key_pressed(' ');
	MOVLW       32
	MOVWF       FARG_Key_pressed_letter_pressed+0 
	CALL        _Key_pressed+0, 0
;SmartGLCD_240x128_Demo_events_code.c,179 :: 		}
L_end_CaptionButton27Click:
	RETURN      0
; end of _CaptionButton27Click

_RoundCaptionButton13Click:

;SmartGLCD_240x128_Demo_events_code.c,181 :: 		void RoundCaptionButton13Click() {
;SmartGLCD_240x128_Demo_events_code.c,183 :: 		is_caps = !is_caps;
	BTG         _is_caps+0, BitPos(_is_caps+0) 
;SmartGLCD_240x128_Demo_events_code.c,184 :: 		if (is_caps == 1) {
	BTFSS       _is_caps+0, BitPos(_is_caps+0) 
	GOTO        L_RoundCaptionButton13Click5
;SmartGLCD_240x128_Demo_events_code.c,185 :: 		strcpy(RoundCaptionButton13_Caption, "CAPS:  ON");
	MOVLW       _RoundCaptionButton13_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RoundCaptionButton13_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr8_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr8_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,186 :: 		}
	GOTO        L_RoundCaptionButton13Click6
L_RoundCaptionButton13Click5:
;SmartGLCD_240x128_Demo_events_code.c,187 :: 		else if (is_caps == 0) {
	BTFSC       _is_caps+0, BitPos(_is_caps+0) 
	GOTO        L_RoundCaptionButton13Click7
;SmartGLCD_240x128_Demo_events_code.c,188 :: 		strcpy(RoundCaptionButton13_Caption, "CAPS: OFF");
	MOVLW       _RoundCaptionButton13_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_RoundCaptionButton13_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr9_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr9_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,189 :: 		}
L_RoundCaptionButton13Click7:
L_RoundCaptionButton13Click6:
;SmartGLCD_240x128_Demo_events_code.c,191 :: 		DrawRoundCaptionButton(&RoundCaptionButton13);
	MOVLW       _RoundCaptionButton13+0
	MOVWF       FARG_DrawRoundCaptionButton_Around_caption_button+0 
	MOVLW       hi_addr(_RoundCaptionButton13+0)
	MOVWF       FARG_DrawRoundCaptionButton_Around_caption_button+1 
	CALL        _DrawRoundCaptionButton+0, 0
;SmartGLCD_240x128_Demo_events_code.c,192 :: 		}
L_end_RoundCaptionButton13Click:
	RETURN      0
; end of _RoundCaptionButton13Click

_White:

;SmartGLCD_240x128_Demo_events_code.c,194 :: 		void White(){
;SmartGLCD_240x128_Demo_events_code.c,195 :: 		RC2_bit = 0;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,196 :: 		RG0_bit = 0;
	BCF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,197 :: 		RC1_bit = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,198 :: 		T6963C_write_text("  WHITE   ", 10, 6, T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr10_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr10_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       10
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_events_code.c,199 :: 		}
L_end_White:
	RETURN      0
; end of _White

_Green:

;SmartGLCD_240x128_Demo_events_code.c,201 :: 		void Green(){
;SmartGLCD_240x128_Demo_events_code.c,202 :: 		RC2_bit = 1;
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,203 :: 		RG0_bit = 1;
	BSF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,204 :: 		RC1_bit = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,205 :: 		T6963C_write_text("  GREEN     ", 10, 6, T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr11_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr11_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       10
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_events_code.c,206 :: 		}
L_end_Green:
	RETURN      0
; end of _Green

_Blue:

;SmartGLCD_240x128_Demo_events_code.c,208 :: 		void Blue(){
;SmartGLCD_240x128_Demo_events_code.c,209 :: 		RC2_bit = 1;
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,210 :: 		RG0_bit = 0;
	BCF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,211 :: 		RC1_bit = 1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,212 :: 		T6963C_write_text("  BLUE    ", 10, 6, T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr12_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr12_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       10
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_events_code.c,213 :: 		}
L_end_Blue:
	RETURN      0
; end of _Blue

_Turquoise:

;SmartGLCD_240x128_Demo_events_code.c,215 :: 		void Turquoise(){
;SmartGLCD_240x128_Demo_events_code.c,216 :: 		RC2_bit = 1;
	BSF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,217 :: 		RG0_bit = 0;
	BCF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,218 :: 		RC1_bit = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,219 :: 		T6963C_write_text("TURQUOISE     ", 10, 6, T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr13_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr13_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       10
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_events_code.c,220 :: 		}
L_end_Turquoise:
	RETURN      0
; end of _Turquoise

_Red:

;SmartGLCD_240x128_Demo_events_code.c,223 :: 		void Red(){
;SmartGLCD_240x128_Demo_events_code.c,224 :: 		RC2_bit = 0;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,225 :: 		RG0_bit = 1;
	BSF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,226 :: 		RC1_bit = 1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,227 :: 		T6963C_write_text("  RED       ", 10, 6, T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr14_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr14_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       10
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_events_code.c,228 :: 		}
L_end_Red:
	RETURN      0
; end of _Red

_Yellow:

;SmartGLCD_240x128_Demo_events_code.c,230 :: 		void Yellow(){
;SmartGLCD_240x128_Demo_events_code.c,231 :: 		RC2_bit = 0;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,232 :: 		RG0_bit = 1;
	BSF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,233 :: 		RC1_bit = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,234 :: 		T6963C_write_text(" YELLOW    ", 10, 6, T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr15_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr15_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       10
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_events_code.c,235 :: 		}
L_end_Yellow:
	RETURN      0
; end of _Yellow

_Purple:

;SmartGLCD_240x128_Demo_events_code.c,237 :: 		void Purple(){
;SmartGLCD_240x128_Demo_events_code.c,238 :: 		RC2_bit = 0;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,239 :: 		RG0_bit = 0;
	BCF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,240 :: 		RC1_bit = 1;
	BSF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,241 :: 		T6963C_write_text(" PURPLE    ", 10, 6, T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr16_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr16_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       10
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_events_code.c,242 :: 		}
L_end_Purple:
	RETURN      0
; end of _Purple

_RoundCaptionButton14Click:

;SmartGLCD_240x128_Demo_events_code.c,244 :: 		void RoundCaptionButton14Click(){
;SmartGLCD_240x128_Demo_events_code.c,245 :: 		DrawScreen(&Screen6);
	MOVLW       _Screen6+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen6+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,246 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_RoundCaptionButton14Click8:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click8
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click8
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click8
	NOP
;SmartGLCD_240x128_Demo_events_code.c,247 :: 		White();
	CALL        _White+0, 0
;SmartGLCD_240x128_Demo_events_code.c,248 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_RoundCaptionButton14Click9:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click9
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click9
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click9
	NOP
	NOP
;SmartGLCD_240x128_Demo_events_code.c,249 :: 		Green();
	CALL        _Green+0, 0
;SmartGLCD_240x128_Demo_events_code.c,250 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_RoundCaptionButton14Click10:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click10
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click10
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click10
	NOP
	NOP
;SmartGLCD_240x128_Demo_events_code.c,251 :: 		Blue();
	CALL        _Blue+0, 0
;SmartGLCD_240x128_Demo_events_code.c,252 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_RoundCaptionButton14Click11:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click11
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click11
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click11
	NOP
	NOP
;SmartGLCD_240x128_Demo_events_code.c,253 :: 		Turquoise();
	CALL        _Turquoise+0, 0
;SmartGLCD_240x128_Demo_events_code.c,254 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_RoundCaptionButton14Click12:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click12
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click12
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click12
	NOP
	NOP
;SmartGLCD_240x128_Demo_events_code.c,255 :: 		Red();
	CALL        _Red+0, 0
;SmartGLCD_240x128_Demo_events_code.c,256 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_RoundCaptionButton14Click13:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click13
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click13
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click13
	NOP
	NOP
;SmartGLCD_240x128_Demo_events_code.c,257 :: 		Yellow();
	CALL        _Yellow+0, 0
;SmartGLCD_240x128_Demo_events_code.c,258 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_RoundCaptionButton14Click14:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click14
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click14
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click14
	NOP
	NOP
;SmartGLCD_240x128_Demo_events_code.c,259 :: 		Purple();
	CALL        _Purple+0, 0
;SmartGLCD_240x128_Demo_events_code.c,260 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_RoundCaptionButton14Click15:
	DECFSZ      R13, 1, 1
	BRA         L_RoundCaptionButton14Click15
	DECFSZ      R12, 1, 1
	BRA         L_RoundCaptionButton14Click15
	DECFSZ      R11, 1, 1
	BRA         L_RoundCaptionButton14Click15
	NOP
	NOP
;SmartGLCD_240x128_Demo_events_code.c,261 :: 		RC2_bit = 0;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,262 :: 		RG0_bit = 0;
	BCF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,263 :: 		RC1_bit = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,264 :: 		CaptionButton28.Visible = 1;
	MOVLW       1
	MOVWF       _CaptionButton28+16 
;SmartGLCD_240x128_Demo_events_code.c,265 :: 		DrawScreen(&Screen6);
	MOVLW       _Screen6+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen6+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,266 :: 		}
L_end_RoundCaptionButton14Click:
	RETURN      0
; end of _RoundCaptionButton14Click

_RoundCaptionButton5Click:

;SmartGLCD_240x128_Demo_events_code.c,270 :: 		void RoundCaptionButton5Click() {
;SmartGLCD_240x128_Demo_events_code.c,271 :: 		DrawScreen(&Screen5);
	MOVLW       _Screen5+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,272 :: 		}
L_end_RoundCaptionButton5Click:
	RETURN      0
; end of _RoundCaptionButton5Click

_RoundCaptionButton6Click:

;SmartGLCD_240x128_Demo_events_code.c,274 :: 		void RoundCaptionButton6Click() {
;SmartGLCD_240x128_Demo_events_code.c,275 :: 		DrawScreen(&Screen1);
	MOVLW       _Screen1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,276 :: 		}
L_end_RoundCaptionButton6Click:
	RETURN      0
; end of _RoundCaptionButton6Click

_RoundCaptionButton7Click:

;SmartGLCD_240x128_Demo_events_code.c,278 :: 		void RoundCaptionButton7Click() {
;SmartGLCD_240x128_Demo_events_code.c,280 :: 		BacklightRed = !BacklightRed;
	BTG         BacklightRed+0, BitPos(BacklightRed+0) 
;SmartGLCD_240x128_Demo_events_code.c,281 :: 		if (BacklightRed == 1) {
	BTFSS       BacklightRed+0, BitPos(BacklightRed+0) 
	GOTO        L_RoundCaptionButton7Click16
;SmartGLCD_240x128_Demo_events_code.c,282 :: 		strcpy(Label3_Caption, "OFF");
	MOVLW       _Label3_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr17_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr17_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,283 :: 		}
	GOTO        L_RoundCaptionButton7Click17
L_RoundCaptionButton7Click16:
;SmartGLCD_240x128_Demo_events_code.c,284 :: 		else if (BacklightRed == 0)
	BTFSC       BacklightRed+0, BitPos(BacklightRed+0) 
	GOTO        L_RoundCaptionButton7Click18
;SmartGLCD_240x128_Demo_events_code.c,285 :: 		strcpy(Label3_Caption, "ON ");
	MOVLW       _Label3_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr18_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr18_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_RoundCaptionButton7Click18:
L_RoundCaptionButton7Click17:
;SmartGLCD_240x128_Demo_events_code.c,287 :: 		DrawLabel(&Label3);
	MOVLW       _Label3+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label3+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,288 :: 		}
L_end_RoundCaptionButton7Click:
	RETURN      0
; end of _RoundCaptionButton7Click

_RoundCaptionButton8Click:

;SmartGLCD_240x128_Demo_events_code.c,290 :: 		void RoundCaptionButton8Click() {
;SmartGLCD_240x128_Demo_events_code.c,292 :: 		BacklightBlue = !BacklightBlue;
	BTG         BacklightBlue+0, BitPos(BacklightBlue+0) 
;SmartGLCD_240x128_Demo_events_code.c,293 :: 		if (BacklightBlue == 1) {
	BTFSS       BacklightBlue+0, BitPos(BacklightBlue+0) 
	GOTO        L_RoundCaptionButton8Click19
;SmartGLCD_240x128_Demo_events_code.c,294 :: 		strcpy(Label4_Caption, "OFF");
	MOVLW       _Label4_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr19_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr19_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,295 :: 		}
	GOTO        L_RoundCaptionButton8Click20
L_RoundCaptionButton8Click19:
;SmartGLCD_240x128_Demo_events_code.c,296 :: 		else if (BacklightBlue == 0)
	BTFSC       BacklightBlue+0, BitPos(BacklightBlue+0) 
	GOTO        L_RoundCaptionButton8Click21
;SmartGLCD_240x128_Demo_events_code.c,297 :: 		strcpy(Label4_Caption, "ON ");
	MOVLW       _Label4_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr20_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr20_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_RoundCaptionButton8Click21:
L_RoundCaptionButton8Click20:
;SmartGLCD_240x128_Demo_events_code.c,299 :: 		DrawLabel(&Label4);
	MOVLW       _Label4+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label4+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,300 :: 		}
L_end_RoundCaptionButton8Click:
	RETURN      0
; end of _RoundCaptionButton8Click

_RoundCaptionButton9Click:

;SmartGLCD_240x128_Demo_events_code.c,302 :: 		void RoundCaptionButton9Click() {
;SmartGLCD_240x128_Demo_events_code.c,304 :: 		BacklightGreen = !BacklightGreen;
	BTG         BacklightGreen+0, BitPos(BacklightGreen+0) 
;SmartGLCD_240x128_Demo_events_code.c,305 :: 		if (BacklightGreen == 1) {
	BTFSS       BacklightGreen+0, BitPos(BacklightGreen+0) 
	GOTO        L_RoundCaptionButton9Click22
;SmartGLCD_240x128_Demo_events_code.c,306 :: 		strcpy(Label5_Caption, "OFF");
	MOVLW       _Label5_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr21_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr21_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,307 :: 		}
	GOTO        L_RoundCaptionButton9Click23
L_RoundCaptionButton9Click22:
;SmartGLCD_240x128_Demo_events_code.c,308 :: 		else if (BacklightGreen == 0)
	BTFSC       BacklightGreen+0, BitPos(BacklightGreen+0) 
	GOTO        L_RoundCaptionButton9Click24
;SmartGLCD_240x128_Demo_events_code.c,309 :: 		strcpy(Label5_Caption, "ON ");
	MOVLW       _Label5_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr22_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr22_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_RoundCaptionButton9Click24:
L_RoundCaptionButton9Click23:
;SmartGLCD_240x128_Demo_events_code.c,311 :: 		DrawLabel(&Label5);
	MOVLW       _Label5+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label5+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,312 :: 		}
L_end_RoundCaptionButton9Click:
	RETURN      0
; end of _RoundCaptionButton9Click

_RoundCaptionButton11Click:

;SmartGLCD_240x128_Demo_events_code.c,314 :: 		void RoundCaptionButton11Click() {
;SmartGLCD_240x128_Demo_events_code.c,316 :: 		RC2_bit = 0;
	BCF         RC2_bit+0, BitPos(RC2_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,317 :: 		RG0_bit = 0;
	BCF         RG0_bit+0, BitPos(RG0_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,318 :: 		RC1_bit = 0;
	BCF         RC1_bit+0, BitPos(RC1_bit+0) 
;SmartGLCD_240x128_Demo_events_code.c,319 :: 		strcpy(Label3_Caption, "ON ");
	MOVLW       _Label3_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr23_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr23_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,320 :: 		strcpy(Label4_Caption, "ON ");
	MOVLW       _Label4_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr24_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr24_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,321 :: 		strcpy(Label5_Caption, "ON ");
	MOVLW       _Label5_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr25_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr25_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,322 :: 		DrawLabel(&Label3);
	MOVLW       _Label3+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label3+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,323 :: 		DrawLabel(&Label4);
	MOVLW       _Label4+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label4+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,324 :: 		DrawLabel(&Label5);
	MOVLW       _Label5+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label5+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,325 :: 		}
L_end_RoundCaptionButton11Click:
	RETURN      0
; end of _RoundCaptionButton11Click

_RoundCaptionButton12Click:

;SmartGLCD_240x128_Demo_events_code.c,327 :: 		void RoundCaptionButton12Click() {
;SmartGLCD_240x128_Demo_events_code.c,330 :: 		BacklightRed = !BacklightRed;
	BTG         BacklightRed+0, BitPos(BacklightRed+0) 
;SmartGLCD_240x128_Demo_events_code.c,331 :: 		if (BacklightRed == 1) {
	BTFSS       BacklightRed+0, BitPos(BacklightRed+0) 
	GOTO        L_RoundCaptionButton12Click25
;SmartGLCD_240x128_Demo_events_code.c,332 :: 		strcpy(Label3_Caption, "OFF");
	MOVLW       _Label3_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr26_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr26_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,333 :: 		}
	GOTO        L_RoundCaptionButton12Click26
L_RoundCaptionButton12Click25:
;SmartGLCD_240x128_Demo_events_code.c,334 :: 		else if (BacklightRed == 0)
	BTFSC       BacklightRed+0, BitPos(BacklightRed+0) 
	GOTO        L_RoundCaptionButton12Click27
;SmartGLCD_240x128_Demo_events_code.c,335 :: 		strcpy(Label3_Caption, "ON ");
	MOVLW       _Label3_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr27_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr27_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_RoundCaptionButton12Click27:
L_RoundCaptionButton12Click26:
;SmartGLCD_240x128_Demo_events_code.c,338 :: 		BacklightBlue = !BacklightBlue;
	BTG         BacklightBlue+0, BitPos(BacklightBlue+0) 
;SmartGLCD_240x128_Demo_events_code.c,339 :: 		if (BacklightBlue == 1) {
	BTFSS       BacklightBlue+0, BitPos(BacklightBlue+0) 
	GOTO        L_RoundCaptionButton12Click28
;SmartGLCD_240x128_Demo_events_code.c,340 :: 		strcpy(Label4_Caption, "OFF");
	MOVLW       _Label4_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr28_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr28_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,341 :: 		}
	GOTO        L_RoundCaptionButton12Click29
L_RoundCaptionButton12Click28:
;SmartGLCD_240x128_Demo_events_code.c,342 :: 		else if (BacklightBlue == 0)
	BTFSC       BacklightBlue+0, BitPos(BacklightBlue+0) 
	GOTO        L_RoundCaptionButton12Click30
;SmartGLCD_240x128_Demo_events_code.c,343 :: 		strcpy(Label4_Caption, "ON ");
	MOVLW       _Label4_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr29_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr29_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_RoundCaptionButton12Click30:
L_RoundCaptionButton12Click29:
;SmartGLCD_240x128_Demo_events_code.c,346 :: 		BacklightGreen = !BacklightGreen;
	BTG         BacklightGreen+0, BitPos(BacklightGreen+0) 
;SmartGLCD_240x128_Demo_events_code.c,347 :: 		if (BacklightGreen == 1) {
	BTFSS       BacklightGreen+0, BitPos(BacklightGreen+0) 
	GOTO        L_RoundCaptionButton12Click31
;SmartGLCD_240x128_Demo_events_code.c,348 :: 		strcpy(Label5_Caption, "OFF");
	MOVLW       _Label5_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr30_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr30_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,349 :: 		}
	GOTO        L_RoundCaptionButton12Click32
L_RoundCaptionButton12Click31:
;SmartGLCD_240x128_Demo_events_code.c,350 :: 		else if (BacklightGreen == 0)
	BTFSC       BacklightGreen+0, BitPos(BacklightGreen+0) 
	GOTO        L_RoundCaptionButton12Click33
;SmartGLCD_240x128_Demo_events_code.c,351 :: 		strcpy(Label5_Caption, "ON ");
	MOVLW       _Label5_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr31_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr31_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
L_RoundCaptionButton12Click33:
L_RoundCaptionButton12Click32:
;SmartGLCD_240x128_Demo_events_code.c,353 :: 		DrawLabel(&Label3);
	MOVLW       _Label3+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label3+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,354 :: 		DrawLabel(&Label4);
	MOVLW       _Label4+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label4+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,355 :: 		DrawLabel(&Label5);
	MOVLW       _Label5+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label5+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,356 :: 		}
L_end_RoundCaptionButton12Click:
	RETURN      0
; end of _RoundCaptionButton12Click

_RoundCaptionButton10Click:

;SmartGLCD_240x128_Demo_events_code.c,358 :: 		void RoundCaptionButton10Click() {
;SmartGLCD_240x128_Demo_events_code.c,360 :: 		BacklightBlue  = 1;
	BSF         BacklightBlue+0, BitPos(BacklightBlue+0) 
;SmartGLCD_240x128_Demo_events_code.c,361 :: 		BacklightRed   = 1;
	BSF         BacklightRed+0, BitPos(BacklightRed+0) 
;SmartGLCD_240x128_Demo_events_code.c,362 :: 		BacklightGreen = 1;
	BSF         BacklightGreen+0, BitPos(BacklightGreen+0) 
;SmartGLCD_240x128_Demo_events_code.c,364 :: 		strcpy(Label3_Caption, "OFF");
	MOVLW       _Label3_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr32_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr32_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,365 :: 		strcpy(Label4_Caption, "OFF");
	MOVLW       _Label4_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr33_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr33_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,366 :: 		strcpy(Label5_Caption, "OFF");
	MOVLW       _Label5_Caption+0
	MOVWF       FARG_strcpy_to+0 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       FARG_strcpy_to+1 
	MOVLW       ?lstr34_SmartGLCD_240x128_Demo_events_code+0
	MOVWF       FARG_strcpy_from+0 
	MOVLW       hi_addr(?lstr34_SmartGLCD_240x128_Demo_events_code+0)
	MOVWF       FARG_strcpy_from+1 
	CALL        _strcpy+0, 0
;SmartGLCD_240x128_Demo_events_code.c,367 :: 		DrawLabel(&Label3);
	MOVLW       _Label3+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label3+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,368 :: 		DrawLabel(&Label4);
	MOVLW       _Label4+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label4+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,369 :: 		DrawLabel(&Label5);
	MOVLW       _Label5+0
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVLW       hi_addr(_Label5+0)
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_events_code.c,370 :: 		}
L_end_RoundCaptionButton10Click:
	RETURN      0
; end of _RoundCaptionButton10Click

_CaptionButton28Click:

;SmartGLCD_240x128_Demo_events_code.c,372 :: 		void CaptionButton28Click() {
;SmartGLCD_240x128_Demo_events_code.c,373 :: 		CaptionButton28.Visible = 0;
	CLRF        _CaptionButton28+16 
;SmartGLCD_240x128_Demo_events_code.c,374 :: 		DrawScreen(&Screen1);
	MOVLW       _Screen1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_events_code.c,375 :: 		}
L_end_CaptionButton28Click:
	RETURN      0
; end of _CaptionButton28Click
