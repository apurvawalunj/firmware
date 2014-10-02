
_Calibrate:

;SmartGLCD.c,68 :: 		void Calibrate() {
;SmartGLCD.c,70 :: 		T6963C_box(0,126,1,127, T6963C_WHITE);
	CLRF        FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	MOVLW       126
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       1
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       127
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,71 :: 		T6963C_write_text("TOUCH BOTTOM LEFT", 6, 6, 1);
	MOVLW       ?lstr1_SmartGLCD+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr1_SmartGLCD+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       1
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,73 :: 		TP_Calibrate_Bottom_Left();
	CALL        _TP_Calibrate_Bottom_Left+0, 0
;SmartGLCD.c,74 :: 		Delay_ms(700);
	MOVLW       43
	MOVWF       R11, 0
	MOVLW       157
	MOVWF       R12, 0
	MOVLW       249
	MOVWF       R13, 0
L_Calibrate0:
	DECFSZ      R13, 1, 1
	BRA         L_Calibrate0
	DECFSZ      R12, 1, 1
	BRA         L_Calibrate0
	DECFSZ      R11, 1, 1
	BRA         L_Calibrate0
;SmartGLCD.c,76 :: 		T6963C_panelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD.c,77 :: 		T6963C_box(238, 1, 240, 0,T6963C_WHITE);
	MOVLW       238
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       1
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
	MOVLW       240
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	CLRF        FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,78 :: 		T6963C_write_text("TOUCH UPPER RIGHT", 6, 6, 1);
	MOVLW       ?lstr2_SmartGLCD+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr2_SmartGLCD+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       1
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,80 :: 		TP_Calibrate_Upper_Right();
	CALL        _TP_Calibrate_Upper_Right+0, 0
;SmartGLCD.c,81 :: 		Delay_ms(1500);
	MOVLW       92
	MOVWF       R11, 0
	MOVLW       81
	MOVWF       R12, 0
	MOVLW       96
	MOVWF       R13, 0
L_Calibrate1:
	DECFSZ      R13, 1, 1
	BRA         L_Calibrate1
	DECFSZ      R12, 1, 1
	BRA         L_Calibrate1
	DECFSZ      R11, 1, 1
	BRA         L_Calibrate1
	NOP
;SmartGLCD.c,82 :: 		}
L_end_Calibrate:
	RETURN      0
; end of _Calibrate

_main:

;SmartGLCD.c,84 :: 		void main() {
;SmartGLCD.c,85 :: 		ANCON0 = 0;
	CLRF        ANCON0+0 
;SmartGLCD.c,86 :: 		ANCON1 = 0;
	CLRF        ANCON1+0 
;SmartGLCD.c,87 :: 		ANCON2 = 0;
	CLRF        ANCON2+0 
;SmartGLCD.c,89 :: 		ANCON0.B0 = 1;            // Configure RA0 pin as analog
	BSF         ANCON0+0, 0 
;SmartGLCD.c,90 :: 		ANCON0.B1 = 1;            // Configure RA1 pin as analog
	BSF         ANCON0+0, 1 
;SmartGLCD.c,92 :: 		TRISA.B0 = 1;             // Set RA0 pin as input
	BSF         TRISA+0, 0 
;SmartGLCD.c,93 :: 		TRISA.B1 = 1;             // Set RA1 pin as input
	BSF         TRISA+0, 1 
;SmartGLCD.c,95 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;SmartGLCD.c,96 :: 		T6963C_ctrlce_Direction = 0;
	BCF         TRISJ3_bit+0, BitPos(TRISJ3_bit+0) 
;SmartGLCD.c,97 :: 		T6963C_ctrlce = 0;            // Enable T6963C
	BCF         LATJ3_bit+0, BitPos(LATJ3_bit+0) 
;SmartGLCD.c,98 :: 		T6963C_ctrlmd_Direction = 0;
	BCF         TRISJ5_bit+0, BitPos(TRISJ5_bit+0) 
;SmartGLCD.c,99 :: 		T6963C_ctrlmd = 0;            // Column number select
	BCF         LATJ5_bit+0, BitPos(LATJ5_bit+0) 
;SmartGLCD.c,100 :: 		T6963C_ctrlfs_Direction = 0;
	BCF         TRISJ6_bit+0, BitPos(TRISJ6_bit+0) 
;SmartGLCD.c,101 :: 		T6963C_ctrlfs = 0;            // Wide Font
	BCF         LATJ6_bit+0, BitPos(LATJ6_bit+0) 
;SmartGLCD.c,103 :: 		BacklightRed_Direction   = 0; // Set backlight signals as outputs
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;SmartGLCD.c,104 :: 		BacklightGreen_Direction = 0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;SmartGLCD.c,105 :: 		BacklightBlue_Direction  = 0;
	BCF         TRISG0_bit+0, BitPos(TRISG0_bit+0) 
;SmartGLCD.c,106 :: 		BacklightRed   = 0;           // Turn on Red component of back light
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;SmartGLCD.c,107 :: 		BacklightGreen = 0;           // Turn on Green component of back light
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;SmartGLCD.c,108 :: 		BacklightBlue  = 0;           // Turn on Blue component of back light
	BCF         LATG0_bit+0, BitPos(LATG0_bit+0) 
;SmartGLCD.c,111 :: 		T6963C_init(240, 128, 8);
	MOVLW       240
	MOVWF       FARG_T6963C_init_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_init_width+1 
	MOVLW       128
	MOVWF       FARG_T6963C_init_height+0 
	MOVLW       8
	MOVWF       FARG_T6963C_init_fntW+0 
	CALL        _T6963C_init+0, 0
;SmartGLCD.c,112 :: 		T6963C_graphics(1);
	BSF         _T6963C_display+0, 3 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD.c,113 :: 		T6963C_text(1);
	BSF         _T6963C_display+0, 2 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD.c,114 :: 		T6963C_cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD.c,116 :: 		TP_Init(240, 128, 0, 1);      // Initialize touch panel
	MOVLW       240
	MOVWF       FARG_TP_Init_display_width+0 
	MOVLW       0
	MOVWF       FARG_TP_Init_display_width+1 
	MOVLW       128
	MOVWF       FARG_TP_Init_display_height+0 
	MOVLW       0
	MOVWF       FARG_TP_Init_display_height+1 
	CLRF        FARG_TP_Init_readX_ChNo+0 
	MOVLW       1
	MOVWF       FARG_TP_Init_readY_ChNo+0 
	CALL        _TP_Init+0, 0
;SmartGLCD.c,117 :: 		TP_Set_ADC_Threshold(500);    // Set touch panel ADC threshold
	MOVLW       244
	MOVWF       FARG_TP_Set_ADC_Threshold_threshold+0 
	MOVLW       1
	MOVWF       FARG_TP_Set_ADC_Threshold_threshold+1 
	CALL        _TP_Set_ADC_Threshold+0, 0
;SmartGLCD.c,119 :: 		T6963C_graphics(1);
	BSF         _T6963C_display+0, 3 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD.c,120 :: 		T6963C_text(1);
	BSF         _T6963C_display+0, 2 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD.c,122 :: 		T6963C_panelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD.c,123 :: 		T6963C_write_text("CALIBRATION", 8, 6, 1);
	MOVLW       ?lstr3_SmartGLCD+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr3_SmartGLCD+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       8
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       1
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,124 :: 		Delay_ms(2000);
	MOVLW       122
	MOVWF       R11, 0
	MOVLW       193
	MOVWF       R12, 0
	MOVLW       129
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;SmartGLCD.c,126 :: 		T6963C_panelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD.c,127 :: 		Calibrate();
	CALL        _Calibrate+0, 0
;SmartGLCD.c,128 :: 		T6963C_panelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD.c,130 :: 		T6963C_write_text("WRITE ON SCREEN", 7, 6, 1) ;
	MOVLW       ?lstr4_SmartGLCD+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr4_SmartGLCD+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       7
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       6
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       1
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,131 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;SmartGLCD.c,132 :: 		T6963C_panelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD.c,135 :: 		T6963C_box(0,0,42,7,T6963C_WHITE);
	CLRF        FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       42
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,136 :: 		T6963C_write_text(clear_msg,0,0,0);
	MOVLW       _clear_msg+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(_clear_msg+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	CLRF        FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,137 :: 		T6963C_box(200,0,240,7,T6963C_WHITE);
	MOVLW       200
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       240
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,138 :: 		T6963C_write_text(erase_msg,25,0,0);
	MOVLW       _erase_msg+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(_erase_msg+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       25
	MOVWF       FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,139 :: 		T6963C_box(57,0,65,7,T6963C_WHITE);
	MOVLW       57
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       65
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,140 :: 		T6963C_write_char('R',7,0,0);
	MOVLW       82
	MOVWF       FARG_T6963C_write_char_c+0 
	MOVLW       7
	MOVWF       FARG_T6963C_write_char_x+0 
	CLRF        FARG_T6963C_write_char_y+0 
	CLRF        FARG_T6963C_write_char_mode+0 
	CALL        _T6963C_write_char+0, 0
;SmartGLCD.c,141 :: 		T6963C_box(73,0,81,7,T6963C_WHITE);
	MOVLW       73
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       81
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,142 :: 		T6963C_write_char('G',9,0,0);
	MOVLW       71
	MOVWF       FARG_T6963C_write_char_c+0 
	MOVLW       9
	MOVWF       FARG_T6963C_write_char_x+0 
	CLRF        FARG_T6963C_write_char_y+0 
	CLRF        FARG_T6963C_write_char_mode+0 
	CALL        _T6963C_write_char+0, 0
;SmartGLCD.c,143 :: 		T6963C_box(89,0,97,7,T6963C_WHITE);
	MOVLW       89
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       97
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,144 :: 		T6963C_write_char('B',11,0,0);
	MOVLW       66
	MOVWF       FARG_T6963C_write_char_c+0 
	MOVLW       11
	MOVWF       FARG_T6963C_write_char_x+0 
	CLRF        FARG_T6963C_write_char_y+0 
	CLRF        FARG_T6963C_write_char_mode+0 
	CALL        _T6963C_write_char+0, 0
;SmartGLCD.c,145 :: 		T6963C_box(105,0,145,7,T6963C_WHITE);
	MOVLW       105
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       145
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,146 :: 		T6963C_write_text("Light",13,0,0);
	MOVLW       ?lstr5_SmartGLCD+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr5_SmartGLCD+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       13
	MOVWF       FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,148 :: 		write_erase = 1;
	MOVLW       1
	MOVWF       _write_erase+0 
;SmartGLCD.c,150 :: 		while (1) {
L_main4:
;SmartGLCD.c,152 :: 		if (TP_Press_Detect()) {
	CALL        _TP_Press_Detect+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;SmartGLCD.c,154 :: 		if (TP_Get_Coordinates(&x_coord240, &y_coord128) == 0){
	MOVLW       _x_coord240+0
	MOVWF       FARG_TP_Get_Coordinates_x_coordinate+0 
	MOVLW       hi_addr(_x_coord240+0)
	MOVWF       FARG_TP_Get_Coordinates_x_coordinate+1 
	MOVLW       _y_coord128+0
	MOVWF       FARG_TP_Get_Coordinates_y_coordinate+0 
	MOVLW       hi_addr(_y_coord128+0)
	MOVWF       FARG_TP_Get_Coordinates_y_coordinate+1 
	CALL        _TP_Get_Coordinates+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main7
;SmartGLCD.c,157 :: 		if ((x_coord240 < 32) && (y_coord128 < 8)) {
	MOVLW       0
	SUBWF       _x_coord240+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main47
	MOVLW       32
	SUBWF       _x_coord240+0, 0 
L__main47:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
	MOVLW       0
	SUBWF       _y_coord128+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main48
	MOVLW       8
	SUBWF       _y_coord128+0, 0 
L__main48:
	BTFSC       STATUS+0, 0 
	GOTO        L_main10
L__main44:
;SmartGLCD.c,159 :: 		T6963C_panelFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	ADDWF       _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	ADDWFC      _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD.c,162 :: 		T6963C_box(0,0,42,7,T6963C_WHITE);
	CLRF        FARG_T6963C_box_x0+0 
	CLRF        FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       42
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,163 :: 		T6963C_write_text(clear_msg,0,0,0);
	MOVLW       _clear_msg+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(_clear_msg+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	CLRF        FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,164 :: 		T6963C_box(200,0,240,7,T6963C_WHITE);
	MOVLW       200
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       240
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,165 :: 		if (write_erase)
	MOVF        _write_erase+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
;SmartGLCD.c,166 :: 		T6963C_write_text(erase_msg,25,0,0);
	MOVLW       _erase_msg+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(_erase_msg+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       25
	MOVWF       FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
	GOTO        L_main12
L_main11:
;SmartGLCD.c,168 :: 		T6963C_write_text(write_msg,25,0,0);
	MOVLW       _write_msg+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(_write_msg+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       25
	MOVWF       FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
L_main12:
;SmartGLCD.c,170 :: 		T6963C_box(57,0,65,7,T6963C_WHITE);
	MOVLW       57
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       65
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,171 :: 		T6963C_write_char('R',7,0,0);
	MOVLW       82
	MOVWF       FARG_T6963C_write_char_c+0 
	MOVLW       7
	MOVWF       FARG_T6963C_write_char_x+0 
	CLRF        FARG_T6963C_write_char_y+0 
	CLRF        FARG_T6963C_write_char_mode+0 
	CALL        _T6963C_write_char+0, 0
;SmartGLCD.c,172 :: 		T6963C_box(73,0,81,7,T6963C_WHITE);
	MOVLW       73
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       81
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,173 :: 		T6963C_write_char('G',9,0,0);
	MOVLW       71
	MOVWF       FARG_T6963C_write_char_c+0 
	MOVLW       9
	MOVWF       FARG_T6963C_write_char_x+0 
	CLRF        FARG_T6963C_write_char_y+0 
	CLRF        FARG_T6963C_write_char_mode+0 
	CALL        _T6963C_write_char+0, 0
;SmartGLCD.c,174 :: 		T6963C_box(89,0,97,7,T6963C_WHITE);
	MOVLW       89
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       97
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,175 :: 		T6963C_write_char('B',11,0,0);
	MOVLW       66
	MOVWF       FARG_T6963C_write_char_c+0 
	MOVLW       11
	MOVWF       FARG_T6963C_write_char_x+0 
	CLRF        FARG_T6963C_write_char_y+0 
	CLRF        FARG_T6963C_write_char_mode+0 
	CALL        _T6963C_write_char+0, 0
;SmartGLCD.c,176 :: 		T6963C_box(105,0,145,7,T6963C_WHITE);
	MOVLW       105
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	CLRF        FARG_T6963C_box_y0+0 
	CLRF        FARG_T6963C_box_y0+1 
	MOVLW       145
	MOVWF       FARG_T6963C_box_x1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x1+1 
	MOVLW       7
	MOVWF       FARG_T6963C_box_y1+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y1+1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD.c,177 :: 		T6963C_write_text("Light",13,0,0);
	MOVLW       ?lstr6_SmartGLCD+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr6_SmartGLCD+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       13
	MOVWF       FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,178 :: 		}
L_main10:
;SmartGLCD.c,181 :: 		if ((x_coord240 > 201) && (y_coord128 < 8)) {
	MOVLW       0
	MOVWF       R0 
	MOVF        _x_coord240+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main49
	MOVF        _x_coord240+0, 0 
	SUBLW       201
L__main49:
	BTFSC       STATUS+0, 0 
	GOTO        L_main15
	MOVLW       0
	SUBWF       _y_coord128+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main50
	MOVLW       8
	SUBWF       _y_coord128+0, 0 
L__main50:
	BTFSC       STATUS+0, 0 
	GOTO        L_main15
L__main43:
;SmartGLCD.c,182 :: 		if (write_erase) {
	MOVF        _write_erase+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
;SmartGLCD.c,183 :: 		write_erase = 0;
	CLRF        _write_erase+0 
;SmartGLCD.c,184 :: 		T6963C_write_text(write_msg,25,0,0);
	MOVLW       _write_msg+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(_write_msg+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       25
	MOVWF       FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,185 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
	NOP
	NOP
;SmartGLCD.c,186 :: 		}
	GOTO        L_main18
L_main16:
;SmartGLCD.c,188 :: 		write_erase = 1;
	MOVLW       1
	MOVWF       _write_erase+0 
;SmartGLCD.c,189 :: 		T6963C_write_text(erase_msg,25,0,0);
	MOVLW       _erase_msg+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(_erase_msg+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       25
	MOVWF       FARG_T6963C_write_text_x+0 
	CLRF        FARG_T6963C_write_text_y+0 
	CLRF        FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD.c,190 :: 		Delay_ms(200);
	MOVLW       13
	MOVWF       R11, 0
	MOVLW       45
	MOVWF       R12, 0
	MOVLW       215
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
	NOP
;SmartGLCD.c,191 :: 		}
L_main18:
;SmartGLCD.c,192 :: 		}
L_main15:
;SmartGLCD.c,195 :: 		if ((x_coord240 >= 57) && (x_coord240 <= 65) && (y_coord128 <= 7)) {
	MOVLW       0
	SUBWF       _x_coord240+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	MOVLW       57
	SUBWF       _x_coord240+0, 0 
L__main51:
	BTFSS       STATUS+0, 0 
	GOTO        L_main22
	MOVLW       0
	MOVWF       R0 
	MOVF        _x_coord240+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main52
	MOVF        _x_coord240+0, 0 
	SUBLW       65
L__main52:
	BTFSS       STATUS+0, 0 
	GOTO        L_main22
	MOVLW       0
	MOVWF       R0 
	MOVF        _y_coord128+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main53
	MOVF        _y_coord128+0, 0 
	SUBLW       7
L__main53:
	BTFSS       STATUS+0, 0 
	GOTO        L_main22
L__main42:
;SmartGLCD.c,196 :: 		PORTC.F2 = !PORTC.F2;   // Red
	BTG         PORTC+0, 2 
;SmartGLCD.c,197 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
;SmartGLCD.c,198 :: 		}
L_main22:
;SmartGLCD.c,201 :: 		if ((x_coord240 >= 73) && (x_coord240 <= 81) && (y_coord128 <= 7)) {
	MOVLW       0
	SUBWF       _x_coord240+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main54
	MOVLW       73
	SUBWF       _x_coord240+0, 0 
L__main54:
	BTFSS       STATUS+0, 0 
	GOTO        L_main26
	MOVLW       0
	MOVWF       R0 
	MOVF        _x_coord240+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main55
	MOVF        _x_coord240+0, 0 
	SUBLW       81
L__main55:
	BTFSS       STATUS+0, 0 
	GOTO        L_main26
	MOVLW       0
	MOVWF       R0 
	MOVF        _y_coord128+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main56
	MOVF        _y_coord128+0, 0 
	SUBLW       7
L__main56:
	BTFSS       STATUS+0, 0 
	GOTO        L_main26
L__main41:
;SmartGLCD.c,202 :: 		PORTC.F1 = !PORTC.F1;   // Green
	BTG         PORTC+0, 1 
;SmartGLCD.c,203 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	DECFSZ      R11, 1, 1
	BRA         L_main27
	NOP
;SmartGLCD.c,204 :: 		}
L_main26:
;SmartGLCD.c,207 :: 		if ((x_coord240 >= 89) && (x_coord240 <= 97) && (y_coord128 <= 7)) {
	MOVLW       0
	SUBWF       _x_coord240+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main57
	MOVLW       89
	SUBWF       _x_coord240+0, 0 
L__main57:
	BTFSS       STATUS+0, 0 
	GOTO        L_main30
	MOVLW       0
	MOVWF       R0 
	MOVF        _x_coord240+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main58
	MOVF        _x_coord240+0, 0 
	SUBLW       97
L__main58:
	BTFSS       STATUS+0, 0 
	GOTO        L_main30
	MOVLW       0
	MOVWF       R0 
	MOVF        _y_coord128+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main59
	MOVF        _y_coord128+0, 0 
	SUBLW       7
L__main59:
	BTFSS       STATUS+0, 0 
	GOTO        L_main30
L__main40:
;SmartGLCD.c,208 :: 		PORTG.F0 = !PORTG.F0;   // Blue
	BTG         PORTG+0, 0 
;SmartGLCD.c,209 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
;SmartGLCD.c,210 :: 		}
L_main30:
;SmartGLCD.c,212 :: 		if ((x_coord240 >= 105) && (x_coord240 <= 146) && (y_coord128 <= 7)) {
	MOVLW       0
	SUBWF       _x_coord240+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main60
	MOVLW       105
	SUBWF       _x_coord240+0, 0 
L__main60:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
	MOVLW       0
	MOVWF       R0 
	MOVF        _x_coord240+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main61
	MOVF        _x_coord240+0, 0 
	SUBLW       146
L__main61:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
	MOVLW       0
	MOVWF       R0 
	MOVF        _y_coord128+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main62
	MOVF        _y_coord128+0, 0 
	SUBLW       7
L__main62:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
L__main39:
;SmartGLCD.c,213 :: 		PORTC.F2 = !PORTC.F2;   // Red
	BTG         PORTC+0, 2 
;SmartGLCD.c,214 :: 		PORTC.F1 = !PORTC.F1;   // Green
	BTG         PORTC+0, 1 
;SmartGLCD.c,215 :: 		PORTG.F0 = !PORTG.F0;   // Blue
	BTG         PORTG+0, 0 
;SmartGLCD.c,216 :: 		Delay_ms(100);
	MOVLW       7
	MOVWF       R11, 0
	MOVLW       23
	MOVWF       R12, 0
	MOVLW       106
	MOVWF       R13, 0
L_main35:
	DECFSZ      R13, 1, 1
	BRA         L_main35
	DECFSZ      R12, 1, 1
	BRA         L_main35
	DECFSZ      R11, 1, 1
	BRA         L_main35
	NOP
;SmartGLCD.c,217 :: 		}
L_main34:
;SmartGLCD.c,220 :: 		if (y_coord128 > 8)
	MOVLW       0
	MOVWF       R0 
	MOVF        _y_coord128+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main63
	MOVF        _y_coord128+0, 0 
	SUBLW       8
L__main63:
	BTFSC       STATUS+0, 0 
	GOTO        L_main36
;SmartGLCD.c,222 :: 		if (write_erase) T6963C_dot(x_coord240, y_coord128, T6963C_WHITE);
	MOVF        _write_erase+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main37
	MOVF        _x_coord240+0, 0 
	MOVWF       FARG_T6963C_dot_x+0 
	MOVF        _x_coord240+1, 0 
	MOVWF       FARG_T6963C_dot_x+1 
	MOVF        _y_coord128+0, 0 
	MOVWF       FARG_T6963C_dot_y+0 
	MOVF        _y_coord128+1, 0 
	MOVWF       FARG_T6963C_dot_y+1 
	MOVLW       8
	MOVWF       FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
	GOTO        L_main38
L_main37:
;SmartGLCD.c,223 :: 		else T6963C_dot(x_coord240, y_coord128, T6963C_BLACK);
	MOVF        _x_coord240+0, 0 
	MOVWF       FARG_T6963C_dot_x+0 
	MOVF        _x_coord240+1, 0 
	MOVWF       FARG_T6963C_dot_x+1 
	MOVF        _y_coord128+0, 0 
	MOVWF       FARG_T6963C_dot_y+0 
	MOVF        _y_coord128+1, 0 
	MOVWF       FARG_T6963C_dot_y+1 
	CLRF        FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
L_main38:
;SmartGLCD.c,224 :: 		}
L_main36:
;SmartGLCD.c,225 :: 		}
L_main7:
;SmartGLCD.c,226 :: 		}
L_main6:
;SmartGLCD.c,227 :: 		}
	GOTO        L_main4
;SmartGLCD.c,228 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
