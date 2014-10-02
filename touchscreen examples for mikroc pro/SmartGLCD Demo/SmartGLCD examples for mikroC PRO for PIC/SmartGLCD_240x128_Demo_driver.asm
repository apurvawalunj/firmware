
SmartGLCD_240x128_Demo_driver_InitializeTouchPanel:

;SmartGLCD_240x128_Demo_driver.c,40 :: 		static void InitializeTouchPanel() {
;SmartGLCD_240x128_Demo_driver.c,41 :: 		ANCON0 = 0;
	CLRF        ANCON0+0 
;SmartGLCD_240x128_Demo_driver.c,42 :: 		ANCON1 = 0;
	CLRF        ANCON1+0 
;SmartGLCD_240x128_Demo_driver.c,43 :: 		ANCON2 = 0;
	CLRF        ANCON2+0 
;SmartGLCD_240x128_Demo_driver.c,45 :: 		ANCON0.B0 = 1;            // Configure RA0 pin as analog
	BSF         ANCON0+0, 0 
;SmartGLCD_240x128_Demo_driver.c,46 :: 		ANCON0.B1 = 1;            // Configure RA1 pin as analog
	BSF         ANCON0+0, 1 
;SmartGLCD_240x128_Demo_driver.c,48 :: 		TRISA.B0 = 1;             // Set RA0 pin as input
	BSF         TRISA+0, 0 
;SmartGLCD_240x128_Demo_driver.c,49 :: 		TRISA.B1 = 1;             // Set RA1 pin as input
	BSF         TRISA+0, 1 
;SmartGLCD_240x128_Demo_driver.c,51 :: 		ADC_Init();
	CALL        _ADC_Init+0, 0
;SmartGLCD_240x128_Demo_driver.c,52 :: 		T6963C_ctrlce_Direction = 0;
	BCF         TRISJ3_bit+0, BitPos(TRISJ3_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,53 :: 		T6963C_ctrlce = 0;            // Enable T6963C
	BCF         LATJ3_bit+0, BitPos(LATJ3_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,54 :: 		T6963C_ctrlmd_Direction = 0;
	BCF         TRISJ5_bit+0, BitPos(TRISJ5_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,55 :: 		T6963C_ctrlmd = 0;            // Column number select
	BCF         LATJ5_bit+0, BitPos(LATJ5_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,56 :: 		T6963C_ctrlfs_Direction = 0;
	BCF         TRISJ6_bit+0, BitPos(TRISJ6_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,57 :: 		T6963C_ctrlfs = 0;            // Wide Font
	BCF         LATJ6_bit+0, BitPos(LATJ6_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,59 :: 		BacklightRed_Direction   = 0; // Set backlight signals as outputs
	BCF         TRISC2_bit+0, BitPos(TRISC2_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,60 :: 		BacklightGreen_Direction = 0;
	BCF         TRISC1_bit+0, BitPos(TRISC1_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,61 :: 		BacklightBlue_Direction  = 0;
	BCF         TRISG0_bit+0, BitPos(TRISG0_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,62 :: 		BacklightRed   = 0;           // Turn on Red component of back light
	BCF         LATC2_bit+0, BitPos(LATC2_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,63 :: 		BacklightGreen = 0;           // Turn on Green component of back light
	BCF         LATC1_bit+0, BitPos(LATC1_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,64 :: 		BacklightBlue  = 0;           // Turn on Blue component of back light
	BCF         LATG0_bit+0, BitPos(LATG0_bit+0) 
;SmartGLCD_240x128_Demo_driver.c,67 :: 		T6963C_init(240, 128, 8);
	MOVLW       240
	MOVWF       FARG_T6963C_init_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_init_width+1 
	MOVLW       128
	MOVWF       FARG_T6963C_init_height+0 
	MOVLW       8
	MOVWF       FARG_T6963C_init_fntW+0 
	CALL        _T6963C_init+0, 0
;SmartGLCD_240x128_Demo_driver.c,68 :: 		T6963C_graphics(1);
	BSF         _T6963C_display+0, 3 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD_240x128_Demo_driver.c,69 :: 		T6963C_text(1);
	BSF         _T6963C_display+0, 2 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD_240x128_Demo_driver.c,70 :: 		T6963C_cursor(0);
	BCF         _T6963C_display+0, 1 
	MOVF        _T6963C_display+0, 0 
	MOVWF       FARG_T6963C_writeCommand_mydata+0 
	CALL        _T6963C_writeCommand+0, 0
;SmartGLCD_240x128_Demo_driver.c,72 :: 		TP_Init(240, 128, 0, 1);                                  // Initialize touch panel
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
;SmartGLCD_240x128_Demo_driver.c,73 :: 		TP_Set_ADC_Threshold(900);                              // Set touch panel ADC threshold
	MOVLW       132
	MOVWF       FARG_TP_Set_ADC_Threshold_threshold+0 
	MOVLW       3
	MOVWF       FARG_TP_Set_ADC_Threshold_threshold+1 
	CALL        _TP_Set_ADC_Threshold+0, 0
;SmartGLCD_240x128_Demo_driver.c,75 :: 		PenDown = 0;
	CLRF        _PenDown+0 
;SmartGLCD_240x128_Demo_driver.c,76 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,77 :: 		}
L_end_InitializeTouchPanel:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_InitializeTouchPanel

_Calibrate:

;SmartGLCD_240x128_Demo_driver.c,79 :: 		void Calibrate() {
;SmartGLCD_240x128_Demo_driver.c,81 :: 		T6963C_dot(0,127,T6963C_WHITE);                          // Draw bottom left dot
	CLRF        FARG_T6963C_dot_x+0 
	CLRF        FARG_T6963C_dot_x+1 
	MOVLW       127
	MOVWF       FARG_T6963C_dot_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_dot_y+1 
	MOVLW       8
	MOVWF       FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
;SmartGLCD_240x128_Demo_driver.c,82 :: 		T6963C_write_text("TOUCH BOTTOM LEFT",3,12,T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr1_SmartGLCD_240x128_Demo_driver+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr1_SmartGLCD_240x128_Demo_driver+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       3
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       12
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_driver.c,83 :: 		TP_Calibrate_Bottom_Left();                              // Calibration of bottom left corner
	CALL        _TP_Calibrate_Bottom_Left+0, 0
;SmartGLCD_240x128_Demo_driver.c,84 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_Calibrate0:
	DECFSZ      R13, 1, 1
	BRA         L_Calibrate0
	DECFSZ      R12, 1, 1
	BRA         L_Calibrate0
	DECFSZ      R11, 1, 1
	BRA         L_Calibrate0
	NOP
	NOP
;SmartGLCD_240x128_Demo_driver.c,86 :: 		T6963C_dot(0,127,T6963C_BLACK);                          // Clear bottom left dot
	CLRF        FARG_T6963C_dot_x+0 
	CLRF        FARG_T6963C_dot_x+1 
	MOVLW       127
	MOVWF       FARG_T6963C_dot_y+0 
	MOVLW       0
	MOVWF       FARG_T6963C_dot_y+1 
	CLRF        FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
;SmartGLCD_240x128_Demo_driver.c,87 :: 		T6963C_dot(239,0,T6963C_WHITE);                          // Draw upper right dot
	MOVLW       239
	MOVWF       FARG_T6963C_dot_x+0 
	MOVLW       0
	MOVWF       FARG_T6963C_dot_x+1 
	CLRF        FARG_T6963C_dot_y+0 
	CLRF        FARG_T6963C_dot_y+1 
	MOVLW       8
	MOVWF       FARG_T6963C_dot_color+0 
	CALL        _T6963C_dot+0, 0
;SmartGLCD_240x128_Demo_driver.c,88 :: 		T6963C_write_text("                 ",3,12,T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr2_SmartGLCD_240x128_Demo_driver+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr2_SmartGLCD_240x128_Demo_driver+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       3
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       12
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_driver.c,89 :: 		T6963C_write_text("TOUCH UPPER RIGHT",12,3,T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr3_SmartGLCD_240x128_Demo_driver+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr3_SmartGLCD_240x128_Demo_driver+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       12
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       3
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_driver.c,90 :: 		TP_Calibrate_Upper_Right();                              // Calibration of upper right corner
	CALL        _TP_Calibrate_Upper_Right+0, 0
;SmartGLCD_240x128_Demo_driver.c,92 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_Calibrate1:
	DECFSZ      R13, 1, 1
	BRA         L_Calibrate1
	DECFSZ      R12, 1, 1
	BRA         L_Calibrate1
	DECFSZ      R11, 1, 1
	BRA         L_Calibrate1
	NOP
	NOP
;SmartGLCD_240x128_Demo_driver.c,93 :: 		}
L_end_Calibrate:
	RETURN      0
; end of _Calibrate

SmartGLCD_240x128_Demo_driver_InitializeObjects:

;SmartGLCD_240x128_Demo_driver.c,400 :: 		static void InitializeObjects() {
;SmartGLCD_240x128_Demo_driver.c,401 :: 		Screen1.LabelsCount               = 2;
	MOVLW       2
	MOVWF       _Screen1+0 
	MOVLW       0
	MOVWF       _Screen1+1 
;SmartGLCD_240x128_Demo_driver.c,402 :: 		Screen1.Labels                    = Screen0_Labels;
	MOVLW       _Screen0_Labels+0
	MOVWF       _Screen1+2 
	MOVLW       hi_addr(_Screen0_Labels+0)
	MOVWF       _Screen1+3 
;SmartGLCD_240x128_Demo_driver.c,403 :: 		Screen1.ImagesCount               = 1;
	MOVLW       1
	MOVWF       _Screen1+4 
	MOVLW       0
	MOVWF       _Screen1+5 
;SmartGLCD_240x128_Demo_driver.c,404 :: 		Screen1.Images                    = Screen0_Images;
	MOVLW       _Screen0_Images+0
	MOVWF       _Screen1+6 
	MOVLW       hi_addr(_Screen0_Images+0)
	MOVWF       _Screen1+7 
;SmartGLCD_240x128_Demo_driver.c,405 :: 		Screen1.CaptionButtonsCount       = 0;
	CLRF        _Screen1+8 
	CLRF        _Screen1+9 
;SmartGLCD_240x128_Demo_driver.c,406 :: 		Screen1.CaptionButtons_RoundCount = 3;
	MOVLW       3
	MOVWF       _Screen1+12 
	MOVLW       0
	MOVWF       _Screen1+13 
;SmartGLCD_240x128_Demo_driver.c,407 :: 		Screen1.CaptionButtons_Round      = Screen0_CaptionButtons_Round;
	MOVLW       _Screen0_CaptionButtons_Round+0
	MOVWF       _Screen1+14 
	MOVLW       hi_addr(_Screen0_CaptionButtons_Round+0)
	MOVWF       _Screen1+15 
;SmartGLCD_240x128_Demo_driver.c,408 :: 		Screen1.RectanglesCount           = 0;
	CLRF        _Screen1+16 
	CLRF        _Screen1+17 
;SmartGLCD_240x128_Demo_driver.c,409 :: 		Screen0_Labels[0]        = &Label1;
	MOVLW       _Label1+0
	MOVWF       _Screen0_Labels+0 
	MOVLW       hi_addr(_Label1+0)
	MOVWF       _Screen0_Labels+1 
;SmartGLCD_240x128_Demo_driver.c,410 :: 		Screen0_Labels[1]        = &Label2;
	MOVLW       _Label2+0
	MOVWF       _Screen0_Labels+2 
	MOVLW       hi_addr(_Label2+0)
	MOVWF       _Screen0_Labels+3 
;SmartGLCD_240x128_Demo_driver.c,411 :: 		Screen0_CaptionButtons_Round[0]   = &RoundCaptionButton1;
	MOVLW       _RoundCaptionButton1+0
	MOVWF       _Screen0_CaptionButtons_Round+0 
	MOVLW       hi_addr(_RoundCaptionButton1+0)
	MOVWF       _Screen0_CaptionButtons_Round+1 
;SmartGLCD_240x128_Demo_driver.c,412 :: 		Screen0_CaptionButtons_Round[1]   = &RoundCaptionButton2;
	MOVLW       _RoundCaptionButton2+0
	MOVWF       _Screen0_CaptionButtons_Round+2 
	MOVLW       hi_addr(_RoundCaptionButton2+0)
	MOVWF       _Screen0_CaptionButtons_Round+3 
;SmartGLCD_240x128_Demo_driver.c,413 :: 		Screen0_Images[0]          = &Image2;
	MOVLW       _Image2+0
	MOVWF       _Screen0_Images+0 
	MOVLW       hi_addr(_Image2+0)
	MOVWF       _Screen0_Images+1 
;SmartGLCD_240x128_Demo_driver.c,414 :: 		Screen0_CaptionButtons_Round[2]   = &RoundCaptionButton14;
	MOVLW       _RoundCaptionButton14+0
	MOVWF       _Screen0_CaptionButtons_Round+4 
	MOVLW       hi_addr(_RoundCaptionButton14+0)
	MOVWF       _Screen0_CaptionButtons_Round+5 
;SmartGLCD_240x128_Demo_driver.c,416 :: 		Screen2.LabelsCount               = 8;
	MOVLW       8
	MOVWF       _Screen2+0 
	MOVLW       0
	MOVWF       _Screen2+1 
;SmartGLCD_240x128_Demo_driver.c,417 :: 		Screen2.Labels                    = Screen1_Labels;
	MOVLW       _Screen1_Labels+0
	MOVWF       _Screen2+2 
	MOVLW       hi_addr(_Screen1_Labels+0)
	MOVWF       _Screen2+3 
;SmartGLCD_240x128_Demo_driver.c,418 :: 		Screen2.ImagesCount               = 0;
	CLRF        _Screen2+4 
	CLRF        _Screen2+5 
;SmartGLCD_240x128_Demo_driver.c,419 :: 		Screen2.CaptionButtonsCount       = 0;
	CLRF        _Screen2+8 
	CLRF        _Screen2+9 
;SmartGLCD_240x128_Demo_driver.c,420 :: 		Screen2.CaptionButtons_RoundCount = 1;
	MOVLW       1
	MOVWF       _Screen2+12 
	MOVLW       0
	MOVWF       _Screen2+13 
;SmartGLCD_240x128_Demo_driver.c,421 :: 		Screen2.CaptionButtons_Round      = Screen1_CaptionButtons_Round;
	MOVLW       _Screen1_CaptionButtons_Round+0
	MOVWF       _Screen2+14 
	MOVLW       hi_addr(_Screen1_CaptionButtons_Round+0)
	MOVWF       _Screen2+15 
;SmartGLCD_240x128_Demo_driver.c,422 :: 		Screen2.RectanglesCount           = 0;
	CLRF        _Screen2+16 
	CLRF        _Screen2+17 
;SmartGLCD_240x128_Demo_driver.c,423 :: 		Screen1_CaptionButtons_Round[0]   = &RoundCaptionButton3;
	MOVLW       _RoundCaptionButton3+0
	MOVWF       _Screen1_CaptionButtons_Round+0 
	MOVLW       hi_addr(_RoundCaptionButton3+0)
	MOVWF       _Screen1_CaptionButtons_Round+1 
;SmartGLCD_240x128_Demo_driver.c,424 :: 		Screen1_Labels[0]        = &Label8;
	MOVLW       _Label8+0
	MOVWF       _Screen1_Labels+0 
	MOVLW       hi_addr(_Label8+0)
	MOVWF       _Screen1_Labels+1 
;SmartGLCD_240x128_Demo_driver.c,425 :: 		Screen1_Labels[1]        = &Label9;
	MOVLW       _Label9+0
	MOVWF       _Screen1_Labels+2 
	MOVLW       hi_addr(_Label9+0)
	MOVWF       _Screen1_Labels+3 
;SmartGLCD_240x128_Demo_driver.c,426 :: 		Screen1_Labels[2]        = &Label10;
	MOVLW       _Label10+0
	MOVWF       _Screen1_Labels+4 
	MOVLW       hi_addr(_Label10+0)
	MOVWF       _Screen1_Labels+5 
;SmartGLCD_240x128_Demo_driver.c,427 :: 		Screen1_Labels[3]        = &Label11;
	MOVLW       _Label11+0
	MOVWF       _Screen1_Labels+6 
	MOVLW       hi_addr(_Label11+0)
	MOVWF       _Screen1_Labels+7 
;SmartGLCD_240x128_Demo_driver.c,428 :: 		Screen1_Labels[4]        = &Label12;
	MOVLW       _Label12+0
	MOVWF       _Screen1_Labels+8 
	MOVLW       hi_addr(_Label12+0)
	MOVWF       _Screen1_Labels+9 
;SmartGLCD_240x128_Demo_driver.c,429 :: 		Screen1_Labels[5]        = &Label13;
	MOVLW       _Label13+0
	MOVWF       _Screen1_Labels+10 
	MOVLW       hi_addr(_Label13+0)
	MOVWF       _Screen1_Labels+11 
;SmartGLCD_240x128_Demo_driver.c,430 :: 		Screen1_Labels[6]        = &Label14;
	MOVLW       _Label14+0
	MOVWF       _Screen1_Labels+12 
	MOVLW       hi_addr(_Label14+0)
	MOVWF       _Screen1_Labels+13 
;SmartGLCD_240x128_Demo_driver.c,431 :: 		Screen1_Labels[7]        = &Label15;
	MOVLW       _Label15+0
	MOVWF       _Screen1_Labels+14 
	MOVLW       hi_addr(_Label15+0)
	MOVWF       _Screen1_Labels+15 
;SmartGLCD_240x128_Demo_driver.c,433 :: 		Screen3.LabelsCount               = 1;
	MOVLW       1
	MOVWF       _Screen3+0 
	MOVLW       0
	MOVWF       _Screen3+1 
;SmartGLCD_240x128_Demo_driver.c,434 :: 		Screen3.Labels                    = Screen2_Labels;
	MOVLW       _Screen2_Labels+0
	MOVWF       _Screen3+2 
	MOVLW       hi_addr(_Screen2_Labels+0)
	MOVWF       _Screen3+3 
;SmartGLCD_240x128_Demo_driver.c,435 :: 		Screen3.ImagesCount               = 1;
	MOVLW       1
	MOVWF       _Screen3+4 
	MOVLW       0
	MOVWF       _Screen3+5 
;SmartGLCD_240x128_Demo_driver.c,436 :: 		Screen3.Images                    = Screen2_Images;
	MOVLW       _Screen2_Images+0
	MOVWF       _Screen3+6 
	MOVLW       hi_addr(_Screen2_Images+0)
	MOVWF       _Screen3+7 
;SmartGLCD_240x128_Demo_driver.c,437 :: 		Screen3.CaptionButtonsCount       = 27;
	MOVLW       27
	MOVWF       _Screen3+8 
	MOVLW       0
	MOVWF       _Screen3+9 
;SmartGLCD_240x128_Demo_driver.c,438 :: 		Screen3.CaptionButtons            = Screen2_CaptionButtons;
	MOVLW       _Screen2_CaptionButtons+0
	MOVWF       _Screen3+10 
	MOVLW       hi_addr(_Screen2_CaptionButtons+0)
	MOVWF       _Screen3+11 
;SmartGLCD_240x128_Demo_driver.c,439 :: 		Screen3.CaptionButtons_RoundCount = 2;
	MOVLW       2
	MOVWF       _Screen3+12 
	MOVLW       0
	MOVWF       _Screen3+13 
;SmartGLCD_240x128_Demo_driver.c,440 :: 		Screen3.CaptionButtons_Round      = Screen2_CaptionButtons_Round;
	MOVLW       _Screen2_CaptionButtons_Round+0
	MOVWF       _Screen3+14 
	MOVLW       hi_addr(_Screen2_CaptionButtons_Round+0)
	MOVWF       _Screen3+15 
;SmartGLCD_240x128_Demo_driver.c,441 :: 		Screen3.RectanglesCount           = 1;
	MOVLW       1
	MOVWF       _Screen3+16 
	MOVLW       0
	MOVWF       _Screen3+17 
;SmartGLCD_240x128_Demo_driver.c,442 :: 		Screen3.Rectangles                = Screen2_Rectangles;
	MOVLW       _Screen2_Rectangles+0
	MOVWF       _Screen3+18 
	MOVLW       hi_addr(_Screen2_Rectangles+0)
	MOVWF       _Screen3+19 
;SmartGLCD_240x128_Demo_driver.c,443 :: 		Screen2_CaptionButtons_Round[0]   = &RoundCaptionButton4;
	MOVLW       _RoundCaptionButton4+0
	MOVWF       _Screen2_CaptionButtons_Round+0 
	MOVLW       hi_addr(_RoundCaptionButton4+0)
	MOVWF       _Screen2_CaptionButtons_Round+1 
;SmartGLCD_240x128_Demo_driver.c,444 :: 		Screen2_CaptionButtons[0]       = &CaptionButton1;
	MOVLW       _CaptionButton1+0
	MOVWF       _Screen2_CaptionButtons+0 
	MOVLW       hi_addr(_CaptionButton1+0)
	MOVWF       _Screen2_CaptionButtons+1 
;SmartGLCD_240x128_Demo_driver.c,445 :: 		Screen2_CaptionButtons[1]       = &CaptionButton2;
	MOVLW       _CaptionButton2+0
	MOVWF       _Screen2_CaptionButtons+2 
	MOVLW       hi_addr(_CaptionButton2+0)
	MOVWF       _Screen2_CaptionButtons+3 
;SmartGLCD_240x128_Demo_driver.c,446 :: 		Screen2_CaptionButtons[2]       = &CaptionButton3;
	MOVLW       _CaptionButton3+0
	MOVWF       _Screen2_CaptionButtons+4 
	MOVLW       hi_addr(_CaptionButton3+0)
	MOVWF       _Screen2_CaptionButtons+5 
;SmartGLCD_240x128_Demo_driver.c,447 :: 		Screen2_CaptionButtons[3]       = &CaptionButton4;
	MOVLW       _CaptionButton4+0
	MOVWF       _Screen2_CaptionButtons+6 
	MOVLW       hi_addr(_CaptionButton4+0)
	MOVWF       _Screen2_CaptionButtons+7 
;SmartGLCD_240x128_Demo_driver.c,448 :: 		Screen2_CaptionButtons[4]       = &CaptionButton5;
	MOVLW       _CaptionButton5+0
	MOVWF       _Screen2_CaptionButtons+8 
	MOVLW       hi_addr(_CaptionButton5+0)
	MOVWF       _Screen2_CaptionButtons+9 
;SmartGLCD_240x128_Demo_driver.c,449 :: 		Screen2_CaptionButtons[5]       = &CaptionButton6;
	MOVLW       _CaptionButton6+0
	MOVWF       _Screen2_CaptionButtons+10 
	MOVLW       hi_addr(_CaptionButton6+0)
	MOVWF       _Screen2_CaptionButtons+11 
;SmartGLCD_240x128_Demo_driver.c,450 :: 		Screen2_CaptionButtons[6]       = &CaptionButton7;
	MOVLW       _CaptionButton7+0
	MOVWF       _Screen2_CaptionButtons+12 
	MOVLW       hi_addr(_CaptionButton7+0)
	MOVWF       _Screen2_CaptionButtons+13 
;SmartGLCD_240x128_Demo_driver.c,451 :: 		Screen2_CaptionButtons[7]       = &CaptionButton8;
	MOVLW       _CaptionButton8+0
	MOVWF       _Screen2_CaptionButtons+14 
	MOVLW       hi_addr(_CaptionButton8+0)
	MOVWF       _Screen2_CaptionButtons+15 
;SmartGLCD_240x128_Demo_driver.c,452 :: 		Screen2_CaptionButtons[8]       = &CaptionButton9;
	MOVLW       _CaptionButton9+0
	MOVWF       _Screen2_CaptionButtons+16 
	MOVLW       hi_addr(_CaptionButton9+0)
	MOVWF       _Screen2_CaptionButtons+17 
;SmartGLCD_240x128_Demo_driver.c,453 :: 		Screen2_CaptionButtons[9]       = &CaptionButton10;
	MOVLW       _CaptionButton10+0
	MOVWF       _Screen2_CaptionButtons+18 
	MOVLW       hi_addr(_CaptionButton10+0)
	MOVWF       _Screen2_CaptionButtons+19 
;SmartGLCD_240x128_Demo_driver.c,454 :: 		Screen2_CaptionButtons[10]       = &CaptionButton11;
	MOVLW       _CaptionButton11+0
	MOVWF       _Screen2_CaptionButtons+20 
	MOVLW       hi_addr(_CaptionButton11+0)
	MOVWF       _Screen2_CaptionButtons+21 
;SmartGLCD_240x128_Demo_driver.c,455 :: 		Screen2_CaptionButtons[11]       = &CaptionButton12;
	MOVLW       _CaptionButton12+0
	MOVWF       _Screen2_CaptionButtons+22 
	MOVLW       hi_addr(_CaptionButton12+0)
	MOVWF       _Screen2_CaptionButtons+23 
;SmartGLCD_240x128_Demo_driver.c,456 :: 		Screen2_CaptionButtons[12]       = &CaptionButton13;
	MOVLW       _CaptionButton13+0
	MOVWF       _Screen2_CaptionButtons+24 
	MOVLW       hi_addr(_CaptionButton13+0)
	MOVWF       _Screen2_CaptionButtons+25 
;SmartGLCD_240x128_Demo_driver.c,457 :: 		Screen2_CaptionButtons[13]       = &CaptionButton14;
	MOVLW       _CaptionButton14+0
	MOVWF       _Screen2_CaptionButtons+26 
	MOVLW       hi_addr(_CaptionButton14+0)
	MOVWF       _Screen2_CaptionButtons+27 
;SmartGLCD_240x128_Demo_driver.c,458 :: 		Screen2_CaptionButtons[14]       = &CaptionButton15;
	MOVLW       _CaptionButton15+0
	MOVWF       _Screen2_CaptionButtons+28 
	MOVLW       hi_addr(_CaptionButton15+0)
	MOVWF       _Screen2_CaptionButtons+29 
;SmartGLCD_240x128_Demo_driver.c,459 :: 		Screen2_CaptionButtons[15]       = &CaptionButton16;
	MOVLW       _CaptionButton16+0
	MOVWF       _Screen2_CaptionButtons+30 
	MOVLW       hi_addr(_CaptionButton16+0)
	MOVWF       _Screen2_CaptionButtons+31 
;SmartGLCD_240x128_Demo_driver.c,460 :: 		Screen2_CaptionButtons[16]       = &CaptionButton17;
	MOVLW       _CaptionButton17+0
	MOVWF       _Screen2_CaptionButtons+32 
	MOVLW       hi_addr(_CaptionButton17+0)
	MOVWF       _Screen2_CaptionButtons+33 
;SmartGLCD_240x128_Demo_driver.c,461 :: 		Screen2_CaptionButtons[17]       = &CaptionButton18;
	MOVLW       _CaptionButton18+0
	MOVWF       _Screen2_CaptionButtons+34 
	MOVLW       hi_addr(_CaptionButton18+0)
	MOVWF       _Screen2_CaptionButtons+35 
;SmartGLCD_240x128_Demo_driver.c,462 :: 		Screen2_CaptionButtons[18]       = &CaptionButton19;
	MOVLW       _CaptionButton19+0
	MOVWF       _Screen2_CaptionButtons+36 
	MOVLW       hi_addr(_CaptionButton19+0)
	MOVWF       _Screen2_CaptionButtons+37 
;SmartGLCD_240x128_Demo_driver.c,463 :: 		Screen2_CaptionButtons[19]       = &CaptionButton20;
	MOVLW       _CaptionButton20+0
	MOVWF       _Screen2_CaptionButtons+38 
	MOVLW       hi_addr(_CaptionButton20+0)
	MOVWF       _Screen2_CaptionButtons+39 
;SmartGLCD_240x128_Demo_driver.c,464 :: 		Screen2_CaptionButtons[20]       = &CaptionButton21;
	MOVLW       _CaptionButton21+0
	MOVWF       _Screen2_CaptionButtons+40 
	MOVLW       hi_addr(_CaptionButton21+0)
	MOVWF       _Screen2_CaptionButtons+41 
;SmartGLCD_240x128_Demo_driver.c,465 :: 		Screen2_CaptionButtons[21]       = &CaptionButton22;
	MOVLW       _CaptionButton22+0
	MOVWF       _Screen2_CaptionButtons+42 
	MOVLW       hi_addr(_CaptionButton22+0)
	MOVWF       _Screen2_CaptionButtons+43 
;SmartGLCD_240x128_Demo_driver.c,466 :: 		Screen2_CaptionButtons[22]       = &CaptionButton23;
	MOVLW       _CaptionButton23+0
	MOVWF       _Screen2_CaptionButtons+44 
	MOVLW       hi_addr(_CaptionButton23+0)
	MOVWF       _Screen2_CaptionButtons+45 
;SmartGLCD_240x128_Demo_driver.c,467 :: 		Screen2_CaptionButtons[23]       = &CaptionButton24;
	MOVLW       _CaptionButton24+0
	MOVWF       _Screen2_CaptionButtons+46 
	MOVLW       hi_addr(_CaptionButton24+0)
	MOVWF       _Screen2_CaptionButtons+47 
;SmartGLCD_240x128_Demo_driver.c,468 :: 		Screen2_CaptionButtons[24]       = &CaptionButton25;
	MOVLW       _CaptionButton25+0
	MOVWF       _Screen2_CaptionButtons+48 
	MOVLW       hi_addr(_CaptionButton25+0)
	MOVWF       _Screen2_CaptionButtons+49 
;SmartGLCD_240x128_Demo_driver.c,469 :: 		Screen2_CaptionButtons[25]       = &CaptionButton26;
	MOVLW       _CaptionButton26+0
	MOVWF       _Screen2_CaptionButtons+50 
	MOVLW       hi_addr(_CaptionButton26+0)
	MOVWF       _Screen2_CaptionButtons+51 
;SmartGLCD_240x128_Demo_driver.c,470 :: 		Screen2_Images[0]          = &Image1;
	MOVLW       _Image1+0
	MOVWF       _Screen2_Images+0 
	MOVLW       hi_addr(_Image1+0)
	MOVWF       _Screen2_Images+1 
;SmartGLCD_240x128_Demo_driver.c,471 :: 		Screen2_CaptionButtons[26]       = &CaptionButton27;
	MOVLW       _CaptionButton27+0
	MOVWF       _Screen2_CaptionButtons+52 
	MOVLW       hi_addr(_CaptionButton27+0)
	MOVWF       _Screen2_CaptionButtons+53 
;SmartGLCD_240x128_Demo_driver.c,472 :: 		Screen2_Labels[0]        = &Label7;
	MOVLW       _Label7+0
	MOVWF       _Screen2_Labels+0 
	MOVLW       hi_addr(_Label7+0)
	MOVWF       _Screen2_Labels+1 
;SmartGLCD_240x128_Demo_driver.c,473 :: 		Screen2_Rectangles[0]          = &Rectangle2;
	MOVLW       _Rectangle2+0
	MOVWF       _Screen2_Rectangles+0 
	MOVLW       hi_addr(_Rectangle2+0)
	MOVWF       _Screen2_Rectangles+1 
;SmartGLCD_240x128_Demo_driver.c,474 :: 		Screen2_CaptionButtons_Round[1]   = &RoundCaptionButton13;
	MOVLW       _RoundCaptionButton13+0
	MOVWF       _Screen2_CaptionButtons_Round+2 
	MOVLW       hi_addr(_RoundCaptionButton13+0)
	MOVWF       _Screen2_CaptionButtons_Round+3 
;SmartGLCD_240x128_Demo_driver.c,476 :: 		Screen4.LabelsCount               = 7;
	MOVLW       7
	MOVWF       _Screen4+0 
	MOVLW       0
	MOVWF       _Screen4+1 
;SmartGLCD_240x128_Demo_driver.c,477 :: 		Screen4.Labels                    = Screen3_Labels;
	MOVLW       _Screen3_Labels+0
	MOVWF       _Screen4+2 
	MOVLW       hi_addr(_Screen3_Labels+0)
	MOVWF       _Screen4+3 
;SmartGLCD_240x128_Demo_driver.c,478 :: 		Screen4.ImagesCount               = 0;
	CLRF        _Screen4+4 
	CLRF        _Screen4+5 
;SmartGLCD_240x128_Demo_driver.c,479 :: 		Screen4.CaptionButtonsCount       = 0;
	CLRF        _Screen4+8 
	CLRF        _Screen4+9 
;SmartGLCD_240x128_Demo_driver.c,480 :: 		Screen4.CaptionButtons_RoundCount = 1;
	MOVLW       1
	MOVWF       _Screen4+12 
	MOVLW       0
	MOVWF       _Screen4+13 
;SmartGLCD_240x128_Demo_driver.c,481 :: 		Screen4.CaptionButtons_Round      = Screen3_CaptionButtons_Round;
	MOVLW       _Screen3_CaptionButtons_Round+0
	MOVWF       _Screen4+14 
	MOVLW       hi_addr(_Screen3_CaptionButtons_Round+0)
	MOVWF       _Screen4+15 
;SmartGLCD_240x128_Demo_driver.c,482 :: 		Screen4.RectanglesCount           = 0;
	CLRF        _Screen4+16 
	CLRF        _Screen4+17 
;SmartGLCD_240x128_Demo_driver.c,483 :: 		Screen3_CaptionButtons_Round[0]   = &RoundCaptionButton5;
	MOVLW       _RoundCaptionButton5+0
	MOVWF       _Screen3_CaptionButtons_Round+0 
	MOVLW       hi_addr(_RoundCaptionButton5+0)
	MOVWF       _Screen3_CaptionButtons_Round+1 
;SmartGLCD_240x128_Demo_driver.c,484 :: 		Screen3_Labels[0]        = &Label16;
	MOVLW       _Label16+0
	MOVWF       _Screen3_Labels+0 
	MOVLW       hi_addr(_Label16+0)
	MOVWF       _Screen3_Labels+1 
;SmartGLCD_240x128_Demo_driver.c,485 :: 		Screen3_Labels[1]        = &Label17;
	MOVLW       _Label17+0
	MOVWF       _Screen3_Labels+2 
	MOVLW       hi_addr(_Label17+0)
	MOVWF       _Screen3_Labels+3 
;SmartGLCD_240x128_Demo_driver.c,486 :: 		Screen3_Labels[2]        = &Label18;
	MOVLW       _Label18+0
	MOVWF       _Screen3_Labels+4 
	MOVLW       hi_addr(_Label18+0)
	MOVWF       _Screen3_Labels+5 
;SmartGLCD_240x128_Demo_driver.c,487 :: 		Screen3_Labels[3]        = &Label19;
	MOVLW       _Label19+0
	MOVWF       _Screen3_Labels+6 
	MOVLW       hi_addr(_Label19+0)
	MOVWF       _Screen3_Labels+7 
;SmartGLCD_240x128_Demo_driver.c,488 :: 		Screen3_Labels[4]        = &Label20;
	MOVLW       _Label20+0
	MOVWF       _Screen3_Labels+8 
	MOVLW       hi_addr(_Label20+0)
	MOVWF       _Screen3_Labels+9 
;SmartGLCD_240x128_Demo_driver.c,489 :: 		Screen3_Labels[5]        = &Label21;
	MOVLW       _Label21+0
	MOVWF       _Screen3_Labels+10 
	MOVLW       hi_addr(_Label21+0)
	MOVWF       _Screen3_Labels+11 
;SmartGLCD_240x128_Demo_driver.c,490 :: 		Screen3_Labels[6]        = &Label22;
	MOVLW       _Label22+0
	MOVWF       _Screen3_Labels+12 
	MOVLW       hi_addr(_Label22+0)
	MOVWF       _Screen3_Labels+13 
;SmartGLCD_240x128_Demo_driver.c,492 :: 		Screen5.LabelsCount               = 3;
	MOVLW       3
	MOVWF       _Screen5+0 
	MOVLW       0
	MOVWF       _Screen5+1 
;SmartGLCD_240x128_Demo_driver.c,493 :: 		Screen5.Labels                    = Screen4_Labels;
	MOVLW       _Screen4_Labels+0
	MOVWF       _Screen5+2 
	MOVLW       hi_addr(_Screen4_Labels+0)
	MOVWF       _Screen5+3 
;SmartGLCD_240x128_Demo_driver.c,494 :: 		Screen5.ImagesCount               = 0;
	CLRF        _Screen5+4 
	CLRF        _Screen5+5 
;SmartGLCD_240x128_Demo_driver.c,495 :: 		Screen5.CaptionButtonsCount       = 0;
	CLRF        _Screen5+8 
	CLRF        _Screen5+9 
;SmartGLCD_240x128_Demo_driver.c,496 :: 		Screen5.CaptionButtons_RoundCount = 7;
	MOVLW       7
	MOVWF       _Screen5+12 
	MOVLW       0
	MOVWF       _Screen5+13 
;SmartGLCD_240x128_Demo_driver.c,497 :: 		Screen5.CaptionButtons_Round      = Screen4_CaptionButtons_Round;
	MOVLW       _Screen4_CaptionButtons_Round+0
	MOVWF       _Screen5+14 
	MOVLW       hi_addr(_Screen4_CaptionButtons_Round+0)
	MOVWF       _Screen5+15 
;SmartGLCD_240x128_Demo_driver.c,498 :: 		Screen5.RectanglesCount           = 0;
	CLRF        _Screen5+16 
	CLRF        _Screen5+17 
;SmartGLCD_240x128_Demo_driver.c,499 :: 		Screen4_CaptionButtons_Round[0]   = &RoundCaptionButton6;
	MOVLW       _RoundCaptionButton6+0
	MOVWF       _Screen4_CaptionButtons_Round+0 
	MOVLW       hi_addr(_RoundCaptionButton6+0)
	MOVWF       _Screen4_CaptionButtons_Round+1 
;SmartGLCD_240x128_Demo_driver.c,500 :: 		Screen4_CaptionButtons_Round[1]   = &RoundCaptionButton7;
	MOVLW       _RoundCaptionButton7+0
	MOVWF       _Screen4_CaptionButtons_Round+2 
	MOVLW       hi_addr(_RoundCaptionButton7+0)
	MOVWF       _Screen4_CaptionButtons_Round+3 
;SmartGLCD_240x128_Demo_driver.c,501 :: 		Screen4_CaptionButtons_Round[2]   = &RoundCaptionButton8;
	MOVLW       _RoundCaptionButton8+0
	MOVWF       _Screen4_CaptionButtons_Round+4 
	MOVLW       hi_addr(_RoundCaptionButton8+0)
	MOVWF       _Screen4_CaptionButtons_Round+5 
;SmartGLCD_240x128_Demo_driver.c,502 :: 		Screen4_CaptionButtons_Round[3]   = &RoundCaptionButton9;
	MOVLW       _RoundCaptionButton9+0
	MOVWF       _Screen4_CaptionButtons_Round+6 
	MOVLW       hi_addr(_RoundCaptionButton9+0)
	MOVWF       _Screen4_CaptionButtons_Round+7 
;SmartGLCD_240x128_Demo_driver.c,503 :: 		Screen4_Labels[0]        = &Label3;
	MOVLW       _Label3+0
	MOVWF       _Screen4_Labels+0 
	MOVLW       hi_addr(_Label3+0)
	MOVWF       _Screen4_Labels+1 
;SmartGLCD_240x128_Demo_driver.c,504 :: 		Screen4_Labels[1]        = &Label4;
	MOVLW       _Label4+0
	MOVWF       _Screen4_Labels+2 
	MOVLW       hi_addr(_Label4+0)
	MOVWF       _Screen4_Labels+3 
;SmartGLCD_240x128_Demo_driver.c,505 :: 		Screen4_Labels[2]        = &Label5;
	MOVLW       _Label5+0
	MOVWF       _Screen4_Labels+4 
	MOVLW       hi_addr(_Label5+0)
	MOVWF       _Screen4_Labels+5 
;SmartGLCD_240x128_Demo_driver.c,506 :: 		Screen4_CaptionButtons_Round[4]   = &RoundCaptionButton11;
	MOVLW       _RoundCaptionButton11+0
	MOVWF       _Screen4_CaptionButtons_Round+8 
	MOVLW       hi_addr(_RoundCaptionButton11+0)
	MOVWF       _Screen4_CaptionButtons_Round+9 
;SmartGLCD_240x128_Demo_driver.c,507 :: 		Screen4_CaptionButtons_Round[5]   = &RoundCaptionButton12;
	MOVLW       _RoundCaptionButton12+0
	MOVWF       _Screen4_CaptionButtons_Round+10 
	MOVLW       hi_addr(_RoundCaptionButton12+0)
	MOVWF       _Screen4_CaptionButtons_Round+11 
;SmartGLCD_240x128_Demo_driver.c,508 :: 		Screen4_CaptionButtons_Round[6]   = &RoundCaptionButton10;
	MOVLW       _RoundCaptionButton10+0
	MOVWF       _Screen4_CaptionButtons_Round+12 
	MOVLW       hi_addr(_RoundCaptionButton10+0)
	MOVWF       _Screen4_CaptionButtons_Round+13 
;SmartGLCD_240x128_Demo_driver.c,510 :: 		Screen6.LabelsCount               = 0;
	CLRF        _Screen6+0 
	CLRF        _Screen6+1 
;SmartGLCD_240x128_Demo_driver.c,511 :: 		Screen6.ImagesCount               = 0;
	CLRF        _Screen6+4 
	CLRF        _Screen6+5 
;SmartGLCD_240x128_Demo_driver.c,512 :: 		Screen6.CaptionButtonsCount       = 1;
	MOVLW       1
	MOVWF       _Screen6+8 
	MOVLW       0
	MOVWF       _Screen6+9 
;SmartGLCD_240x128_Demo_driver.c,513 :: 		Screen6.CaptionButtons            = Screen5_CaptionButtons;
	MOVLW       _Screen5_CaptionButtons+0
	MOVWF       _Screen6+10 
	MOVLW       hi_addr(_Screen5_CaptionButtons+0)
	MOVWF       _Screen6+11 
;SmartGLCD_240x128_Demo_driver.c,514 :: 		Screen6.CaptionButtons_RoundCount = 0;
	CLRF        _Screen6+12 
	CLRF        _Screen6+13 
;SmartGLCD_240x128_Demo_driver.c,515 :: 		Screen6.RectanglesCount           = 0;
	CLRF        _Screen6+16 
	CLRF        _Screen6+17 
;SmartGLCD_240x128_Demo_driver.c,516 :: 		Screen5_CaptionButtons[0]       = &CaptionButton28;
	MOVLW       _CaptionButton28+0
	MOVWF       _Screen5_CaptionButtons+0 
	MOVLW       hi_addr(_CaptionButton28+0)
	MOVWF       _Screen5_CaptionButtons+1 
;SmartGLCD_240x128_Demo_driver.c,519 :: 		Label1.OwnerScreen = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Label1+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Label1+1 
;SmartGLCD_240x128_Demo_driver.c,520 :: 		Label1.Left        = 0;
	CLRF        _Label1+2 
;SmartGLCD_240x128_Demo_driver.c,521 :: 		Label1.Top         = 24;
	MOVLW       24
	MOVWF       _Label1+3 
;SmartGLCD_240x128_Demo_driver.c,522 :: 		Label1.Width       = 144;
	MOVLW       144
	MOVWF       _Label1+4 
;SmartGLCD_240x128_Demo_driver.c,523 :: 		Label1.Height      = 8;
	MOVLW       8
	MOVWF       _Label1+5 
;SmartGLCD_240x128_Demo_driver.c,524 :: 		Label1.Caption     = Label1_Caption;
	MOVLW       _Label1_Caption+0
	MOVWF       _Label1+6 
	MOVLW       hi_addr(_Label1_Caption+0)
	MOVWF       _Label1+7 
;SmartGLCD_240x128_Demo_driver.c,525 :: 		Label1.FontName    = 0;
	CLRF        _Label1+8 
	CLRF        _Label1+9 
	CLRF        _Label1+10 
;SmartGLCD_240x128_Demo_driver.c,526 :: 		Label1.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label1+11 
;SmartGLCD_240x128_Demo_driver.c,527 :: 		Label1.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label1+12 
;SmartGLCD_240x128_Demo_driver.c,528 :: 		Label1.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label1+13 
;SmartGLCD_240x128_Demo_driver.c,529 :: 		Label1.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label1+14 
;SmartGLCD_240x128_Demo_driver.c,530 :: 		Label1.Visible     = 1;
	MOVLW       1
	MOVWF       _Label1+15 
;SmartGLCD_240x128_Demo_driver.c,531 :: 		Label1.OnUpPtr     = 0;
	CLRF        _Label1+16 
	CLRF        _Label1+17 
	CLRF        _Label1+18 
	CLRF        _Label1+19 
;SmartGLCD_240x128_Demo_driver.c,532 :: 		Label1.OnDownPtr   = 0;
	CLRF        _Label1+20 
	CLRF        _Label1+21 
	CLRF        _Label1+22 
	CLRF        _Label1+23 
;SmartGLCD_240x128_Demo_driver.c,533 :: 		Label1.OnClickPtr  = 0;
	CLRF        _Label1+24 
	CLRF        _Label1+25 
	CLRF        _Label1+26 
	CLRF        _Label1+27 
;SmartGLCD_240x128_Demo_driver.c,534 :: 		Label1.OnPressPtr  = 0;
	CLRF        _Label1+28 
	CLRF        _Label1+29 
	CLRF        _Label1+30 
	CLRF        _Label1+31 
;SmartGLCD_240x128_Demo_driver.c,536 :: 		Label2.OwnerScreen = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Label2+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Label2+1 
;SmartGLCD_240x128_Demo_driver.c,537 :: 		Label2.Left        = 0;
	CLRF        _Label2+2 
;SmartGLCD_240x128_Demo_driver.c,538 :: 		Label2.Top         = 40;
	MOVLW       40
	MOVWF       _Label2+3 
;SmartGLCD_240x128_Demo_driver.c,539 :: 		Label2.Width       = 152;
	MOVLW       152
	MOVWF       _Label2+4 
;SmartGLCD_240x128_Demo_driver.c,540 :: 		Label2.Height      = 8;
	MOVLW       8
	MOVWF       _Label2+5 
;SmartGLCD_240x128_Demo_driver.c,541 :: 		Label2.Caption     = Label2_Caption;
	MOVLW       _Label2_Caption+0
	MOVWF       _Label2+6 
	MOVLW       hi_addr(_Label2_Caption+0)
	MOVWF       _Label2+7 
;SmartGLCD_240x128_Demo_driver.c,542 :: 		Label2.FontName    = 0;
	CLRF        _Label2+8 
	CLRF        _Label2+9 
	CLRF        _Label2+10 
;SmartGLCD_240x128_Demo_driver.c,543 :: 		Label2.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label2+11 
;SmartGLCD_240x128_Demo_driver.c,544 :: 		Label2.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label2+12 
;SmartGLCD_240x128_Demo_driver.c,545 :: 		Label2.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label2+13 
;SmartGLCD_240x128_Demo_driver.c,546 :: 		Label2.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label2+14 
;SmartGLCD_240x128_Demo_driver.c,547 :: 		Label2.Visible     = 1;
	MOVLW       1
	MOVWF       _Label2+15 
;SmartGLCD_240x128_Demo_driver.c,548 :: 		Label2.OnUpPtr     = 0;
	CLRF        _Label2+16 
	CLRF        _Label2+17 
	CLRF        _Label2+18 
	CLRF        _Label2+19 
;SmartGLCD_240x128_Demo_driver.c,549 :: 		Label2.OnDownPtr   = 0;
	CLRF        _Label2+20 
	CLRF        _Label2+21 
	CLRF        _Label2+22 
	CLRF        _Label2+23 
;SmartGLCD_240x128_Demo_driver.c,550 :: 		Label2.OnClickPtr  = 0;
	CLRF        _Label2+24 
	CLRF        _Label2+25 
	CLRF        _Label2+26 
	CLRF        _Label2+27 
;SmartGLCD_240x128_Demo_driver.c,551 :: 		Label2.OnPressPtr  = 0;
	CLRF        _Label2+28 
	CLRF        _Label2+29 
	CLRF        _Label2+30 
	CLRF        _Label2+31 
;SmartGLCD_240x128_Demo_driver.c,553 :: 		RoundCaptionButton1.OwnerScreen  = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _RoundCaptionButton1+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _RoundCaptionButton1+1 
;SmartGLCD_240x128_Demo_driver.c,554 :: 		RoundCaptionButton1.Left         = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton1+2 
;SmartGLCD_240x128_Demo_driver.c,555 :: 		RoundCaptionButton1.Top          = 59;
	MOVLW       59
	MOVWF       _RoundCaptionButton1+3 
;SmartGLCD_240x128_Demo_driver.c,556 :: 		RoundCaptionButton1.Width        = 138;
	MOVLW       138
	MOVWF       _RoundCaptionButton1+4 
;SmartGLCD_240x128_Demo_driver.c,557 :: 		RoundCaptionButton1.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton1+5 
;SmartGLCD_240x128_Demo_driver.c,558 :: 		RoundCaptionButton1.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton1+6 
;SmartGLCD_240x128_Demo_driver.c,559 :: 		RoundCaptionButton1.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton1+7 
;SmartGLCD_240x128_Demo_driver.c,560 :: 		RoundCaptionButton1.Caption      = RoundCaptionButton1_Caption;
	MOVLW       _RoundCaptionButton1_Caption+0
	MOVWF       _RoundCaptionButton1+8 
	MOVLW       hi_addr(_RoundCaptionButton1_Caption+0)
	MOVWF       _RoundCaptionButton1+9 
;SmartGLCD_240x128_Demo_driver.c,561 :: 		RoundCaptionButton1.FontName    = 0;
	CLRF        _RoundCaptionButton1+10 
	CLRF        _RoundCaptionButton1+11 
	CLRF        _RoundCaptionButton1+12 
;SmartGLCD_240x128_Demo_driver.c,562 :: 		RoundCaptionButton1.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton1+13 
;SmartGLCD_240x128_Demo_driver.c,563 :: 		RoundCaptionButton1.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton1+14 
;SmartGLCD_240x128_Demo_driver.c,564 :: 		RoundCaptionButton1.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton1+15 
;SmartGLCD_240x128_Demo_driver.c,565 :: 		RoundCaptionButton1.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton1+16 
;SmartGLCD_240x128_Demo_driver.c,566 :: 		RoundCaptionButton1.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton1+17 
;SmartGLCD_240x128_Demo_driver.c,567 :: 		RoundCaptionButton1.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton1+18 
	CLRF        _RoundCaptionButton1+19 
	CLRF        _RoundCaptionButton1+20 
	CLRF        _RoundCaptionButton1+21 
;SmartGLCD_240x128_Demo_driver.c,568 :: 		RoundCaptionButton1.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton1+22 
	CLRF        _RoundCaptionButton1+23 
	CLRF        _RoundCaptionButton1+24 
	CLRF        _RoundCaptionButton1+25 
;SmartGLCD_240x128_Demo_driver.c,569 :: 		RoundCaptionButton1.OnClickPtr  = RoundCaptionButton1Click;
	MOVLW       _RoundCaptionButton1Click+0
	MOVWF       _RoundCaptionButton1+26 
	MOVLW       hi_addr(_RoundCaptionButton1Click+0)
	MOVWF       _RoundCaptionButton1+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton1+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton1+29 
;SmartGLCD_240x128_Demo_driver.c,570 :: 		RoundCaptionButton1.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton1+30 
	CLRF        _RoundCaptionButton1+31 
	CLRF        _RoundCaptionButton1+32 
	CLRF        _RoundCaptionButton1+33 
;SmartGLCD_240x128_Demo_driver.c,572 :: 		RoundCaptionButton2.OwnerScreen  = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _RoundCaptionButton2+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _RoundCaptionButton2+1 
;SmartGLCD_240x128_Demo_driver.c,573 :: 		RoundCaptionButton2.Left         = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton2+2 
;SmartGLCD_240x128_Demo_driver.c,574 :: 		RoundCaptionButton2.Top          = 83;
	MOVLW       83
	MOVWF       _RoundCaptionButton2+3 
;SmartGLCD_240x128_Demo_driver.c,575 :: 		RoundCaptionButton2.Width        = 138;
	MOVLW       138
	MOVWF       _RoundCaptionButton2+4 
;SmartGLCD_240x128_Demo_driver.c,576 :: 		RoundCaptionButton2.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton2+5 
;SmartGLCD_240x128_Demo_driver.c,577 :: 		RoundCaptionButton2.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton2+6 
;SmartGLCD_240x128_Demo_driver.c,578 :: 		RoundCaptionButton2.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton2+7 
;SmartGLCD_240x128_Demo_driver.c,579 :: 		RoundCaptionButton2.Caption      = RoundCaptionButton2_Caption;
	MOVLW       _RoundCaptionButton2_Caption+0
	MOVWF       _RoundCaptionButton2+8 
	MOVLW       hi_addr(_RoundCaptionButton2_Caption+0)
	MOVWF       _RoundCaptionButton2+9 
;SmartGLCD_240x128_Demo_driver.c,580 :: 		RoundCaptionButton2.FontName    = 0;
	CLRF        _RoundCaptionButton2+10 
	CLRF        _RoundCaptionButton2+11 
	CLRF        _RoundCaptionButton2+12 
;SmartGLCD_240x128_Demo_driver.c,581 :: 		RoundCaptionButton2.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton2+13 
;SmartGLCD_240x128_Demo_driver.c,582 :: 		RoundCaptionButton2.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton2+14 
;SmartGLCD_240x128_Demo_driver.c,583 :: 		RoundCaptionButton2.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton2+15 
;SmartGLCD_240x128_Demo_driver.c,584 :: 		RoundCaptionButton2.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton2+16 
;SmartGLCD_240x128_Demo_driver.c,585 :: 		RoundCaptionButton2.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton2+17 
;SmartGLCD_240x128_Demo_driver.c,586 :: 		RoundCaptionButton2.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton2+18 
	CLRF        _RoundCaptionButton2+19 
	CLRF        _RoundCaptionButton2+20 
	CLRF        _RoundCaptionButton2+21 
;SmartGLCD_240x128_Demo_driver.c,587 :: 		RoundCaptionButton2.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton2+22 
	CLRF        _RoundCaptionButton2+23 
	CLRF        _RoundCaptionButton2+24 
	CLRF        _RoundCaptionButton2+25 
;SmartGLCD_240x128_Demo_driver.c,588 :: 		RoundCaptionButton2.OnClickPtr  = RoundCaptionButton2Click;
	MOVLW       _RoundCaptionButton2Click+0
	MOVWF       _RoundCaptionButton2+26 
	MOVLW       hi_addr(_RoundCaptionButton2Click+0)
	MOVWF       _RoundCaptionButton2+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton2+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton2+29 
;SmartGLCD_240x128_Demo_driver.c,589 :: 		RoundCaptionButton2.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton2+30 
	CLRF        _RoundCaptionButton2+31 
	CLRF        _RoundCaptionButton2+32 
	CLRF        _RoundCaptionButton2+33 
;SmartGLCD_240x128_Demo_driver.c,591 :: 		Image2.OwnerScreen = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _Image2+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _Image2+1 
;SmartGLCD_240x128_Demo_driver.c,592 :: 		Image2.Left       = 177;
	MOVLW       177
	MOVWF       _Image2+2 
;SmartGLCD_240x128_Demo_driver.c,593 :: 		Image2.Top        = 6;
	MOVLW       6
	MOVWF       _Image2+3 
;SmartGLCD_240x128_Demo_driver.c,594 :: 		Image2.Width      = 55;
	MOVLW       55
	MOVWF       _Image2+4 
;SmartGLCD_240x128_Demo_driver.c,595 :: 		Image2.Height     = 54;
	MOVLW       54
	MOVWF       _Image2+5 
;SmartGLCD_240x128_Demo_driver.c,596 :: 		Image2.PictureWidth  = 55;
	MOVLW       55
	MOVWF       _Image2+6 
;SmartGLCD_240x128_Demo_driver.c,597 :: 		Image2.PictureHeight = 54;
	MOVLW       54
	MOVWF       _Image2+7 
;SmartGLCD_240x128_Demo_driver.c,598 :: 		Image2.PictureName = mikro_logo;
	MOVLW       _mikro_logo+0
	MOVWF       _Image2+8 
	MOVLW       hi_addr(_mikro_logo+0)
	MOVWF       _Image2+9 
	MOVLW       higher_addr(_mikro_logo+0)
	MOVWF       _Image2+10 
;SmartGLCD_240x128_Demo_driver.c,599 :: 		Image2.Visible    = 1;
	MOVLW       1
	MOVWF       _Image2+11 
;SmartGLCD_240x128_Demo_driver.c,600 :: 		Image2.AutoSize   = 0;
	CLRF        _Image2+12 
;SmartGLCD_240x128_Demo_driver.c,601 :: 		Image2.OnUpPtr     = 0;
	CLRF        _Image2+13 
	CLRF        _Image2+14 
	CLRF        _Image2+15 
	CLRF        _Image2+16 
;SmartGLCD_240x128_Demo_driver.c,602 :: 		Image2.OnDownPtr   = 0;
	CLRF        _Image2+17 
	CLRF        _Image2+18 
	CLRF        _Image2+19 
	CLRF        _Image2+20 
;SmartGLCD_240x128_Demo_driver.c,603 :: 		Image2.OnClickPtr  = 0;
	CLRF        _Image2+21 
	CLRF        _Image2+22 
	CLRF        _Image2+23 
	CLRF        _Image2+24 
;SmartGLCD_240x128_Demo_driver.c,604 :: 		Image2.OnPressPtr  = 0;
	CLRF        _Image2+25 
	CLRF        _Image2+26 
	CLRF        _Image2+27 
	CLRF        _Image2+28 
;SmartGLCD_240x128_Demo_driver.c,606 :: 		RoundCaptionButton14.OwnerScreen  = &Screen1;
	MOVLW       _Screen1+0
	MOVWF       _RoundCaptionButton14+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       _RoundCaptionButton14+1 
;SmartGLCD_240x128_Demo_driver.c,607 :: 		RoundCaptionButton14.Left         = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton14+2 
;SmartGLCD_240x128_Demo_driver.c,608 :: 		RoundCaptionButton14.Top          = 107;
	MOVLW       107
	MOVWF       _RoundCaptionButton14+3 
;SmartGLCD_240x128_Demo_driver.c,609 :: 		RoundCaptionButton14.Width        = 138;
	MOVLW       138
	MOVWF       _RoundCaptionButton14+4 
;SmartGLCD_240x128_Demo_driver.c,610 :: 		RoundCaptionButton14.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton14+5 
;SmartGLCD_240x128_Demo_driver.c,611 :: 		RoundCaptionButton14.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton14+6 
;SmartGLCD_240x128_Demo_driver.c,612 :: 		RoundCaptionButton14.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton14+7 
;SmartGLCD_240x128_Demo_driver.c,613 :: 		RoundCaptionButton14.Caption      = RoundCaptionButton14_Caption;
	MOVLW       _RoundCaptionButton14_Caption+0
	MOVWF       _RoundCaptionButton14+8 
	MOVLW       hi_addr(_RoundCaptionButton14_Caption+0)
	MOVWF       _RoundCaptionButton14+9 
;SmartGLCD_240x128_Demo_driver.c,614 :: 		RoundCaptionButton14.FontName    = 0;
	CLRF        _RoundCaptionButton14+10 
	CLRF        _RoundCaptionButton14+11 
	CLRF        _RoundCaptionButton14+12 
;SmartGLCD_240x128_Demo_driver.c,615 :: 		RoundCaptionButton14.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton14+13 
;SmartGLCD_240x128_Demo_driver.c,616 :: 		RoundCaptionButton14.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton14+14 
;SmartGLCD_240x128_Demo_driver.c,617 :: 		RoundCaptionButton14.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton14+15 
;SmartGLCD_240x128_Demo_driver.c,618 :: 		RoundCaptionButton14.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton14+16 
;SmartGLCD_240x128_Demo_driver.c,619 :: 		RoundCaptionButton14.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton14+17 
;SmartGLCD_240x128_Demo_driver.c,620 :: 		RoundCaptionButton14.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton14+18 
	CLRF        _RoundCaptionButton14+19 
	CLRF        _RoundCaptionButton14+20 
	CLRF        _RoundCaptionButton14+21 
;SmartGLCD_240x128_Demo_driver.c,621 :: 		RoundCaptionButton14.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton14+22 
	CLRF        _RoundCaptionButton14+23 
	CLRF        _RoundCaptionButton14+24 
	CLRF        _RoundCaptionButton14+25 
;SmartGLCD_240x128_Demo_driver.c,622 :: 		RoundCaptionButton14.OnClickPtr  = RoundCaptionButton14Click;
	MOVLW       _RoundCaptionButton14Click+0
	MOVWF       _RoundCaptionButton14+26 
	MOVLW       hi_addr(_RoundCaptionButton14Click+0)
	MOVWF       _RoundCaptionButton14+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton14+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton14+29 
;SmartGLCD_240x128_Demo_driver.c,623 :: 		RoundCaptionButton14.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton14+30 
	CLRF        _RoundCaptionButton14+31 
	CLRF        _RoundCaptionButton14+32 
	CLRF        _RoundCaptionButton14+33 
;SmartGLCD_240x128_Demo_driver.c,625 :: 		RoundCaptionButton3.OwnerScreen  = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _RoundCaptionButton3+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _RoundCaptionButton3+1 
;SmartGLCD_240x128_Demo_driver.c,626 :: 		RoundCaptionButton3.Left         = 187;
	MOVLW       187
	MOVWF       _RoundCaptionButton3+2 
;SmartGLCD_240x128_Demo_driver.c,627 :: 		RoundCaptionButton3.Top          = 99;
	MOVLW       99
	MOVWF       _RoundCaptionButton3+3 
;SmartGLCD_240x128_Demo_driver.c,628 :: 		RoundCaptionButton3.Width        = 42;
	MOVLW       42
	MOVWF       _RoundCaptionButton3+4 
;SmartGLCD_240x128_Demo_driver.c,629 :: 		RoundCaptionButton3.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton3+5 
;SmartGLCD_240x128_Demo_driver.c,630 :: 		RoundCaptionButton3.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton3+6 
;SmartGLCD_240x128_Demo_driver.c,631 :: 		RoundCaptionButton3.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton3+7 
;SmartGLCD_240x128_Demo_driver.c,632 :: 		RoundCaptionButton3.Caption      = RoundCaptionButton3_Caption;
	MOVLW       _RoundCaptionButton3_Caption+0
	MOVWF       _RoundCaptionButton3+8 
	MOVLW       hi_addr(_RoundCaptionButton3_Caption+0)
	MOVWF       _RoundCaptionButton3+9 
;SmartGLCD_240x128_Demo_driver.c,633 :: 		RoundCaptionButton3.FontName    = 0;
	CLRF        _RoundCaptionButton3+10 
	CLRF        _RoundCaptionButton3+11 
	CLRF        _RoundCaptionButton3+12 
;SmartGLCD_240x128_Demo_driver.c,634 :: 		RoundCaptionButton3.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton3+13 
;SmartGLCD_240x128_Demo_driver.c,635 :: 		RoundCaptionButton3.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton3+14 
;SmartGLCD_240x128_Demo_driver.c,636 :: 		RoundCaptionButton3.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton3+15 
;SmartGLCD_240x128_Demo_driver.c,637 :: 		RoundCaptionButton3.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton3+16 
;SmartGLCD_240x128_Demo_driver.c,638 :: 		RoundCaptionButton3.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton3+17 
;SmartGLCD_240x128_Demo_driver.c,639 :: 		RoundCaptionButton3.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton3+18 
	CLRF        _RoundCaptionButton3+19 
	CLRF        _RoundCaptionButton3+20 
	CLRF        _RoundCaptionButton3+21 
;SmartGLCD_240x128_Demo_driver.c,640 :: 		RoundCaptionButton3.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton3+22 
	CLRF        _RoundCaptionButton3+23 
	CLRF        _RoundCaptionButton3+24 
	CLRF        _RoundCaptionButton3+25 
;SmartGLCD_240x128_Demo_driver.c,641 :: 		RoundCaptionButton3.OnClickPtr  = RoundCaptionButton3Click;
	MOVLW       _RoundCaptionButton3Click+0
	MOVWF       _RoundCaptionButton3+26 
	MOVLW       hi_addr(_RoundCaptionButton3Click+0)
	MOVWF       _RoundCaptionButton3+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton3+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton3+29 
;SmartGLCD_240x128_Demo_driver.c,642 :: 		RoundCaptionButton3.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton3+30 
	CLRF        _RoundCaptionButton3+31 
	CLRF        _RoundCaptionButton3+32 
	CLRF        _RoundCaptionButton3+33 
;SmartGLCD_240x128_Demo_driver.c,644 :: 		Label8.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label8+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label8+1 
;SmartGLCD_240x128_Demo_driver.c,645 :: 		Label8.Left        = 8;
	MOVLW       8
	MOVWF       _Label8+2 
;SmartGLCD_240x128_Demo_driver.c,646 :: 		Label8.Top         = 24;
	MOVLW       24
	MOVWF       _Label8+3 
;SmartGLCD_240x128_Demo_driver.c,647 :: 		Label8.Width       = 208;
	MOVLW       208
	MOVWF       _Label8+4 
;SmartGLCD_240x128_Demo_driver.c,648 :: 		Label8.Height      = 8;
	MOVLW       8
	MOVWF       _Label8+5 
;SmartGLCD_240x128_Demo_driver.c,649 :: 		Label8.Caption     = Label8_Caption;
	MOVLW       _Label8_Caption+0
	MOVWF       _Label8+6 
	MOVLW       hi_addr(_Label8_Caption+0)
	MOVWF       _Label8+7 
;SmartGLCD_240x128_Demo_driver.c,650 :: 		Label8.FontName    = 0;
	CLRF        _Label8+8 
	CLRF        _Label8+9 
	CLRF        _Label8+10 
;SmartGLCD_240x128_Demo_driver.c,651 :: 		Label8.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label8+11 
;SmartGLCD_240x128_Demo_driver.c,652 :: 		Label8.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label8+12 
;SmartGLCD_240x128_Demo_driver.c,653 :: 		Label8.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label8+13 
;SmartGLCD_240x128_Demo_driver.c,654 :: 		Label8.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label8+14 
;SmartGLCD_240x128_Demo_driver.c,655 :: 		Label8.Visible     = 1;
	MOVLW       1
	MOVWF       _Label8+15 
;SmartGLCD_240x128_Demo_driver.c,656 :: 		Label8.OnUpPtr     = 0;
	CLRF        _Label8+16 
	CLRF        _Label8+17 
	CLRF        _Label8+18 
	CLRF        _Label8+19 
;SmartGLCD_240x128_Demo_driver.c,657 :: 		Label8.OnDownPtr   = 0;
	CLRF        _Label8+20 
	CLRF        _Label8+21 
	CLRF        _Label8+22 
	CLRF        _Label8+23 
;SmartGLCD_240x128_Demo_driver.c,658 :: 		Label8.OnClickPtr  = 0;
	CLRF        _Label8+24 
	CLRF        _Label8+25 
	CLRF        _Label8+26 
	CLRF        _Label8+27 
;SmartGLCD_240x128_Demo_driver.c,659 :: 		Label8.OnPressPtr  = 0;
	CLRF        _Label8+28 
	CLRF        _Label8+29 
	CLRF        _Label8+30 
	CLRF        _Label8+31 
;SmartGLCD_240x128_Demo_driver.c,661 :: 		Label9.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label9+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label9+1 
;SmartGLCD_240x128_Demo_driver.c,662 :: 		Label9.Left        = 8;
	MOVLW       8
	MOVWF       _Label9+2 
;SmartGLCD_240x128_Demo_driver.c,663 :: 		Label9.Top         = 32;
	MOVLW       32
	MOVWF       _Label9+3 
;SmartGLCD_240x128_Demo_driver.c,664 :: 		Label9.Width       = 208;
	MOVLW       208
	MOVWF       _Label9+4 
;SmartGLCD_240x128_Demo_driver.c,665 :: 		Label9.Height      = 8;
	MOVLW       8
	MOVWF       _Label9+5 
;SmartGLCD_240x128_Demo_driver.c,666 :: 		Label9.Caption     = Label9_Caption;
	MOVLW       _Label9_Caption+0
	MOVWF       _Label9+6 
	MOVLW       hi_addr(_Label9_Caption+0)
	MOVWF       _Label9+7 
;SmartGLCD_240x128_Demo_driver.c,667 :: 		Label9.FontName    = 0;
	CLRF        _Label9+8 
	CLRF        _Label9+9 
	CLRF        _Label9+10 
;SmartGLCD_240x128_Demo_driver.c,668 :: 		Label9.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label9+11 
;SmartGLCD_240x128_Demo_driver.c,669 :: 		Label9.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label9+12 
;SmartGLCD_240x128_Demo_driver.c,670 :: 		Label9.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label9+13 
;SmartGLCD_240x128_Demo_driver.c,671 :: 		Label9.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label9+14 
;SmartGLCD_240x128_Demo_driver.c,672 :: 		Label9.Visible     = 1;
	MOVLW       1
	MOVWF       _Label9+15 
;SmartGLCD_240x128_Demo_driver.c,673 :: 		Label9.OnUpPtr     = 0;
	CLRF        _Label9+16 
	CLRF        _Label9+17 
	CLRF        _Label9+18 
	CLRF        _Label9+19 
;SmartGLCD_240x128_Demo_driver.c,674 :: 		Label9.OnDownPtr   = 0;
	CLRF        _Label9+20 
	CLRF        _Label9+21 
	CLRF        _Label9+22 
	CLRF        _Label9+23 
;SmartGLCD_240x128_Demo_driver.c,675 :: 		Label9.OnClickPtr  = 0;
	CLRF        _Label9+24 
	CLRF        _Label9+25 
	CLRF        _Label9+26 
	CLRF        _Label9+27 
;SmartGLCD_240x128_Demo_driver.c,676 :: 		Label9.OnPressPtr  = 0;
	CLRF        _Label9+28 
	CLRF        _Label9+29 
	CLRF        _Label9+30 
	CLRF        _Label9+31 
;SmartGLCD_240x128_Demo_driver.c,678 :: 		Label10.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label10+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label10+1 
;SmartGLCD_240x128_Demo_driver.c,679 :: 		Label10.Left        = 8;
	MOVLW       8
	MOVWF       _Label10+2 
;SmartGLCD_240x128_Demo_driver.c,680 :: 		Label10.Top         = 40;
	MOVLW       40
	MOVWF       _Label10+3 
;SmartGLCD_240x128_Demo_driver.c,681 :: 		Label10.Width       = 216;
	MOVLW       216
	MOVWF       _Label10+4 
;SmartGLCD_240x128_Demo_driver.c,682 :: 		Label10.Height      = 8;
	MOVLW       8
	MOVWF       _Label10+5 
;SmartGLCD_240x128_Demo_driver.c,683 :: 		Label10.Caption     = Label10_Caption;
	MOVLW       _Label10_Caption+0
	MOVWF       _Label10+6 
	MOVLW       hi_addr(_Label10_Caption+0)
	MOVWF       _Label10+7 
;SmartGLCD_240x128_Demo_driver.c,684 :: 		Label10.FontName    = 0;
	CLRF        _Label10+8 
	CLRF        _Label10+9 
	CLRF        _Label10+10 
;SmartGLCD_240x128_Demo_driver.c,685 :: 		Label10.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label10+11 
;SmartGLCD_240x128_Demo_driver.c,686 :: 		Label10.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label10+12 
;SmartGLCD_240x128_Demo_driver.c,687 :: 		Label10.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label10+13 
;SmartGLCD_240x128_Demo_driver.c,688 :: 		Label10.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label10+14 
;SmartGLCD_240x128_Demo_driver.c,689 :: 		Label10.Visible     = 1;
	MOVLW       1
	MOVWF       _Label10+15 
;SmartGLCD_240x128_Demo_driver.c,690 :: 		Label10.OnUpPtr     = 0;
	CLRF        _Label10+16 
	CLRF        _Label10+17 
	CLRF        _Label10+18 
	CLRF        _Label10+19 
;SmartGLCD_240x128_Demo_driver.c,691 :: 		Label10.OnDownPtr   = 0;
	CLRF        _Label10+20 
	CLRF        _Label10+21 
	CLRF        _Label10+22 
	CLRF        _Label10+23 
;SmartGLCD_240x128_Demo_driver.c,692 :: 		Label10.OnClickPtr  = 0;
	CLRF        _Label10+24 
	CLRF        _Label10+25 
	CLRF        _Label10+26 
	CLRF        _Label10+27 
;SmartGLCD_240x128_Demo_driver.c,693 :: 		Label10.OnPressPtr  = 0;
	CLRF        _Label10+28 
	CLRF        _Label10+29 
	CLRF        _Label10+30 
	CLRF        _Label10+31 
;SmartGLCD_240x128_Demo_driver.c,695 :: 		Label11.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label11+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label11+1 
;SmartGLCD_240x128_Demo_driver.c,696 :: 		Label11.Left        = 8;
	MOVLW       8
	MOVWF       _Label11+2 
;SmartGLCD_240x128_Demo_driver.c,697 :: 		Label11.Top         = 48;
	MOVLW       48
	MOVWF       _Label11+3 
;SmartGLCD_240x128_Demo_driver.c,698 :: 		Label11.Width       = 160;
	MOVLW       160
	MOVWF       _Label11+4 
;SmartGLCD_240x128_Demo_driver.c,699 :: 		Label11.Height      = 8;
	MOVLW       8
	MOVWF       _Label11+5 
;SmartGLCD_240x128_Demo_driver.c,700 :: 		Label11.Caption     = Label11_Caption;
	MOVLW       _Label11_Caption+0
	MOVWF       _Label11+6 
	MOVLW       hi_addr(_Label11_Caption+0)
	MOVWF       _Label11+7 
;SmartGLCD_240x128_Demo_driver.c,701 :: 		Label11.FontName    = 0;
	CLRF        _Label11+8 
	CLRF        _Label11+9 
	CLRF        _Label11+10 
;SmartGLCD_240x128_Demo_driver.c,702 :: 		Label11.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label11+11 
;SmartGLCD_240x128_Demo_driver.c,703 :: 		Label11.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label11+12 
;SmartGLCD_240x128_Demo_driver.c,704 :: 		Label11.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label11+13 
;SmartGLCD_240x128_Demo_driver.c,705 :: 		Label11.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label11+14 
;SmartGLCD_240x128_Demo_driver.c,706 :: 		Label11.Visible     = 1;
	MOVLW       1
	MOVWF       _Label11+15 
;SmartGLCD_240x128_Demo_driver.c,707 :: 		Label11.OnUpPtr     = 0;
	CLRF        _Label11+16 
	CLRF        _Label11+17 
	CLRF        _Label11+18 
	CLRF        _Label11+19 
;SmartGLCD_240x128_Demo_driver.c,708 :: 		Label11.OnDownPtr   = 0;
	CLRF        _Label11+20 
	CLRF        _Label11+21 
	CLRF        _Label11+22 
	CLRF        _Label11+23 
;SmartGLCD_240x128_Demo_driver.c,709 :: 		Label11.OnClickPtr  = 0;
	CLRF        _Label11+24 
	CLRF        _Label11+25 
	CLRF        _Label11+26 
	CLRF        _Label11+27 
;SmartGLCD_240x128_Demo_driver.c,710 :: 		Label11.OnPressPtr  = 0;
	CLRF        _Label11+28 
	CLRF        _Label11+29 
	CLRF        _Label11+30 
	CLRF        _Label11+31 
;SmartGLCD_240x128_Demo_driver.c,712 :: 		Label12.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label12+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label12+1 
;SmartGLCD_240x128_Demo_driver.c,713 :: 		Label12.Left        = 8;
	MOVLW       8
	MOVWF       _Label12+2 
;SmartGLCD_240x128_Demo_driver.c,714 :: 		Label12.Top         = 56;
	MOVLW       56
	MOVWF       _Label12+3 
;SmartGLCD_240x128_Demo_driver.c,715 :: 		Label12.Width       = 224;
	MOVLW       224
	MOVWF       _Label12+4 
;SmartGLCD_240x128_Demo_driver.c,716 :: 		Label12.Height      = 8;
	MOVLW       8
	MOVWF       _Label12+5 
;SmartGLCD_240x128_Demo_driver.c,717 :: 		Label12.Caption     = Label12_Caption;
	MOVLW       _Label12_Caption+0
	MOVWF       _Label12+6 
	MOVLW       hi_addr(_Label12_Caption+0)
	MOVWF       _Label12+7 
;SmartGLCD_240x128_Demo_driver.c,718 :: 		Label12.FontName    = 0;
	CLRF        _Label12+8 
	CLRF        _Label12+9 
	CLRF        _Label12+10 
;SmartGLCD_240x128_Demo_driver.c,719 :: 		Label12.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label12+11 
;SmartGLCD_240x128_Demo_driver.c,720 :: 		Label12.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label12+12 
;SmartGLCD_240x128_Demo_driver.c,721 :: 		Label12.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label12+13 
;SmartGLCD_240x128_Demo_driver.c,722 :: 		Label12.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label12+14 
;SmartGLCD_240x128_Demo_driver.c,723 :: 		Label12.Visible     = 1;
	MOVLW       1
	MOVWF       _Label12+15 
;SmartGLCD_240x128_Demo_driver.c,724 :: 		Label12.OnUpPtr     = 0;
	CLRF        _Label12+16 
	CLRF        _Label12+17 
	CLRF        _Label12+18 
	CLRF        _Label12+19 
;SmartGLCD_240x128_Demo_driver.c,725 :: 		Label12.OnDownPtr   = 0;
	CLRF        _Label12+20 
	CLRF        _Label12+21 
	CLRF        _Label12+22 
	CLRF        _Label12+23 
;SmartGLCD_240x128_Demo_driver.c,726 :: 		Label12.OnClickPtr  = 0;
	CLRF        _Label12+24 
	CLRF        _Label12+25 
	CLRF        _Label12+26 
	CLRF        _Label12+27 
;SmartGLCD_240x128_Demo_driver.c,727 :: 		Label12.OnPressPtr  = 0;
	CLRF        _Label12+28 
	CLRF        _Label12+29 
	CLRF        _Label12+30 
	CLRF        _Label12+31 
;SmartGLCD_240x128_Demo_driver.c,729 :: 		Label13.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label13+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label13+1 
;SmartGLCD_240x128_Demo_driver.c,730 :: 		Label13.Left        = 8;
	MOVLW       8
	MOVWF       _Label13+2 
;SmartGLCD_240x128_Demo_driver.c,731 :: 		Label13.Top         = 64;
	MOVLW       64
	MOVWF       _Label13+3 
;SmartGLCD_240x128_Demo_driver.c,732 :: 		Label13.Width       = 224;
	MOVLW       224
	MOVWF       _Label13+4 
;SmartGLCD_240x128_Demo_driver.c,733 :: 		Label13.Height      = 8;
	MOVLW       8
	MOVWF       _Label13+5 
;SmartGLCD_240x128_Demo_driver.c,734 :: 		Label13.Caption     = Label13_Caption;
	MOVLW       _Label13_Caption+0
	MOVWF       _Label13+6 
	MOVLW       hi_addr(_Label13_Caption+0)
	MOVWF       _Label13+7 
;SmartGLCD_240x128_Demo_driver.c,735 :: 		Label13.FontName    = 0;
	CLRF        _Label13+8 
	CLRF        _Label13+9 
	CLRF        _Label13+10 
;SmartGLCD_240x128_Demo_driver.c,736 :: 		Label13.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label13+11 
;SmartGLCD_240x128_Demo_driver.c,737 :: 		Label13.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label13+12 
;SmartGLCD_240x128_Demo_driver.c,738 :: 		Label13.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label13+13 
;SmartGLCD_240x128_Demo_driver.c,739 :: 		Label13.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label13+14 
;SmartGLCD_240x128_Demo_driver.c,740 :: 		Label13.Visible     = 1;
	MOVLW       1
	MOVWF       _Label13+15 
;SmartGLCD_240x128_Demo_driver.c,741 :: 		Label13.OnUpPtr     = 0;
	CLRF        _Label13+16 
	CLRF        _Label13+17 
	CLRF        _Label13+18 
	CLRF        _Label13+19 
;SmartGLCD_240x128_Demo_driver.c,742 :: 		Label13.OnDownPtr   = 0;
	CLRF        _Label13+20 
	CLRF        _Label13+21 
	CLRF        _Label13+22 
	CLRF        _Label13+23 
;SmartGLCD_240x128_Demo_driver.c,743 :: 		Label13.OnClickPtr  = 0;
	CLRF        _Label13+24 
	CLRF        _Label13+25 
	CLRF        _Label13+26 
	CLRF        _Label13+27 
;SmartGLCD_240x128_Demo_driver.c,744 :: 		Label13.OnPressPtr  = 0;
	CLRF        _Label13+28 
	CLRF        _Label13+29 
	CLRF        _Label13+30 
	CLRF        _Label13+31 
;SmartGLCD_240x128_Demo_driver.c,746 :: 		Label14.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label14+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label14+1 
;SmartGLCD_240x128_Demo_driver.c,747 :: 		Label14.Left        = 8;
	MOVLW       8
	MOVWF       _Label14+2 
;SmartGLCD_240x128_Demo_driver.c,748 :: 		Label14.Top         = 72;
	MOVLW       72
	MOVWF       _Label14+3 
;SmartGLCD_240x128_Demo_driver.c,749 :: 		Label14.Width       = 144;
	MOVLW       144
	MOVWF       _Label14+4 
;SmartGLCD_240x128_Demo_driver.c,750 :: 		Label14.Height      = 8;
	MOVLW       8
	MOVWF       _Label14+5 
;SmartGLCD_240x128_Demo_driver.c,751 :: 		Label14.Caption     = Label14_Caption;
	MOVLW       _Label14_Caption+0
	MOVWF       _Label14+6 
	MOVLW       hi_addr(_Label14_Caption+0)
	MOVWF       _Label14+7 
;SmartGLCD_240x128_Demo_driver.c,752 :: 		Label14.FontName    = 0;
	CLRF        _Label14+8 
	CLRF        _Label14+9 
	CLRF        _Label14+10 
;SmartGLCD_240x128_Demo_driver.c,753 :: 		Label14.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label14+11 
;SmartGLCD_240x128_Demo_driver.c,754 :: 		Label14.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label14+12 
;SmartGLCD_240x128_Demo_driver.c,755 :: 		Label14.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label14+13 
;SmartGLCD_240x128_Demo_driver.c,756 :: 		Label14.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label14+14 
;SmartGLCD_240x128_Demo_driver.c,757 :: 		Label14.Visible     = 1;
	MOVLW       1
	MOVWF       _Label14+15 
;SmartGLCD_240x128_Demo_driver.c,758 :: 		Label14.OnUpPtr     = 0;
	CLRF        _Label14+16 
	CLRF        _Label14+17 
	CLRF        _Label14+18 
	CLRF        _Label14+19 
;SmartGLCD_240x128_Demo_driver.c,759 :: 		Label14.OnDownPtr   = 0;
	CLRF        _Label14+20 
	CLRF        _Label14+21 
	CLRF        _Label14+22 
	CLRF        _Label14+23 
;SmartGLCD_240x128_Demo_driver.c,760 :: 		Label14.OnClickPtr  = 0;
	CLRF        _Label14+24 
	CLRF        _Label14+25 
	CLRF        _Label14+26 
	CLRF        _Label14+27 
;SmartGLCD_240x128_Demo_driver.c,761 :: 		Label14.OnPressPtr  = 0;
	CLRF        _Label14+28 
	CLRF        _Label14+29 
	CLRF        _Label14+30 
	CLRF        _Label14+31 
;SmartGLCD_240x128_Demo_driver.c,763 :: 		Label15.OwnerScreen = &Screen2;
	MOVLW       _Screen2+0
	MOVWF       _Label15+0 
	MOVLW       hi_addr(_Screen2+0)
	MOVWF       _Label15+1 
;SmartGLCD_240x128_Demo_driver.c,764 :: 		Label15.Left        = 88;
	MOVLW       88
	MOVWF       _Label15+2 
;SmartGLCD_240x128_Demo_driver.c,765 :: 		Label15.Top         = 8;
	MOVLW       8
	MOVWF       _Label15+3 
;SmartGLCD_240x128_Demo_driver.c,766 :: 		Label15.Width       = 40;
	MOVLW       40
	MOVWF       _Label15+4 
;SmartGLCD_240x128_Demo_driver.c,767 :: 		Label15.Height      = 8;
	MOVLW       8
	MOVWF       _Label15+5 
;SmartGLCD_240x128_Demo_driver.c,768 :: 		Label15.Caption     = Label15_Caption;
	MOVLW       _Label15_Caption+0
	MOVWF       _Label15+6 
	MOVLW       hi_addr(_Label15_Caption+0)
	MOVWF       _Label15+7 
;SmartGLCD_240x128_Demo_driver.c,769 :: 		Label15.FontName    = 0;
	CLRF        _Label15+8 
	CLRF        _Label15+9 
	CLRF        _Label15+10 
;SmartGLCD_240x128_Demo_driver.c,770 :: 		Label15.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label15+11 
;SmartGLCD_240x128_Demo_driver.c,771 :: 		Label15.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label15+12 
;SmartGLCD_240x128_Demo_driver.c,772 :: 		Label15.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label15+13 
;SmartGLCD_240x128_Demo_driver.c,773 :: 		Label15.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label15+14 
;SmartGLCD_240x128_Demo_driver.c,774 :: 		Label15.Visible     = 1;
	MOVLW       1
	MOVWF       _Label15+15 
;SmartGLCD_240x128_Demo_driver.c,775 :: 		Label15.OnUpPtr     = 0;
	CLRF        _Label15+16 
	CLRF        _Label15+17 
	CLRF        _Label15+18 
	CLRF        _Label15+19 
;SmartGLCD_240x128_Demo_driver.c,776 :: 		Label15.OnDownPtr   = 0;
	CLRF        _Label15+20 
	CLRF        _Label15+21 
	CLRF        _Label15+22 
	CLRF        _Label15+23 
;SmartGLCD_240x128_Demo_driver.c,777 :: 		Label15.OnClickPtr  = 0;
	CLRF        _Label15+24 
	CLRF        _Label15+25 
	CLRF        _Label15+26 
	CLRF        _Label15+27 
;SmartGLCD_240x128_Demo_driver.c,778 :: 		Label15.OnPressPtr  = 0;
	CLRF        _Label15+28 
	CLRF        _Label15+29 
	CLRF        _Label15+30 
	CLRF        _Label15+31 
;SmartGLCD_240x128_Demo_driver.c,780 :: 		RoundCaptionButton4.OwnerScreen  = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _RoundCaptionButton4+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _RoundCaptionButton4+1 
;SmartGLCD_240x128_Demo_driver.c,781 :: 		RoundCaptionButton4.Left         = 187;
	MOVLW       187
	MOVWF       _RoundCaptionButton4+2 
;SmartGLCD_240x128_Demo_driver.c,782 :: 		RoundCaptionButton4.Top          = 99;
	MOVLW       99
	MOVWF       _RoundCaptionButton4+3 
;SmartGLCD_240x128_Demo_driver.c,783 :: 		RoundCaptionButton4.Width        = 42;
	MOVLW       42
	MOVWF       _RoundCaptionButton4+4 
;SmartGLCD_240x128_Demo_driver.c,784 :: 		RoundCaptionButton4.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton4+5 
;SmartGLCD_240x128_Demo_driver.c,785 :: 		RoundCaptionButton4.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton4+6 
;SmartGLCD_240x128_Demo_driver.c,786 :: 		RoundCaptionButton4.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton4+7 
;SmartGLCD_240x128_Demo_driver.c,787 :: 		RoundCaptionButton4.Caption      = RoundCaptionButton4_Caption;
	MOVLW       _RoundCaptionButton4_Caption+0
	MOVWF       _RoundCaptionButton4+8 
	MOVLW       hi_addr(_RoundCaptionButton4_Caption+0)
	MOVWF       _RoundCaptionButton4+9 
;SmartGLCD_240x128_Demo_driver.c,788 :: 		RoundCaptionButton4.FontName    = 0;
	CLRF        _RoundCaptionButton4+10 
	CLRF        _RoundCaptionButton4+11 
	CLRF        _RoundCaptionButton4+12 
;SmartGLCD_240x128_Demo_driver.c,789 :: 		RoundCaptionButton4.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton4+13 
;SmartGLCD_240x128_Demo_driver.c,790 :: 		RoundCaptionButton4.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton4+14 
;SmartGLCD_240x128_Demo_driver.c,791 :: 		RoundCaptionButton4.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton4+15 
;SmartGLCD_240x128_Demo_driver.c,792 :: 		RoundCaptionButton4.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton4+16 
;SmartGLCD_240x128_Demo_driver.c,793 :: 		RoundCaptionButton4.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton4+17 
;SmartGLCD_240x128_Demo_driver.c,794 :: 		RoundCaptionButton4.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton4+18 
	CLRF        _RoundCaptionButton4+19 
	CLRF        _RoundCaptionButton4+20 
	CLRF        _RoundCaptionButton4+21 
;SmartGLCD_240x128_Demo_driver.c,795 :: 		RoundCaptionButton4.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton4+22 
	CLRF        _RoundCaptionButton4+23 
	CLRF        _RoundCaptionButton4+24 
	CLRF        _RoundCaptionButton4+25 
;SmartGLCD_240x128_Demo_driver.c,796 :: 		RoundCaptionButton4.OnClickPtr  = RoundCaptionButton4Click;
	MOVLW       _RoundCaptionButton4Click+0
	MOVWF       _RoundCaptionButton4+26 
	MOVLW       hi_addr(_RoundCaptionButton4Click+0)
	MOVWF       _RoundCaptionButton4+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton4+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton4+29 
;SmartGLCD_240x128_Demo_driver.c,797 :: 		RoundCaptionButton4.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton4+30 
	CLRF        _RoundCaptionButton4+31 
	CLRF        _RoundCaptionButton4+32 
	CLRF        _RoundCaptionButton4+33 
;SmartGLCD_240x128_Demo_driver.c,799 :: 		CaptionButton1.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton1+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton1+1 
;SmartGLCD_240x128_Demo_driver.c,800 :: 		CaptionButton1.Left        = 3;
	MOVLW       3
	MOVWF       _CaptionButton1+2 
;SmartGLCD_240x128_Demo_driver.c,801 :: 		CaptionButton1.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton1+3 
;SmartGLCD_240x128_Demo_driver.c,802 :: 		CaptionButton1.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton1+4 
;SmartGLCD_240x128_Demo_driver.c,803 :: 		CaptionButton1.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton1+5 
;SmartGLCD_240x128_Demo_driver.c,804 :: 		CaptionButton1.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton1+6 
;SmartGLCD_240x128_Demo_driver.c,805 :: 		CaptionButton1.Caption     = CaptionButton1_Caption;
	MOVLW       _CaptionButton1_Caption+0
	MOVWF       _CaptionButton1+7 
	MOVLW       hi_addr(_CaptionButton1_Caption+0)
	MOVWF       _CaptionButton1+8 
;SmartGLCD_240x128_Demo_driver.c,806 :: 		CaptionButton1.FontName    = 0;
	CLRF        _CaptionButton1+9 
	CLRF        _CaptionButton1+10 
	CLRF        _CaptionButton1+11 
;SmartGLCD_240x128_Demo_driver.c,807 :: 		CaptionButton1.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton1+12 
;SmartGLCD_240x128_Demo_driver.c,808 :: 		CaptionButton1.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton1+13 
;SmartGLCD_240x128_Demo_driver.c,809 :: 		CaptionButton1.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton1+14 
;SmartGLCD_240x128_Demo_driver.c,810 :: 		CaptionButton1.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton1+15 
;SmartGLCD_240x128_Demo_driver.c,811 :: 		CaptionButton1.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton1+16 
;SmartGLCD_240x128_Demo_driver.c,812 :: 		CaptionButton1.OnUpPtr     = 0;
	CLRF        _CaptionButton1+17 
	CLRF        _CaptionButton1+18 
	CLRF        _CaptionButton1+19 
	CLRF        _CaptionButton1+20 
;SmartGLCD_240x128_Demo_driver.c,813 :: 		CaptionButton1.OnDownPtr   = 0;
	CLRF        _CaptionButton1+21 
	CLRF        _CaptionButton1+22 
	CLRF        _CaptionButton1+23 
	CLRF        _CaptionButton1+24 
;SmartGLCD_240x128_Demo_driver.c,814 :: 		CaptionButton1.OnClickPtr  = CaptionButton1Click;
	MOVLW       _CaptionButton1Click+0
	MOVWF       _CaptionButton1+25 
	MOVLW       hi_addr(_CaptionButton1Click+0)
	MOVWF       _CaptionButton1+26 
	MOVLW       0
	MOVWF       _CaptionButton1+27 
	MOVLW       0
	MOVWF       _CaptionButton1+28 
;SmartGLCD_240x128_Demo_driver.c,815 :: 		CaptionButton1.OnPressPtr  = 0;
	CLRF        _CaptionButton1+29 
	CLRF        _CaptionButton1+30 
	CLRF        _CaptionButton1+31 
	CLRF        _CaptionButton1+32 
;SmartGLCD_240x128_Demo_driver.c,817 :: 		CaptionButton2.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton2+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton2+1 
;SmartGLCD_240x128_Demo_driver.c,818 :: 		CaptionButton2.Left        = 27;
	MOVLW       27
	MOVWF       _CaptionButton2+2 
;SmartGLCD_240x128_Demo_driver.c,819 :: 		CaptionButton2.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton2+3 
;SmartGLCD_240x128_Demo_driver.c,820 :: 		CaptionButton2.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton2+4 
;SmartGLCD_240x128_Demo_driver.c,821 :: 		CaptionButton2.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton2+5 
;SmartGLCD_240x128_Demo_driver.c,822 :: 		CaptionButton2.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton2+6 
;SmartGLCD_240x128_Demo_driver.c,823 :: 		CaptionButton2.Caption     = CaptionButton2_Caption;
	MOVLW       _CaptionButton2_Caption+0
	MOVWF       _CaptionButton2+7 
	MOVLW       hi_addr(_CaptionButton2_Caption+0)
	MOVWF       _CaptionButton2+8 
;SmartGLCD_240x128_Demo_driver.c,824 :: 		CaptionButton2.FontName    = 0;
	CLRF        _CaptionButton2+9 
	CLRF        _CaptionButton2+10 
	CLRF        _CaptionButton2+11 
;SmartGLCD_240x128_Demo_driver.c,825 :: 		CaptionButton2.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton2+12 
;SmartGLCD_240x128_Demo_driver.c,826 :: 		CaptionButton2.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton2+13 
;SmartGLCD_240x128_Demo_driver.c,827 :: 		CaptionButton2.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton2+14 
;SmartGLCD_240x128_Demo_driver.c,828 :: 		CaptionButton2.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton2+15 
;SmartGLCD_240x128_Demo_driver.c,829 :: 		CaptionButton2.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton2+16 
;SmartGLCD_240x128_Demo_driver.c,830 :: 		CaptionButton2.OnUpPtr     = 0;
	CLRF        _CaptionButton2+17 
	CLRF        _CaptionButton2+18 
	CLRF        _CaptionButton2+19 
	CLRF        _CaptionButton2+20 
;SmartGLCD_240x128_Demo_driver.c,831 :: 		CaptionButton2.OnDownPtr   = 0;
	CLRF        _CaptionButton2+21 
	CLRF        _CaptionButton2+22 
	CLRF        _CaptionButton2+23 
	CLRF        _CaptionButton2+24 
;SmartGLCD_240x128_Demo_driver.c,832 :: 		CaptionButton2.OnClickPtr  = CaptionButton2Click;
	MOVLW       _CaptionButton2Click+0
	MOVWF       _CaptionButton2+25 
	MOVLW       hi_addr(_CaptionButton2Click+0)
	MOVWF       _CaptionButton2+26 
	MOVLW       0
	MOVWF       _CaptionButton2+27 
	MOVLW       0
	MOVWF       _CaptionButton2+28 
;SmartGLCD_240x128_Demo_driver.c,833 :: 		CaptionButton2.OnPressPtr  = 0;
	CLRF        _CaptionButton2+29 
	CLRF        _CaptionButton2+30 
	CLRF        _CaptionButton2+31 
	CLRF        _CaptionButton2+32 
;SmartGLCD_240x128_Demo_driver.c,835 :: 		CaptionButton3.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton3+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton3+1 
;SmartGLCD_240x128_Demo_driver.c,836 :: 		CaptionButton3.Left        = 51;
	MOVLW       51
	MOVWF       _CaptionButton3+2 
;SmartGLCD_240x128_Demo_driver.c,837 :: 		CaptionButton3.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton3+3 
;SmartGLCD_240x128_Demo_driver.c,838 :: 		CaptionButton3.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton3+4 
;SmartGLCD_240x128_Demo_driver.c,839 :: 		CaptionButton3.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton3+5 
;SmartGLCD_240x128_Demo_driver.c,840 :: 		CaptionButton3.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton3+6 
;SmartGLCD_240x128_Demo_driver.c,841 :: 		CaptionButton3.Caption     = CaptionButton3_Caption;
	MOVLW       _CaptionButton3_Caption+0
	MOVWF       _CaptionButton3+7 
	MOVLW       hi_addr(_CaptionButton3_Caption+0)
	MOVWF       _CaptionButton3+8 
;SmartGLCD_240x128_Demo_driver.c,842 :: 		CaptionButton3.FontName    = 0;
	CLRF        _CaptionButton3+9 
	CLRF        _CaptionButton3+10 
	CLRF        _CaptionButton3+11 
;SmartGLCD_240x128_Demo_driver.c,843 :: 		CaptionButton3.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton3+12 
;SmartGLCD_240x128_Demo_driver.c,844 :: 		CaptionButton3.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton3+13 
;SmartGLCD_240x128_Demo_driver.c,845 :: 		CaptionButton3.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton3+14 
;SmartGLCD_240x128_Demo_driver.c,846 :: 		CaptionButton3.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton3+15 
;SmartGLCD_240x128_Demo_driver.c,847 :: 		CaptionButton3.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton3+16 
;SmartGLCD_240x128_Demo_driver.c,848 :: 		CaptionButton3.OnUpPtr     = 0;
	CLRF        _CaptionButton3+17 
	CLRF        _CaptionButton3+18 
	CLRF        _CaptionButton3+19 
	CLRF        _CaptionButton3+20 
;SmartGLCD_240x128_Demo_driver.c,849 :: 		CaptionButton3.OnDownPtr   = 0;
	CLRF        _CaptionButton3+21 
	CLRF        _CaptionButton3+22 
	CLRF        _CaptionButton3+23 
	CLRF        _CaptionButton3+24 
;SmartGLCD_240x128_Demo_driver.c,850 :: 		CaptionButton3.OnClickPtr  = CaptionButton3Click;
	MOVLW       _CaptionButton3Click+0
	MOVWF       _CaptionButton3+25 
	MOVLW       hi_addr(_CaptionButton3Click+0)
	MOVWF       _CaptionButton3+26 
	MOVLW       0
	MOVWF       _CaptionButton3+27 
	MOVLW       0
	MOVWF       _CaptionButton3+28 
;SmartGLCD_240x128_Demo_driver.c,851 :: 		CaptionButton3.OnPressPtr  = 0;
	CLRF        _CaptionButton3+29 
	CLRF        _CaptionButton3+30 
	CLRF        _CaptionButton3+31 
	CLRF        _CaptionButton3+32 
;SmartGLCD_240x128_Demo_driver.c,853 :: 		CaptionButton4.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton4+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton4+1 
;SmartGLCD_240x128_Demo_driver.c,854 :: 		CaptionButton4.Left        = 75;
	MOVLW       75
	MOVWF       _CaptionButton4+2 
;SmartGLCD_240x128_Demo_driver.c,855 :: 		CaptionButton4.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton4+3 
;SmartGLCD_240x128_Demo_driver.c,856 :: 		CaptionButton4.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton4+4 
;SmartGLCD_240x128_Demo_driver.c,857 :: 		CaptionButton4.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton4+5 
;SmartGLCD_240x128_Demo_driver.c,858 :: 		CaptionButton4.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton4+6 
;SmartGLCD_240x128_Demo_driver.c,859 :: 		CaptionButton4.Caption     = CaptionButton4_Caption;
	MOVLW       _CaptionButton4_Caption+0
	MOVWF       _CaptionButton4+7 
	MOVLW       hi_addr(_CaptionButton4_Caption+0)
	MOVWF       _CaptionButton4+8 
;SmartGLCD_240x128_Demo_driver.c,860 :: 		CaptionButton4.FontName    = 0;
	CLRF        _CaptionButton4+9 
	CLRF        _CaptionButton4+10 
	CLRF        _CaptionButton4+11 
;SmartGLCD_240x128_Demo_driver.c,861 :: 		CaptionButton4.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton4+12 
;SmartGLCD_240x128_Demo_driver.c,862 :: 		CaptionButton4.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton4+13 
;SmartGLCD_240x128_Demo_driver.c,863 :: 		CaptionButton4.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton4+14 
;SmartGLCD_240x128_Demo_driver.c,864 :: 		CaptionButton4.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton4+15 
;SmartGLCD_240x128_Demo_driver.c,865 :: 		CaptionButton4.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton4+16 
;SmartGLCD_240x128_Demo_driver.c,866 :: 		CaptionButton4.OnUpPtr     = 0;
	CLRF        _CaptionButton4+17 
	CLRF        _CaptionButton4+18 
	CLRF        _CaptionButton4+19 
	CLRF        _CaptionButton4+20 
;SmartGLCD_240x128_Demo_driver.c,867 :: 		CaptionButton4.OnDownPtr   = 0;
	CLRF        _CaptionButton4+21 
	CLRF        _CaptionButton4+22 
	CLRF        _CaptionButton4+23 
	CLRF        _CaptionButton4+24 
;SmartGLCD_240x128_Demo_driver.c,868 :: 		CaptionButton4.OnClickPtr  = CaptionButton4Click;
	MOVLW       _CaptionButton4Click+0
	MOVWF       _CaptionButton4+25 
	MOVLW       hi_addr(_CaptionButton4Click+0)
	MOVWF       _CaptionButton4+26 
	MOVLW       0
	MOVWF       _CaptionButton4+27 
	MOVLW       0
	MOVWF       _CaptionButton4+28 
;SmartGLCD_240x128_Demo_driver.c,869 :: 		CaptionButton4.OnPressPtr  = 0;
	CLRF        _CaptionButton4+29 
	CLRF        _CaptionButton4+30 
	CLRF        _CaptionButton4+31 
	CLRF        _CaptionButton4+32 
;SmartGLCD_240x128_Demo_driver.c,871 :: 		CaptionButton5.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton5+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton5+1 
;SmartGLCD_240x128_Demo_driver.c,872 :: 		CaptionButton5.Left        = 99;
	MOVLW       99
	MOVWF       _CaptionButton5+2 
;SmartGLCD_240x128_Demo_driver.c,873 :: 		CaptionButton5.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton5+3 
;SmartGLCD_240x128_Demo_driver.c,874 :: 		CaptionButton5.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton5+4 
;SmartGLCD_240x128_Demo_driver.c,875 :: 		CaptionButton5.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton5+5 
;SmartGLCD_240x128_Demo_driver.c,876 :: 		CaptionButton5.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton5+6 
;SmartGLCD_240x128_Demo_driver.c,877 :: 		CaptionButton5.Caption     = CaptionButton5_Caption;
	MOVLW       _CaptionButton5_Caption+0
	MOVWF       _CaptionButton5+7 
	MOVLW       hi_addr(_CaptionButton5_Caption+0)
	MOVWF       _CaptionButton5+8 
;SmartGLCD_240x128_Demo_driver.c,878 :: 		CaptionButton5.FontName    = 0;
	CLRF        _CaptionButton5+9 
	CLRF        _CaptionButton5+10 
	CLRF        _CaptionButton5+11 
;SmartGLCD_240x128_Demo_driver.c,879 :: 		CaptionButton5.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton5+12 
;SmartGLCD_240x128_Demo_driver.c,880 :: 		CaptionButton5.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton5+13 
;SmartGLCD_240x128_Demo_driver.c,881 :: 		CaptionButton5.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton5+14 
;SmartGLCD_240x128_Demo_driver.c,882 :: 		CaptionButton5.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton5+15 
;SmartGLCD_240x128_Demo_driver.c,883 :: 		CaptionButton5.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton5+16 
;SmartGLCD_240x128_Demo_driver.c,884 :: 		CaptionButton5.OnUpPtr     = 0;
	CLRF        _CaptionButton5+17 
	CLRF        _CaptionButton5+18 
	CLRF        _CaptionButton5+19 
	CLRF        _CaptionButton5+20 
;SmartGLCD_240x128_Demo_driver.c,885 :: 		CaptionButton5.OnDownPtr   = 0;
	CLRF        _CaptionButton5+21 
	CLRF        _CaptionButton5+22 
	CLRF        _CaptionButton5+23 
	CLRF        _CaptionButton5+24 
;SmartGLCD_240x128_Demo_driver.c,886 :: 		CaptionButton5.OnClickPtr  = CaptionButton5Click;
	MOVLW       _CaptionButton5Click+0
	MOVWF       _CaptionButton5+25 
	MOVLW       hi_addr(_CaptionButton5Click+0)
	MOVWF       _CaptionButton5+26 
	MOVLW       0
	MOVWF       _CaptionButton5+27 
	MOVLW       0
	MOVWF       _CaptionButton5+28 
;SmartGLCD_240x128_Demo_driver.c,887 :: 		CaptionButton5.OnPressPtr  = 0;
	CLRF        _CaptionButton5+29 
	CLRF        _CaptionButton5+30 
	CLRF        _CaptionButton5+31 
	CLRF        _CaptionButton5+32 
;SmartGLCD_240x128_Demo_driver.c,889 :: 		CaptionButton6.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton6+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton6+1 
;SmartGLCD_240x128_Demo_driver.c,890 :: 		CaptionButton6.Left        = 123;
	MOVLW       123
	MOVWF       _CaptionButton6+2 
;SmartGLCD_240x128_Demo_driver.c,891 :: 		CaptionButton6.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton6+3 
;SmartGLCD_240x128_Demo_driver.c,892 :: 		CaptionButton6.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton6+4 
;SmartGLCD_240x128_Demo_driver.c,893 :: 		CaptionButton6.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton6+5 
;SmartGLCD_240x128_Demo_driver.c,894 :: 		CaptionButton6.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton6+6 
;SmartGLCD_240x128_Demo_driver.c,895 :: 		CaptionButton6.Caption     = CaptionButton6_Caption;
	MOVLW       _CaptionButton6_Caption+0
	MOVWF       _CaptionButton6+7 
	MOVLW       hi_addr(_CaptionButton6_Caption+0)
	MOVWF       _CaptionButton6+8 
;SmartGLCD_240x128_Demo_driver.c,896 :: 		CaptionButton6.FontName    = 0;
	CLRF        _CaptionButton6+9 
	CLRF        _CaptionButton6+10 
	CLRF        _CaptionButton6+11 
;SmartGLCD_240x128_Demo_driver.c,897 :: 		CaptionButton6.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton6+12 
;SmartGLCD_240x128_Demo_driver.c,898 :: 		CaptionButton6.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton6+13 
;SmartGLCD_240x128_Demo_driver.c,899 :: 		CaptionButton6.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton6+14 
;SmartGLCD_240x128_Demo_driver.c,900 :: 		CaptionButton6.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton6+15 
;SmartGLCD_240x128_Demo_driver.c,901 :: 		CaptionButton6.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton6+16 
;SmartGLCD_240x128_Demo_driver.c,902 :: 		CaptionButton6.OnUpPtr     = 0;
	CLRF        _CaptionButton6+17 
	CLRF        _CaptionButton6+18 
	CLRF        _CaptionButton6+19 
	CLRF        _CaptionButton6+20 
;SmartGLCD_240x128_Demo_driver.c,903 :: 		CaptionButton6.OnDownPtr   = 0;
	CLRF        _CaptionButton6+21 
	CLRF        _CaptionButton6+22 
	CLRF        _CaptionButton6+23 
	CLRF        _CaptionButton6+24 
;SmartGLCD_240x128_Demo_driver.c,904 :: 		CaptionButton6.OnClickPtr  = CaptionButton6Click;
	MOVLW       _CaptionButton6Click+0
	MOVWF       _CaptionButton6+25 
	MOVLW       hi_addr(_CaptionButton6Click+0)
	MOVWF       _CaptionButton6+26 
	MOVLW       0
	MOVWF       _CaptionButton6+27 
	MOVLW       0
	MOVWF       _CaptionButton6+28 
;SmartGLCD_240x128_Demo_driver.c,905 :: 		CaptionButton6.OnPressPtr  = 0;
	CLRF        _CaptionButton6+29 
	CLRF        _CaptionButton6+30 
	CLRF        _CaptionButton6+31 
	CLRF        _CaptionButton6+32 
;SmartGLCD_240x128_Demo_driver.c,907 :: 		CaptionButton7.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton7+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton7+1 
;SmartGLCD_240x128_Demo_driver.c,908 :: 		CaptionButton7.Left        = 147;
	MOVLW       147
	MOVWF       _CaptionButton7+2 
;SmartGLCD_240x128_Demo_driver.c,909 :: 		CaptionButton7.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton7+3 
;SmartGLCD_240x128_Demo_driver.c,910 :: 		CaptionButton7.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton7+4 
;SmartGLCD_240x128_Demo_driver.c,911 :: 		CaptionButton7.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton7+5 
;SmartGLCD_240x128_Demo_driver.c,912 :: 		CaptionButton7.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton7+6 
;SmartGLCD_240x128_Demo_driver.c,913 :: 		CaptionButton7.Caption     = CaptionButton7_Caption;
	MOVLW       _CaptionButton7_Caption+0
	MOVWF       _CaptionButton7+7 
	MOVLW       hi_addr(_CaptionButton7_Caption+0)
	MOVWF       _CaptionButton7+8 
;SmartGLCD_240x128_Demo_driver.c,914 :: 		CaptionButton7.FontName    = 0;
	CLRF        _CaptionButton7+9 
	CLRF        _CaptionButton7+10 
	CLRF        _CaptionButton7+11 
;SmartGLCD_240x128_Demo_driver.c,915 :: 		CaptionButton7.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton7+12 
;SmartGLCD_240x128_Demo_driver.c,916 :: 		CaptionButton7.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton7+13 
;SmartGLCD_240x128_Demo_driver.c,917 :: 		CaptionButton7.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton7+14 
;SmartGLCD_240x128_Demo_driver.c,918 :: 		CaptionButton7.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton7+15 
;SmartGLCD_240x128_Demo_driver.c,919 :: 		CaptionButton7.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton7+16 
;SmartGLCD_240x128_Demo_driver.c,920 :: 		CaptionButton7.OnUpPtr     = 0;
	CLRF        _CaptionButton7+17 
	CLRF        _CaptionButton7+18 
	CLRF        _CaptionButton7+19 
	CLRF        _CaptionButton7+20 
;SmartGLCD_240x128_Demo_driver.c,921 :: 		CaptionButton7.OnDownPtr   = 0;
	CLRF        _CaptionButton7+21 
	CLRF        _CaptionButton7+22 
	CLRF        _CaptionButton7+23 
	CLRF        _CaptionButton7+24 
;SmartGLCD_240x128_Demo_driver.c,922 :: 		CaptionButton7.OnClickPtr  = CaptionButton7Click;
	MOVLW       _CaptionButton7Click+0
	MOVWF       _CaptionButton7+25 
	MOVLW       hi_addr(_CaptionButton7Click+0)
	MOVWF       _CaptionButton7+26 
	MOVLW       0
	MOVWF       _CaptionButton7+27 
	MOVLW       0
	MOVWF       _CaptionButton7+28 
;SmartGLCD_240x128_Demo_driver.c,923 :: 		CaptionButton7.OnPressPtr  = 0;
	CLRF        _CaptionButton7+29 
	CLRF        _CaptionButton7+30 
	CLRF        _CaptionButton7+31 
	CLRF        _CaptionButton7+32 
;SmartGLCD_240x128_Demo_driver.c,925 :: 		CaptionButton8.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton8+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton8+1 
;SmartGLCD_240x128_Demo_driver.c,926 :: 		CaptionButton8.Left        = 171;
	MOVLW       171
	MOVWF       _CaptionButton8+2 
;SmartGLCD_240x128_Demo_driver.c,927 :: 		CaptionButton8.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton8+3 
;SmartGLCD_240x128_Demo_driver.c,928 :: 		CaptionButton8.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton8+4 
;SmartGLCD_240x128_Demo_driver.c,929 :: 		CaptionButton8.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton8+5 
;SmartGLCD_240x128_Demo_driver.c,930 :: 		CaptionButton8.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton8+6 
;SmartGLCD_240x128_Demo_driver.c,931 :: 		CaptionButton8.Caption     = CaptionButton8_Caption;
	MOVLW       _CaptionButton8_Caption+0
	MOVWF       _CaptionButton8+7 
	MOVLW       hi_addr(_CaptionButton8_Caption+0)
	MOVWF       _CaptionButton8+8 
;SmartGLCD_240x128_Demo_driver.c,932 :: 		CaptionButton8.FontName    = 0;
	CLRF        _CaptionButton8+9 
	CLRF        _CaptionButton8+10 
	CLRF        _CaptionButton8+11 
;SmartGLCD_240x128_Demo_driver.c,933 :: 		CaptionButton8.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton8+12 
;SmartGLCD_240x128_Demo_driver.c,934 :: 		CaptionButton8.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton8+13 
;SmartGLCD_240x128_Demo_driver.c,935 :: 		CaptionButton8.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton8+14 
;SmartGLCD_240x128_Demo_driver.c,936 :: 		CaptionButton8.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton8+15 
;SmartGLCD_240x128_Demo_driver.c,937 :: 		CaptionButton8.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton8+16 
;SmartGLCD_240x128_Demo_driver.c,938 :: 		CaptionButton8.OnUpPtr     = 0;
	CLRF        _CaptionButton8+17 
	CLRF        _CaptionButton8+18 
	CLRF        _CaptionButton8+19 
	CLRF        _CaptionButton8+20 
;SmartGLCD_240x128_Demo_driver.c,939 :: 		CaptionButton8.OnDownPtr   = 0;
	CLRF        _CaptionButton8+21 
	CLRF        _CaptionButton8+22 
	CLRF        _CaptionButton8+23 
	CLRF        _CaptionButton8+24 
;SmartGLCD_240x128_Demo_driver.c,940 :: 		CaptionButton8.OnClickPtr  = CaptionButton8Click;
	MOVLW       _CaptionButton8Click+0
	MOVWF       _CaptionButton8+25 
	MOVLW       hi_addr(_CaptionButton8Click+0)
	MOVWF       _CaptionButton8+26 
	MOVLW       0
	MOVWF       _CaptionButton8+27 
	MOVLW       0
	MOVWF       _CaptionButton8+28 
;SmartGLCD_240x128_Demo_driver.c,941 :: 		CaptionButton8.OnPressPtr  = 0;
	CLRF        _CaptionButton8+29 
	CLRF        _CaptionButton8+30 
	CLRF        _CaptionButton8+31 
	CLRF        _CaptionButton8+32 
;SmartGLCD_240x128_Demo_driver.c,943 :: 		CaptionButton9.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton9+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton9+1 
;SmartGLCD_240x128_Demo_driver.c,944 :: 		CaptionButton9.Left        = 195;
	MOVLW       195
	MOVWF       _CaptionButton9+2 
;SmartGLCD_240x128_Demo_driver.c,945 :: 		CaptionButton9.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton9+3 
;SmartGLCD_240x128_Demo_driver.c,946 :: 		CaptionButton9.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton9+4 
;SmartGLCD_240x128_Demo_driver.c,947 :: 		CaptionButton9.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton9+5 
;SmartGLCD_240x128_Demo_driver.c,948 :: 		CaptionButton9.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton9+6 
;SmartGLCD_240x128_Demo_driver.c,949 :: 		CaptionButton9.Caption     = CaptionButton9_Caption;
	MOVLW       _CaptionButton9_Caption+0
	MOVWF       _CaptionButton9+7 
	MOVLW       hi_addr(_CaptionButton9_Caption+0)
	MOVWF       _CaptionButton9+8 
;SmartGLCD_240x128_Demo_driver.c,950 :: 		CaptionButton9.FontName    = 0;
	CLRF        _CaptionButton9+9 
	CLRF        _CaptionButton9+10 
	CLRF        _CaptionButton9+11 
;SmartGLCD_240x128_Demo_driver.c,951 :: 		CaptionButton9.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton9+12 
;SmartGLCD_240x128_Demo_driver.c,952 :: 		CaptionButton9.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton9+13 
;SmartGLCD_240x128_Demo_driver.c,953 :: 		CaptionButton9.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton9+14 
;SmartGLCD_240x128_Demo_driver.c,954 :: 		CaptionButton9.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton9+15 
;SmartGLCD_240x128_Demo_driver.c,955 :: 		CaptionButton9.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton9+16 
;SmartGLCD_240x128_Demo_driver.c,956 :: 		CaptionButton9.OnUpPtr     = 0;
	CLRF        _CaptionButton9+17 
	CLRF        _CaptionButton9+18 
	CLRF        _CaptionButton9+19 
	CLRF        _CaptionButton9+20 
;SmartGLCD_240x128_Demo_driver.c,957 :: 		CaptionButton9.OnDownPtr   = 0;
	CLRF        _CaptionButton9+21 
	CLRF        _CaptionButton9+22 
	CLRF        _CaptionButton9+23 
	CLRF        _CaptionButton9+24 
;SmartGLCD_240x128_Demo_driver.c,958 :: 		CaptionButton9.OnClickPtr  = CaptionButton9Click;
	MOVLW       _CaptionButton9Click+0
	MOVWF       _CaptionButton9+25 
	MOVLW       hi_addr(_CaptionButton9Click+0)
	MOVWF       _CaptionButton9+26 
	MOVLW       0
	MOVWF       _CaptionButton9+27 
	MOVLW       0
	MOVWF       _CaptionButton9+28 
;SmartGLCD_240x128_Demo_driver.c,959 :: 		CaptionButton9.OnPressPtr  = 0;
	CLRF        _CaptionButton9+29 
	CLRF        _CaptionButton9+30 
	CLRF        _CaptionButton9+31 
	CLRF        _CaptionButton9+32 
;SmartGLCD_240x128_Demo_driver.c,961 :: 		CaptionButton10.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton10+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton10+1 
;SmartGLCD_240x128_Demo_driver.c,962 :: 		CaptionButton10.Left        = 219;
	MOVLW       219
	MOVWF       _CaptionButton10+2 
;SmartGLCD_240x128_Demo_driver.c,963 :: 		CaptionButton10.Top         = 3;
	MOVLW       3
	MOVWF       _CaptionButton10+3 
;SmartGLCD_240x128_Demo_driver.c,964 :: 		CaptionButton10.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton10+4 
;SmartGLCD_240x128_Demo_driver.c,965 :: 		CaptionButton10.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton10+5 
;SmartGLCD_240x128_Demo_driver.c,966 :: 		CaptionButton10.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton10+6 
;SmartGLCD_240x128_Demo_driver.c,967 :: 		CaptionButton10.Caption     = CaptionButton10_Caption;
	MOVLW       _CaptionButton10_Caption+0
	MOVWF       _CaptionButton10+7 
	MOVLW       hi_addr(_CaptionButton10_Caption+0)
	MOVWF       _CaptionButton10+8 
;SmartGLCD_240x128_Demo_driver.c,968 :: 		CaptionButton10.FontName    = 0;
	CLRF        _CaptionButton10+9 
	CLRF        _CaptionButton10+10 
	CLRF        _CaptionButton10+11 
;SmartGLCD_240x128_Demo_driver.c,969 :: 		CaptionButton10.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton10+12 
;SmartGLCD_240x128_Demo_driver.c,970 :: 		CaptionButton10.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton10+13 
;SmartGLCD_240x128_Demo_driver.c,971 :: 		CaptionButton10.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton10+14 
;SmartGLCD_240x128_Demo_driver.c,972 :: 		CaptionButton10.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton10+15 
;SmartGLCD_240x128_Demo_driver.c,973 :: 		CaptionButton10.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton10+16 
;SmartGLCD_240x128_Demo_driver.c,974 :: 		CaptionButton10.OnUpPtr     = 0;
	CLRF        _CaptionButton10+17 
	CLRF        _CaptionButton10+18 
	CLRF        _CaptionButton10+19 
	CLRF        _CaptionButton10+20 
;SmartGLCD_240x128_Demo_driver.c,975 :: 		CaptionButton10.OnDownPtr   = 0;
	CLRF        _CaptionButton10+21 
	CLRF        _CaptionButton10+22 
	CLRF        _CaptionButton10+23 
	CLRF        _CaptionButton10+24 
;SmartGLCD_240x128_Demo_driver.c,976 :: 		CaptionButton10.OnClickPtr  = CaptionButton10Click;
	MOVLW       _CaptionButton10Click+0
	MOVWF       _CaptionButton10+25 
	MOVLW       hi_addr(_CaptionButton10Click+0)
	MOVWF       _CaptionButton10+26 
	MOVLW       0
	MOVWF       _CaptionButton10+27 
	MOVLW       0
	MOVWF       _CaptionButton10+28 
;SmartGLCD_240x128_Demo_driver.c,977 :: 		CaptionButton10.OnPressPtr  = 0;
	CLRF        _CaptionButton10+29 
	CLRF        _CaptionButton10+30 
	CLRF        _CaptionButton10+31 
	CLRF        _CaptionButton10+32 
;SmartGLCD_240x128_Demo_driver.c,979 :: 		CaptionButton11.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton11+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton11+1 
;SmartGLCD_240x128_Demo_driver.c,980 :: 		CaptionButton11.Left        = 11;
	MOVLW       11
	MOVWF       _CaptionButton11+2 
;SmartGLCD_240x128_Demo_driver.c,981 :: 		CaptionButton11.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton11+3 
;SmartGLCD_240x128_Demo_driver.c,982 :: 		CaptionButton11.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton11+4 
;SmartGLCD_240x128_Demo_driver.c,983 :: 		CaptionButton11.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton11+5 
;SmartGLCD_240x128_Demo_driver.c,984 :: 		CaptionButton11.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton11+6 
;SmartGLCD_240x128_Demo_driver.c,985 :: 		CaptionButton11.Caption     = CaptionButton11_Caption;
	MOVLW       _CaptionButton11_Caption+0
	MOVWF       _CaptionButton11+7 
	MOVLW       hi_addr(_CaptionButton11_Caption+0)
	MOVWF       _CaptionButton11+8 
;SmartGLCD_240x128_Demo_driver.c,986 :: 		CaptionButton11.FontName    = 0;
	CLRF        _CaptionButton11+9 
	CLRF        _CaptionButton11+10 
	CLRF        _CaptionButton11+11 
;SmartGLCD_240x128_Demo_driver.c,987 :: 		CaptionButton11.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton11+12 
;SmartGLCD_240x128_Demo_driver.c,988 :: 		CaptionButton11.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton11+13 
;SmartGLCD_240x128_Demo_driver.c,989 :: 		CaptionButton11.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton11+14 
;SmartGLCD_240x128_Demo_driver.c,990 :: 		CaptionButton11.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton11+15 
;SmartGLCD_240x128_Demo_driver.c,991 :: 		CaptionButton11.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton11+16 
;SmartGLCD_240x128_Demo_driver.c,992 :: 		CaptionButton11.OnUpPtr     = 0;
	CLRF        _CaptionButton11+17 
	CLRF        _CaptionButton11+18 
	CLRF        _CaptionButton11+19 
	CLRF        _CaptionButton11+20 
;SmartGLCD_240x128_Demo_driver.c,993 :: 		CaptionButton11.OnDownPtr   = 0;
	CLRF        _CaptionButton11+21 
	CLRF        _CaptionButton11+22 
	CLRF        _CaptionButton11+23 
	CLRF        _CaptionButton11+24 
;SmartGLCD_240x128_Demo_driver.c,994 :: 		CaptionButton11.OnClickPtr  = CaptionButton11Click;
	MOVLW       _CaptionButton11Click+0
	MOVWF       _CaptionButton11+25 
	MOVLW       hi_addr(_CaptionButton11Click+0)
	MOVWF       _CaptionButton11+26 
	MOVLW       0
	MOVWF       _CaptionButton11+27 
	MOVLW       0
	MOVWF       _CaptionButton11+28 
;SmartGLCD_240x128_Demo_driver.c,995 :: 		CaptionButton11.OnPressPtr  = 0;
	CLRF        _CaptionButton11+29 
	CLRF        _CaptionButton11+30 
	CLRF        _CaptionButton11+31 
	CLRF        _CaptionButton11+32 
;SmartGLCD_240x128_Demo_driver.c,997 :: 		CaptionButton12.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton12+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton12+1 
;SmartGLCD_240x128_Demo_driver.c,998 :: 		CaptionButton12.Left        = 35;
	MOVLW       35
	MOVWF       _CaptionButton12+2 
;SmartGLCD_240x128_Demo_driver.c,999 :: 		CaptionButton12.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton12+3 
;SmartGLCD_240x128_Demo_driver.c,1000 :: 		CaptionButton12.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton12+4 
;SmartGLCD_240x128_Demo_driver.c,1001 :: 		CaptionButton12.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton12+5 
;SmartGLCD_240x128_Demo_driver.c,1002 :: 		CaptionButton12.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton12+6 
;SmartGLCD_240x128_Demo_driver.c,1003 :: 		CaptionButton12.Caption     = CaptionButton12_Caption;
	MOVLW       _CaptionButton12_Caption+0
	MOVWF       _CaptionButton12+7 
	MOVLW       hi_addr(_CaptionButton12_Caption+0)
	MOVWF       _CaptionButton12+8 
;SmartGLCD_240x128_Demo_driver.c,1004 :: 		CaptionButton12.FontName    = 0;
	CLRF        _CaptionButton12+9 
	CLRF        _CaptionButton12+10 
	CLRF        _CaptionButton12+11 
;SmartGLCD_240x128_Demo_driver.c,1005 :: 		CaptionButton12.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton12+12 
;SmartGLCD_240x128_Demo_driver.c,1006 :: 		CaptionButton12.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton12+13 
;SmartGLCD_240x128_Demo_driver.c,1007 :: 		CaptionButton12.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton12+14 
;SmartGLCD_240x128_Demo_driver.c,1008 :: 		CaptionButton12.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton12+15 
;SmartGLCD_240x128_Demo_driver.c,1009 :: 		CaptionButton12.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton12+16 
;SmartGLCD_240x128_Demo_driver.c,1010 :: 		CaptionButton12.OnUpPtr     = 0;
	CLRF        _CaptionButton12+17 
	CLRF        _CaptionButton12+18 
	CLRF        _CaptionButton12+19 
	CLRF        _CaptionButton12+20 
;SmartGLCD_240x128_Demo_driver.c,1011 :: 		CaptionButton12.OnDownPtr   = 0;
	CLRF        _CaptionButton12+21 
	CLRF        _CaptionButton12+22 
	CLRF        _CaptionButton12+23 
	CLRF        _CaptionButton12+24 
;SmartGLCD_240x128_Demo_driver.c,1012 :: 		CaptionButton12.OnClickPtr  = CaptionButton12Click;
	MOVLW       _CaptionButton12Click+0
	MOVWF       _CaptionButton12+25 
	MOVLW       hi_addr(_CaptionButton12Click+0)
	MOVWF       _CaptionButton12+26 
	MOVLW       0
	MOVWF       _CaptionButton12+27 
	MOVLW       0
	MOVWF       _CaptionButton12+28 
;SmartGLCD_240x128_Demo_driver.c,1013 :: 		CaptionButton12.OnPressPtr  = 0;
	CLRF        _CaptionButton12+29 
	CLRF        _CaptionButton12+30 
	CLRF        _CaptionButton12+31 
	CLRF        _CaptionButton12+32 
;SmartGLCD_240x128_Demo_driver.c,1015 :: 		CaptionButton13.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton13+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton13+1 
;SmartGLCD_240x128_Demo_driver.c,1016 :: 		CaptionButton13.Left        = 59;
	MOVLW       59
	MOVWF       _CaptionButton13+2 
;SmartGLCD_240x128_Demo_driver.c,1017 :: 		CaptionButton13.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton13+3 
;SmartGLCD_240x128_Demo_driver.c,1018 :: 		CaptionButton13.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton13+4 
;SmartGLCD_240x128_Demo_driver.c,1019 :: 		CaptionButton13.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton13+5 
;SmartGLCD_240x128_Demo_driver.c,1020 :: 		CaptionButton13.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton13+6 
;SmartGLCD_240x128_Demo_driver.c,1021 :: 		CaptionButton13.Caption     = CaptionButton13_Caption;
	MOVLW       _CaptionButton13_Caption+0
	MOVWF       _CaptionButton13+7 
	MOVLW       hi_addr(_CaptionButton13_Caption+0)
	MOVWF       _CaptionButton13+8 
;SmartGLCD_240x128_Demo_driver.c,1022 :: 		CaptionButton13.FontName    = 0;
	CLRF        _CaptionButton13+9 
	CLRF        _CaptionButton13+10 
	CLRF        _CaptionButton13+11 
;SmartGLCD_240x128_Demo_driver.c,1023 :: 		CaptionButton13.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton13+12 
;SmartGLCD_240x128_Demo_driver.c,1024 :: 		CaptionButton13.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton13+13 
;SmartGLCD_240x128_Demo_driver.c,1025 :: 		CaptionButton13.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton13+14 
;SmartGLCD_240x128_Demo_driver.c,1026 :: 		CaptionButton13.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton13+15 
;SmartGLCD_240x128_Demo_driver.c,1027 :: 		CaptionButton13.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton13+16 
;SmartGLCD_240x128_Demo_driver.c,1028 :: 		CaptionButton13.OnUpPtr     = 0;
	CLRF        _CaptionButton13+17 
	CLRF        _CaptionButton13+18 
	CLRF        _CaptionButton13+19 
	CLRF        _CaptionButton13+20 
;SmartGLCD_240x128_Demo_driver.c,1029 :: 		CaptionButton13.OnDownPtr   = 0;
	CLRF        _CaptionButton13+21 
	CLRF        _CaptionButton13+22 
	CLRF        _CaptionButton13+23 
	CLRF        _CaptionButton13+24 
;SmartGLCD_240x128_Demo_driver.c,1030 :: 		CaptionButton13.OnClickPtr  = CaptionButton13Click;
	MOVLW       _CaptionButton13Click+0
	MOVWF       _CaptionButton13+25 
	MOVLW       hi_addr(_CaptionButton13Click+0)
	MOVWF       _CaptionButton13+26 
	MOVLW       0
	MOVWF       _CaptionButton13+27 
	MOVLW       0
	MOVWF       _CaptionButton13+28 
;SmartGLCD_240x128_Demo_driver.c,1031 :: 		CaptionButton13.OnPressPtr  = 0;
	CLRF        _CaptionButton13+29 
	CLRF        _CaptionButton13+30 
	CLRF        _CaptionButton13+31 
	CLRF        _CaptionButton13+32 
;SmartGLCD_240x128_Demo_driver.c,1033 :: 		CaptionButton14.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton14+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton14+1 
;SmartGLCD_240x128_Demo_driver.c,1034 :: 		CaptionButton14.Left        = 83;
	MOVLW       83
	MOVWF       _CaptionButton14+2 
;SmartGLCD_240x128_Demo_driver.c,1035 :: 		CaptionButton14.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton14+3 
;SmartGLCD_240x128_Demo_driver.c,1036 :: 		CaptionButton14.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton14+4 
;SmartGLCD_240x128_Demo_driver.c,1037 :: 		CaptionButton14.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton14+5 
;SmartGLCD_240x128_Demo_driver.c,1038 :: 		CaptionButton14.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton14+6 
;SmartGLCD_240x128_Demo_driver.c,1039 :: 		CaptionButton14.Caption     = CaptionButton14_Caption;
	MOVLW       _CaptionButton14_Caption+0
	MOVWF       _CaptionButton14+7 
	MOVLW       hi_addr(_CaptionButton14_Caption+0)
	MOVWF       _CaptionButton14+8 
;SmartGLCD_240x128_Demo_driver.c,1040 :: 		CaptionButton14.FontName    = 0;
	CLRF        _CaptionButton14+9 
	CLRF        _CaptionButton14+10 
	CLRF        _CaptionButton14+11 
;SmartGLCD_240x128_Demo_driver.c,1041 :: 		CaptionButton14.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton14+12 
;SmartGLCD_240x128_Demo_driver.c,1042 :: 		CaptionButton14.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton14+13 
;SmartGLCD_240x128_Demo_driver.c,1043 :: 		CaptionButton14.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton14+14 
;SmartGLCD_240x128_Demo_driver.c,1044 :: 		CaptionButton14.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton14+15 
;SmartGLCD_240x128_Demo_driver.c,1045 :: 		CaptionButton14.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton14+16 
;SmartGLCD_240x128_Demo_driver.c,1046 :: 		CaptionButton14.OnUpPtr     = 0;
	CLRF        _CaptionButton14+17 
	CLRF        _CaptionButton14+18 
	CLRF        _CaptionButton14+19 
	CLRF        _CaptionButton14+20 
;SmartGLCD_240x128_Demo_driver.c,1047 :: 		CaptionButton14.OnDownPtr   = 0;
	CLRF        _CaptionButton14+21 
	CLRF        _CaptionButton14+22 
	CLRF        _CaptionButton14+23 
	CLRF        _CaptionButton14+24 
;SmartGLCD_240x128_Demo_driver.c,1048 :: 		CaptionButton14.OnClickPtr  = CaptionButton14Click;
	MOVLW       _CaptionButton14Click+0
	MOVWF       _CaptionButton14+25 
	MOVLW       hi_addr(_CaptionButton14Click+0)
	MOVWF       _CaptionButton14+26 
	MOVLW       0
	MOVWF       _CaptionButton14+27 
	MOVLW       0
	MOVWF       _CaptionButton14+28 
;SmartGLCD_240x128_Demo_driver.c,1049 :: 		CaptionButton14.OnPressPtr  = 0;
	CLRF        _CaptionButton14+29 
	CLRF        _CaptionButton14+30 
	CLRF        _CaptionButton14+31 
	CLRF        _CaptionButton14+32 
;SmartGLCD_240x128_Demo_driver.c,1051 :: 		CaptionButton15.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton15+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton15+1 
;SmartGLCD_240x128_Demo_driver.c,1052 :: 		CaptionButton15.Left        = 107;
	MOVLW       107
	MOVWF       _CaptionButton15+2 
;SmartGLCD_240x128_Demo_driver.c,1053 :: 		CaptionButton15.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton15+3 
;SmartGLCD_240x128_Demo_driver.c,1054 :: 		CaptionButton15.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton15+4 
;SmartGLCD_240x128_Demo_driver.c,1055 :: 		CaptionButton15.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton15+5 
;SmartGLCD_240x128_Demo_driver.c,1056 :: 		CaptionButton15.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton15+6 
;SmartGLCD_240x128_Demo_driver.c,1057 :: 		CaptionButton15.Caption     = CaptionButton15_Caption;
	MOVLW       _CaptionButton15_Caption+0
	MOVWF       _CaptionButton15+7 
	MOVLW       hi_addr(_CaptionButton15_Caption+0)
	MOVWF       _CaptionButton15+8 
;SmartGLCD_240x128_Demo_driver.c,1058 :: 		CaptionButton15.FontName    = 0;
	CLRF        _CaptionButton15+9 
	CLRF        _CaptionButton15+10 
	CLRF        _CaptionButton15+11 
;SmartGLCD_240x128_Demo_driver.c,1059 :: 		CaptionButton15.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton15+12 
;SmartGLCD_240x128_Demo_driver.c,1060 :: 		CaptionButton15.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton15+13 
;SmartGLCD_240x128_Demo_driver.c,1061 :: 		CaptionButton15.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton15+14 
;SmartGLCD_240x128_Demo_driver.c,1062 :: 		CaptionButton15.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton15+15 
;SmartGLCD_240x128_Demo_driver.c,1063 :: 		CaptionButton15.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton15+16 
;SmartGLCD_240x128_Demo_driver.c,1064 :: 		CaptionButton15.OnUpPtr     = 0;
	CLRF        _CaptionButton15+17 
	CLRF        _CaptionButton15+18 
	CLRF        _CaptionButton15+19 
	CLRF        _CaptionButton15+20 
;SmartGLCD_240x128_Demo_driver.c,1065 :: 		CaptionButton15.OnDownPtr   = 0;
	CLRF        _CaptionButton15+21 
	CLRF        _CaptionButton15+22 
	CLRF        _CaptionButton15+23 
	CLRF        _CaptionButton15+24 
;SmartGLCD_240x128_Demo_driver.c,1066 :: 		CaptionButton15.OnClickPtr  = CaptionButton15Click;
	MOVLW       _CaptionButton15Click+0
	MOVWF       _CaptionButton15+25 
	MOVLW       hi_addr(_CaptionButton15Click+0)
	MOVWF       _CaptionButton15+26 
	MOVLW       0
	MOVWF       _CaptionButton15+27 
	MOVLW       0
	MOVWF       _CaptionButton15+28 
;SmartGLCD_240x128_Demo_driver.c,1067 :: 		CaptionButton15.OnPressPtr  = 0;
	CLRF        _CaptionButton15+29 
	CLRF        _CaptionButton15+30 
	CLRF        _CaptionButton15+31 
	CLRF        _CaptionButton15+32 
;SmartGLCD_240x128_Demo_driver.c,1069 :: 		CaptionButton16.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton16+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton16+1 
;SmartGLCD_240x128_Demo_driver.c,1070 :: 		CaptionButton16.Left        = 131;
	MOVLW       131
	MOVWF       _CaptionButton16+2 
;SmartGLCD_240x128_Demo_driver.c,1071 :: 		CaptionButton16.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton16+3 
;SmartGLCD_240x128_Demo_driver.c,1072 :: 		CaptionButton16.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton16+4 
;SmartGLCD_240x128_Demo_driver.c,1073 :: 		CaptionButton16.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton16+5 
;SmartGLCD_240x128_Demo_driver.c,1074 :: 		CaptionButton16.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton16+6 
;SmartGLCD_240x128_Demo_driver.c,1075 :: 		CaptionButton16.Caption     = CaptionButton16_Caption;
	MOVLW       _CaptionButton16_Caption+0
	MOVWF       _CaptionButton16+7 
	MOVLW       hi_addr(_CaptionButton16_Caption+0)
	MOVWF       _CaptionButton16+8 
;SmartGLCD_240x128_Demo_driver.c,1076 :: 		CaptionButton16.FontName    = 0;
	CLRF        _CaptionButton16+9 
	CLRF        _CaptionButton16+10 
	CLRF        _CaptionButton16+11 
;SmartGLCD_240x128_Demo_driver.c,1077 :: 		CaptionButton16.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton16+12 
;SmartGLCD_240x128_Demo_driver.c,1078 :: 		CaptionButton16.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton16+13 
;SmartGLCD_240x128_Demo_driver.c,1079 :: 		CaptionButton16.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton16+14 
;SmartGLCD_240x128_Demo_driver.c,1080 :: 		CaptionButton16.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton16+15 
;SmartGLCD_240x128_Demo_driver.c,1081 :: 		CaptionButton16.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton16+16 
;SmartGLCD_240x128_Demo_driver.c,1082 :: 		CaptionButton16.OnUpPtr     = 0;
	CLRF        _CaptionButton16+17 
	CLRF        _CaptionButton16+18 
	CLRF        _CaptionButton16+19 
	CLRF        _CaptionButton16+20 
;SmartGLCD_240x128_Demo_driver.c,1083 :: 		CaptionButton16.OnDownPtr   = 0;
	CLRF        _CaptionButton16+21 
	CLRF        _CaptionButton16+22 
	CLRF        _CaptionButton16+23 
	CLRF        _CaptionButton16+24 
;SmartGLCD_240x128_Demo_driver.c,1084 :: 		CaptionButton16.OnClickPtr  = CaptionButton16Click;
	MOVLW       _CaptionButton16Click+0
	MOVWF       _CaptionButton16+25 
	MOVLW       hi_addr(_CaptionButton16Click+0)
	MOVWF       _CaptionButton16+26 
	MOVLW       0
	MOVWF       _CaptionButton16+27 
	MOVLW       0
	MOVWF       _CaptionButton16+28 
;SmartGLCD_240x128_Demo_driver.c,1085 :: 		CaptionButton16.OnPressPtr  = 0;
	CLRF        _CaptionButton16+29 
	CLRF        _CaptionButton16+30 
	CLRF        _CaptionButton16+31 
	CLRF        _CaptionButton16+32 
;SmartGLCD_240x128_Demo_driver.c,1087 :: 		CaptionButton17.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton17+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton17+1 
;SmartGLCD_240x128_Demo_driver.c,1088 :: 		CaptionButton17.Left        = 155;
	MOVLW       155
	MOVWF       _CaptionButton17+2 
;SmartGLCD_240x128_Demo_driver.c,1089 :: 		CaptionButton17.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton17+3 
;SmartGLCD_240x128_Demo_driver.c,1090 :: 		CaptionButton17.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton17+4 
;SmartGLCD_240x128_Demo_driver.c,1091 :: 		CaptionButton17.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton17+5 
;SmartGLCD_240x128_Demo_driver.c,1092 :: 		CaptionButton17.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton17+6 
;SmartGLCD_240x128_Demo_driver.c,1093 :: 		CaptionButton17.Caption     = CaptionButton17_Caption;
	MOVLW       _CaptionButton17_Caption+0
	MOVWF       _CaptionButton17+7 
	MOVLW       hi_addr(_CaptionButton17_Caption+0)
	MOVWF       _CaptionButton17+8 
;SmartGLCD_240x128_Demo_driver.c,1094 :: 		CaptionButton17.FontName    = 0;
	CLRF        _CaptionButton17+9 
	CLRF        _CaptionButton17+10 
	CLRF        _CaptionButton17+11 
;SmartGLCD_240x128_Demo_driver.c,1095 :: 		CaptionButton17.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton17+12 
;SmartGLCD_240x128_Demo_driver.c,1096 :: 		CaptionButton17.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton17+13 
;SmartGLCD_240x128_Demo_driver.c,1097 :: 		CaptionButton17.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton17+14 
;SmartGLCD_240x128_Demo_driver.c,1098 :: 		CaptionButton17.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton17+15 
;SmartGLCD_240x128_Demo_driver.c,1099 :: 		CaptionButton17.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton17+16 
;SmartGLCD_240x128_Demo_driver.c,1100 :: 		CaptionButton17.OnUpPtr     = 0;
	CLRF        _CaptionButton17+17 
	CLRF        _CaptionButton17+18 
	CLRF        _CaptionButton17+19 
	CLRF        _CaptionButton17+20 
;SmartGLCD_240x128_Demo_driver.c,1101 :: 		CaptionButton17.OnDownPtr   = 0;
	CLRF        _CaptionButton17+21 
	CLRF        _CaptionButton17+22 
	CLRF        _CaptionButton17+23 
	CLRF        _CaptionButton17+24 
;SmartGLCD_240x128_Demo_driver.c,1102 :: 		CaptionButton17.OnClickPtr  = CaptionButton17Click;
	MOVLW       _CaptionButton17Click+0
	MOVWF       _CaptionButton17+25 
	MOVLW       hi_addr(_CaptionButton17Click+0)
	MOVWF       _CaptionButton17+26 
	MOVLW       0
	MOVWF       _CaptionButton17+27 
	MOVLW       0
	MOVWF       _CaptionButton17+28 
;SmartGLCD_240x128_Demo_driver.c,1103 :: 		CaptionButton17.OnPressPtr  = 0;
	CLRF        _CaptionButton17+29 
	CLRF        _CaptionButton17+30 
	CLRF        _CaptionButton17+31 
	CLRF        _CaptionButton17+32 
;SmartGLCD_240x128_Demo_driver.c,1105 :: 		CaptionButton18.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton18+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton18+1 
;SmartGLCD_240x128_Demo_driver.c,1106 :: 		CaptionButton18.Left        = 179;
	MOVLW       179
	MOVWF       _CaptionButton18+2 
;SmartGLCD_240x128_Demo_driver.c,1107 :: 		CaptionButton18.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton18+3 
;SmartGLCD_240x128_Demo_driver.c,1108 :: 		CaptionButton18.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton18+4 
;SmartGLCD_240x128_Demo_driver.c,1109 :: 		CaptionButton18.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton18+5 
;SmartGLCD_240x128_Demo_driver.c,1110 :: 		CaptionButton18.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton18+6 
;SmartGLCD_240x128_Demo_driver.c,1111 :: 		CaptionButton18.Caption     = CaptionButton18_Caption;
	MOVLW       _CaptionButton18_Caption+0
	MOVWF       _CaptionButton18+7 
	MOVLW       hi_addr(_CaptionButton18_Caption+0)
	MOVWF       _CaptionButton18+8 
;SmartGLCD_240x128_Demo_driver.c,1112 :: 		CaptionButton18.FontName    = 0;
	CLRF        _CaptionButton18+9 
	CLRF        _CaptionButton18+10 
	CLRF        _CaptionButton18+11 
;SmartGLCD_240x128_Demo_driver.c,1113 :: 		CaptionButton18.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton18+12 
;SmartGLCD_240x128_Demo_driver.c,1114 :: 		CaptionButton18.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton18+13 
;SmartGLCD_240x128_Demo_driver.c,1115 :: 		CaptionButton18.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton18+14 
;SmartGLCD_240x128_Demo_driver.c,1116 :: 		CaptionButton18.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton18+15 
;SmartGLCD_240x128_Demo_driver.c,1117 :: 		CaptionButton18.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton18+16 
;SmartGLCD_240x128_Demo_driver.c,1118 :: 		CaptionButton18.OnUpPtr     = 0;
	CLRF        _CaptionButton18+17 
	CLRF        _CaptionButton18+18 
	CLRF        _CaptionButton18+19 
	CLRF        _CaptionButton18+20 
;SmartGLCD_240x128_Demo_driver.c,1119 :: 		CaptionButton18.OnDownPtr   = 0;
	CLRF        _CaptionButton18+21 
	CLRF        _CaptionButton18+22 
	CLRF        _CaptionButton18+23 
	CLRF        _CaptionButton18+24 
;SmartGLCD_240x128_Demo_driver.c,1120 :: 		CaptionButton18.OnClickPtr  = CaptionButton18Click;
	MOVLW       _CaptionButton18Click+0
	MOVWF       _CaptionButton18+25 
	MOVLW       hi_addr(_CaptionButton18Click+0)
	MOVWF       _CaptionButton18+26 
	MOVLW       0
	MOVWF       _CaptionButton18+27 
	MOVLW       0
	MOVWF       _CaptionButton18+28 
;SmartGLCD_240x128_Demo_driver.c,1121 :: 		CaptionButton18.OnPressPtr  = 0;
	CLRF        _CaptionButton18+29 
	CLRF        _CaptionButton18+30 
	CLRF        _CaptionButton18+31 
	CLRF        _CaptionButton18+32 
;SmartGLCD_240x128_Demo_driver.c,1123 :: 		CaptionButton19.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton19+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton19+1 
;SmartGLCD_240x128_Demo_driver.c,1124 :: 		CaptionButton19.Left        = 203;
	MOVLW       203
	MOVWF       _CaptionButton19+2 
;SmartGLCD_240x128_Demo_driver.c,1125 :: 		CaptionButton19.Top         = 27;
	MOVLW       27
	MOVWF       _CaptionButton19+3 
;SmartGLCD_240x128_Demo_driver.c,1126 :: 		CaptionButton19.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton19+4 
;SmartGLCD_240x128_Demo_driver.c,1127 :: 		CaptionButton19.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton19+5 
;SmartGLCD_240x128_Demo_driver.c,1128 :: 		CaptionButton19.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton19+6 
;SmartGLCD_240x128_Demo_driver.c,1129 :: 		CaptionButton19.Caption     = CaptionButton19_Caption;
	MOVLW       _CaptionButton19_Caption+0
	MOVWF       _CaptionButton19+7 
	MOVLW       hi_addr(_CaptionButton19_Caption+0)
	MOVWF       _CaptionButton19+8 
;SmartGLCD_240x128_Demo_driver.c,1130 :: 		CaptionButton19.FontName    = 0;
	CLRF        _CaptionButton19+9 
	CLRF        _CaptionButton19+10 
	CLRF        _CaptionButton19+11 
;SmartGLCD_240x128_Demo_driver.c,1131 :: 		CaptionButton19.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton19+12 
;SmartGLCD_240x128_Demo_driver.c,1132 :: 		CaptionButton19.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton19+13 
;SmartGLCD_240x128_Demo_driver.c,1133 :: 		CaptionButton19.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton19+14 
;SmartGLCD_240x128_Demo_driver.c,1134 :: 		CaptionButton19.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton19+15 
;SmartGLCD_240x128_Demo_driver.c,1135 :: 		CaptionButton19.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton19+16 
;SmartGLCD_240x128_Demo_driver.c,1136 :: 		CaptionButton19.OnUpPtr     = 0;
	CLRF        _CaptionButton19+17 
	CLRF        _CaptionButton19+18 
	CLRF        _CaptionButton19+19 
	CLRF        _CaptionButton19+20 
;SmartGLCD_240x128_Demo_driver.c,1137 :: 		CaptionButton19.OnDownPtr   = 0;
	CLRF        _CaptionButton19+21 
	CLRF        _CaptionButton19+22 
	CLRF        _CaptionButton19+23 
	CLRF        _CaptionButton19+24 
;SmartGLCD_240x128_Demo_driver.c,1138 :: 		CaptionButton19.OnClickPtr  = CaptionButton19Click;
	MOVLW       _CaptionButton19Click+0
	MOVWF       _CaptionButton19+25 
	MOVLW       hi_addr(_CaptionButton19Click+0)
	MOVWF       _CaptionButton19+26 
	MOVLW       0
	MOVWF       _CaptionButton19+27 
	MOVLW       0
	MOVWF       _CaptionButton19+28 
;SmartGLCD_240x128_Demo_driver.c,1139 :: 		CaptionButton19.OnPressPtr  = 0;
	CLRF        _CaptionButton19+29 
	CLRF        _CaptionButton19+30 
	CLRF        _CaptionButton19+31 
	CLRF        _CaptionButton19+32 
;SmartGLCD_240x128_Demo_driver.c,1141 :: 		CaptionButton20.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton20+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton20+1 
;SmartGLCD_240x128_Demo_driver.c,1142 :: 		CaptionButton20.Left        = 19;
	MOVLW       19
	MOVWF       _CaptionButton20+2 
;SmartGLCD_240x128_Demo_driver.c,1143 :: 		CaptionButton20.Top         = 51;
	MOVLW       51
	MOVWF       _CaptionButton20+3 
;SmartGLCD_240x128_Demo_driver.c,1144 :: 		CaptionButton20.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton20+4 
;SmartGLCD_240x128_Demo_driver.c,1145 :: 		CaptionButton20.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton20+5 
;SmartGLCD_240x128_Demo_driver.c,1146 :: 		CaptionButton20.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton20+6 
;SmartGLCD_240x128_Demo_driver.c,1147 :: 		CaptionButton20.Caption     = CaptionButton20_Caption;
	MOVLW       _CaptionButton20_Caption+0
	MOVWF       _CaptionButton20+7 
	MOVLW       hi_addr(_CaptionButton20_Caption+0)
	MOVWF       _CaptionButton20+8 
;SmartGLCD_240x128_Demo_driver.c,1148 :: 		CaptionButton20.FontName    = 0;
	CLRF        _CaptionButton20+9 
	CLRF        _CaptionButton20+10 
	CLRF        _CaptionButton20+11 
;SmartGLCD_240x128_Demo_driver.c,1149 :: 		CaptionButton20.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton20+12 
;SmartGLCD_240x128_Demo_driver.c,1150 :: 		CaptionButton20.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton20+13 
;SmartGLCD_240x128_Demo_driver.c,1151 :: 		CaptionButton20.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton20+14 
;SmartGLCD_240x128_Demo_driver.c,1152 :: 		CaptionButton20.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton20+15 
;SmartGLCD_240x128_Demo_driver.c,1153 :: 		CaptionButton20.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton20+16 
;SmartGLCD_240x128_Demo_driver.c,1154 :: 		CaptionButton20.OnUpPtr     = 0;
	CLRF        _CaptionButton20+17 
	CLRF        _CaptionButton20+18 
	CLRF        _CaptionButton20+19 
	CLRF        _CaptionButton20+20 
;SmartGLCD_240x128_Demo_driver.c,1155 :: 		CaptionButton20.OnDownPtr   = 0;
	CLRF        _CaptionButton20+21 
	CLRF        _CaptionButton20+22 
	CLRF        _CaptionButton20+23 
	CLRF        _CaptionButton20+24 
;SmartGLCD_240x128_Demo_driver.c,1156 :: 		CaptionButton20.OnClickPtr  = CaptionButton20Click;
	MOVLW       _CaptionButton20Click+0
	MOVWF       _CaptionButton20+25 
	MOVLW       hi_addr(_CaptionButton20Click+0)
	MOVWF       _CaptionButton20+26 
	MOVLW       0
	MOVWF       _CaptionButton20+27 
	MOVLW       0
	MOVWF       _CaptionButton20+28 
;SmartGLCD_240x128_Demo_driver.c,1157 :: 		CaptionButton20.OnPressPtr  = 0;
	CLRF        _CaptionButton20+29 
	CLRF        _CaptionButton20+30 
	CLRF        _CaptionButton20+31 
	CLRF        _CaptionButton20+32 
;SmartGLCD_240x128_Demo_driver.c,1159 :: 		CaptionButton21.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton21+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton21+1 
;SmartGLCD_240x128_Demo_driver.c,1160 :: 		CaptionButton21.Left        = 43;
	MOVLW       43
	MOVWF       _CaptionButton21+2 
;SmartGLCD_240x128_Demo_driver.c,1161 :: 		CaptionButton21.Top         = 51;
	MOVLW       51
	MOVWF       _CaptionButton21+3 
;SmartGLCD_240x128_Demo_driver.c,1162 :: 		CaptionButton21.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton21+4 
;SmartGLCD_240x128_Demo_driver.c,1163 :: 		CaptionButton21.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton21+5 
;SmartGLCD_240x128_Demo_driver.c,1164 :: 		CaptionButton21.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton21+6 
;SmartGLCD_240x128_Demo_driver.c,1165 :: 		CaptionButton21.Caption     = CaptionButton21_Caption;
	MOVLW       _CaptionButton21_Caption+0
	MOVWF       _CaptionButton21+7 
	MOVLW       hi_addr(_CaptionButton21_Caption+0)
	MOVWF       _CaptionButton21+8 
;SmartGLCD_240x128_Demo_driver.c,1166 :: 		CaptionButton21.FontName    = 0;
	CLRF        _CaptionButton21+9 
	CLRF        _CaptionButton21+10 
	CLRF        _CaptionButton21+11 
;SmartGLCD_240x128_Demo_driver.c,1167 :: 		CaptionButton21.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton21+12 
;SmartGLCD_240x128_Demo_driver.c,1168 :: 		CaptionButton21.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton21+13 
;SmartGLCD_240x128_Demo_driver.c,1169 :: 		CaptionButton21.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton21+14 
;SmartGLCD_240x128_Demo_driver.c,1170 :: 		CaptionButton21.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton21+15 
;SmartGLCD_240x128_Demo_driver.c,1171 :: 		CaptionButton21.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton21+16 
;SmartGLCD_240x128_Demo_driver.c,1172 :: 		CaptionButton21.OnUpPtr     = 0;
	CLRF        _CaptionButton21+17 
	CLRF        _CaptionButton21+18 
	CLRF        _CaptionButton21+19 
	CLRF        _CaptionButton21+20 
;SmartGLCD_240x128_Demo_driver.c,1173 :: 		CaptionButton21.OnDownPtr   = 0;
	CLRF        _CaptionButton21+21 
	CLRF        _CaptionButton21+22 
	CLRF        _CaptionButton21+23 
	CLRF        _CaptionButton21+24 
;SmartGLCD_240x128_Demo_driver.c,1174 :: 		CaptionButton21.OnClickPtr  = CaptionButton21Click;
	MOVLW       _CaptionButton21Click+0
	MOVWF       _CaptionButton21+25 
	MOVLW       hi_addr(_CaptionButton21Click+0)
	MOVWF       _CaptionButton21+26 
	MOVLW       0
	MOVWF       _CaptionButton21+27 
	MOVLW       0
	MOVWF       _CaptionButton21+28 
;SmartGLCD_240x128_Demo_driver.c,1175 :: 		CaptionButton21.OnPressPtr  = 0;
	CLRF        _CaptionButton21+29 
	CLRF        _CaptionButton21+30 
	CLRF        _CaptionButton21+31 
	CLRF        _CaptionButton21+32 
;SmartGLCD_240x128_Demo_driver.c,1177 :: 		CaptionButton22.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton22+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton22+1 
;SmartGLCD_240x128_Demo_driver.c,1178 :: 		CaptionButton22.Left        = 67;
	MOVLW       67
	MOVWF       _CaptionButton22+2 
;SmartGLCD_240x128_Demo_driver.c,1179 :: 		CaptionButton22.Top         = 51;
	MOVLW       51
	MOVWF       _CaptionButton22+3 
;SmartGLCD_240x128_Demo_driver.c,1180 :: 		CaptionButton22.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton22+4 
;SmartGLCD_240x128_Demo_driver.c,1181 :: 		CaptionButton22.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton22+5 
;SmartGLCD_240x128_Demo_driver.c,1182 :: 		CaptionButton22.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton22+6 
;SmartGLCD_240x128_Demo_driver.c,1183 :: 		CaptionButton22.Caption     = CaptionButton22_Caption;
	MOVLW       _CaptionButton22_Caption+0
	MOVWF       _CaptionButton22+7 
	MOVLW       hi_addr(_CaptionButton22_Caption+0)
	MOVWF       _CaptionButton22+8 
;SmartGLCD_240x128_Demo_driver.c,1184 :: 		CaptionButton22.FontName    = 0;
	CLRF        _CaptionButton22+9 
	CLRF        _CaptionButton22+10 
	CLRF        _CaptionButton22+11 
;SmartGLCD_240x128_Demo_driver.c,1185 :: 		CaptionButton22.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton22+12 
;SmartGLCD_240x128_Demo_driver.c,1186 :: 		CaptionButton22.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton22+13 
;SmartGLCD_240x128_Demo_driver.c,1187 :: 		CaptionButton22.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton22+14 
;SmartGLCD_240x128_Demo_driver.c,1188 :: 		CaptionButton22.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton22+15 
;SmartGLCD_240x128_Demo_driver.c,1189 :: 		CaptionButton22.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton22+16 
;SmartGLCD_240x128_Demo_driver.c,1190 :: 		CaptionButton22.OnUpPtr     = 0;
	CLRF        _CaptionButton22+17 
	CLRF        _CaptionButton22+18 
	CLRF        _CaptionButton22+19 
	CLRF        _CaptionButton22+20 
;SmartGLCD_240x128_Demo_driver.c,1191 :: 		CaptionButton22.OnDownPtr   = 0;
	CLRF        _CaptionButton22+21 
	CLRF        _CaptionButton22+22 
	CLRF        _CaptionButton22+23 
	CLRF        _CaptionButton22+24 
;SmartGLCD_240x128_Demo_driver.c,1192 :: 		CaptionButton22.OnClickPtr  = CaptionButton22Click;
	MOVLW       _CaptionButton22Click+0
	MOVWF       _CaptionButton22+25 
	MOVLW       hi_addr(_CaptionButton22Click+0)
	MOVWF       _CaptionButton22+26 
	MOVLW       0
	MOVWF       _CaptionButton22+27 
	MOVLW       0
	MOVWF       _CaptionButton22+28 
;SmartGLCD_240x128_Demo_driver.c,1193 :: 		CaptionButton22.OnPressPtr  = 0;
	CLRF        _CaptionButton22+29 
	CLRF        _CaptionButton22+30 
	CLRF        _CaptionButton22+31 
	CLRF        _CaptionButton22+32 
;SmartGLCD_240x128_Demo_driver.c,1195 :: 		CaptionButton23.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton23+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton23+1 
;SmartGLCD_240x128_Demo_driver.c,1196 :: 		CaptionButton23.Left        = 91;
	MOVLW       91
	MOVWF       _CaptionButton23+2 
;SmartGLCD_240x128_Demo_driver.c,1197 :: 		CaptionButton23.Top         = 51;
	MOVLW       51
	MOVWF       _CaptionButton23+3 
;SmartGLCD_240x128_Demo_driver.c,1198 :: 		CaptionButton23.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton23+4 
;SmartGLCD_240x128_Demo_driver.c,1199 :: 		CaptionButton23.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton23+5 
;SmartGLCD_240x128_Demo_driver.c,1200 :: 		CaptionButton23.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton23+6 
;SmartGLCD_240x128_Demo_driver.c,1201 :: 		CaptionButton23.Caption     = CaptionButton23_Caption;
	MOVLW       _CaptionButton23_Caption+0
	MOVWF       _CaptionButton23+7 
	MOVLW       hi_addr(_CaptionButton23_Caption+0)
	MOVWF       _CaptionButton23+8 
;SmartGLCD_240x128_Demo_driver.c,1202 :: 		CaptionButton23.FontName    = 0;
	CLRF        _CaptionButton23+9 
	CLRF        _CaptionButton23+10 
	CLRF        _CaptionButton23+11 
;SmartGLCD_240x128_Demo_driver.c,1203 :: 		CaptionButton23.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton23+12 
;SmartGLCD_240x128_Demo_driver.c,1204 :: 		CaptionButton23.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton23+13 
;SmartGLCD_240x128_Demo_driver.c,1205 :: 		CaptionButton23.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton23+14 
;SmartGLCD_240x128_Demo_driver.c,1206 :: 		CaptionButton23.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton23+15 
;SmartGLCD_240x128_Demo_driver.c,1207 :: 		CaptionButton23.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton23+16 
;SmartGLCD_240x128_Demo_driver.c,1208 :: 		CaptionButton23.OnUpPtr     = 0;
	CLRF        _CaptionButton23+17 
	CLRF        _CaptionButton23+18 
	CLRF        _CaptionButton23+19 
	CLRF        _CaptionButton23+20 
;SmartGLCD_240x128_Demo_driver.c,1209 :: 		CaptionButton23.OnDownPtr   = 0;
	CLRF        _CaptionButton23+21 
	CLRF        _CaptionButton23+22 
	CLRF        _CaptionButton23+23 
	CLRF        _CaptionButton23+24 
;SmartGLCD_240x128_Demo_driver.c,1210 :: 		CaptionButton23.OnClickPtr  = CaptionButton23Click;
	MOVLW       _CaptionButton23Click+0
	MOVWF       _CaptionButton23+25 
	MOVLW       hi_addr(_CaptionButton23Click+0)
	MOVWF       _CaptionButton23+26 
	MOVLW       0
	MOVWF       _CaptionButton23+27 
	MOVLW       0
	MOVWF       _CaptionButton23+28 
;SmartGLCD_240x128_Demo_driver.c,1211 :: 		CaptionButton23.OnPressPtr  = 0;
	CLRF        _CaptionButton23+29 
	CLRF        _CaptionButton23+30 
	CLRF        _CaptionButton23+31 
	CLRF        _CaptionButton23+32 
;SmartGLCD_240x128_Demo_driver.c,1213 :: 		CaptionButton24.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton24+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton24+1 
;SmartGLCD_240x128_Demo_driver.c,1214 :: 		CaptionButton24.Left        = 115;
	MOVLW       115
	MOVWF       _CaptionButton24+2 
;SmartGLCD_240x128_Demo_driver.c,1215 :: 		CaptionButton24.Top         = 51;
	MOVLW       51
	MOVWF       _CaptionButton24+3 
;SmartGLCD_240x128_Demo_driver.c,1216 :: 		CaptionButton24.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton24+4 
;SmartGLCD_240x128_Demo_driver.c,1217 :: 		CaptionButton24.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton24+5 
;SmartGLCD_240x128_Demo_driver.c,1218 :: 		CaptionButton24.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton24+6 
;SmartGLCD_240x128_Demo_driver.c,1219 :: 		CaptionButton24.Caption     = CaptionButton24_Caption;
	MOVLW       _CaptionButton24_Caption+0
	MOVWF       _CaptionButton24+7 
	MOVLW       hi_addr(_CaptionButton24_Caption+0)
	MOVWF       _CaptionButton24+8 
;SmartGLCD_240x128_Demo_driver.c,1220 :: 		CaptionButton24.FontName    = 0;
	CLRF        _CaptionButton24+9 
	CLRF        _CaptionButton24+10 
	CLRF        _CaptionButton24+11 
;SmartGLCD_240x128_Demo_driver.c,1221 :: 		CaptionButton24.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton24+12 
;SmartGLCD_240x128_Demo_driver.c,1222 :: 		CaptionButton24.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton24+13 
;SmartGLCD_240x128_Demo_driver.c,1223 :: 		CaptionButton24.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton24+14 
;SmartGLCD_240x128_Demo_driver.c,1224 :: 		CaptionButton24.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton24+15 
;SmartGLCD_240x128_Demo_driver.c,1225 :: 		CaptionButton24.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton24+16 
;SmartGLCD_240x128_Demo_driver.c,1226 :: 		CaptionButton24.OnUpPtr     = 0;
	CLRF        _CaptionButton24+17 
	CLRF        _CaptionButton24+18 
	CLRF        _CaptionButton24+19 
	CLRF        _CaptionButton24+20 
;SmartGLCD_240x128_Demo_driver.c,1227 :: 		CaptionButton24.OnDownPtr   = 0;
	CLRF        _CaptionButton24+21 
	CLRF        _CaptionButton24+22 
	CLRF        _CaptionButton24+23 
	CLRF        _CaptionButton24+24 
;SmartGLCD_240x128_Demo_driver.c,1228 :: 		CaptionButton24.OnClickPtr  = CaptionButton24Click;
	MOVLW       _CaptionButton24Click+0
	MOVWF       _CaptionButton24+25 
	MOVLW       hi_addr(_CaptionButton24Click+0)
	MOVWF       _CaptionButton24+26 
	MOVLW       0
	MOVWF       _CaptionButton24+27 
	MOVLW       0
	MOVWF       _CaptionButton24+28 
;SmartGLCD_240x128_Demo_driver.c,1229 :: 		CaptionButton24.OnPressPtr  = 0;
	CLRF        _CaptionButton24+29 
	CLRF        _CaptionButton24+30 
	CLRF        _CaptionButton24+31 
	CLRF        _CaptionButton24+32 
;SmartGLCD_240x128_Demo_driver.c,1231 :: 		CaptionButton25.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton25+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton25+1 
;SmartGLCD_240x128_Demo_driver.c,1232 :: 		CaptionButton25.Left        = 139;
	MOVLW       139
	MOVWF       _CaptionButton25+2 
;SmartGLCD_240x128_Demo_driver.c,1233 :: 		CaptionButton25.Top         = 51;
	MOVLW       51
	MOVWF       _CaptionButton25+3 
;SmartGLCD_240x128_Demo_driver.c,1234 :: 		CaptionButton25.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton25+4 
;SmartGLCD_240x128_Demo_driver.c,1235 :: 		CaptionButton25.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton25+5 
;SmartGLCD_240x128_Demo_driver.c,1236 :: 		CaptionButton25.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton25+6 
;SmartGLCD_240x128_Demo_driver.c,1237 :: 		CaptionButton25.Caption     = CaptionButton25_Caption;
	MOVLW       _CaptionButton25_Caption+0
	MOVWF       _CaptionButton25+7 
	MOVLW       hi_addr(_CaptionButton25_Caption+0)
	MOVWF       _CaptionButton25+8 
;SmartGLCD_240x128_Demo_driver.c,1238 :: 		CaptionButton25.FontName    = 0;
	CLRF        _CaptionButton25+9 
	CLRF        _CaptionButton25+10 
	CLRF        _CaptionButton25+11 
;SmartGLCD_240x128_Demo_driver.c,1239 :: 		CaptionButton25.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton25+12 
;SmartGLCD_240x128_Demo_driver.c,1240 :: 		CaptionButton25.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton25+13 
;SmartGLCD_240x128_Demo_driver.c,1241 :: 		CaptionButton25.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton25+14 
;SmartGLCD_240x128_Demo_driver.c,1242 :: 		CaptionButton25.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton25+15 
;SmartGLCD_240x128_Demo_driver.c,1243 :: 		CaptionButton25.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton25+16 
;SmartGLCD_240x128_Demo_driver.c,1244 :: 		CaptionButton25.OnUpPtr     = 0;
	CLRF        _CaptionButton25+17 
	CLRF        _CaptionButton25+18 
	CLRF        _CaptionButton25+19 
	CLRF        _CaptionButton25+20 
;SmartGLCD_240x128_Demo_driver.c,1245 :: 		CaptionButton25.OnDownPtr   = 0;
	CLRF        _CaptionButton25+21 
	CLRF        _CaptionButton25+22 
	CLRF        _CaptionButton25+23 
	CLRF        _CaptionButton25+24 
;SmartGLCD_240x128_Demo_driver.c,1246 :: 		CaptionButton25.OnClickPtr  = CaptionButton25Click;
	MOVLW       _CaptionButton25Click+0
	MOVWF       _CaptionButton25+25 
	MOVLW       hi_addr(_CaptionButton25Click+0)
	MOVWF       _CaptionButton25+26 
	MOVLW       0
	MOVWF       _CaptionButton25+27 
	MOVLW       0
	MOVWF       _CaptionButton25+28 
;SmartGLCD_240x128_Demo_driver.c,1247 :: 		CaptionButton25.OnPressPtr  = 0;
	CLRF        _CaptionButton25+29 
	CLRF        _CaptionButton25+30 
	CLRF        _CaptionButton25+31 
	CLRF        _CaptionButton25+32 
;SmartGLCD_240x128_Demo_driver.c,1249 :: 		CaptionButton26.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton26+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton26+1 
;SmartGLCD_240x128_Demo_driver.c,1250 :: 		CaptionButton26.Left        = 163;
	MOVLW       163
	MOVWF       _CaptionButton26+2 
;SmartGLCD_240x128_Demo_driver.c,1251 :: 		CaptionButton26.Top         = 51;
	MOVLW       51
	MOVWF       _CaptionButton26+3 
;SmartGLCD_240x128_Demo_driver.c,1252 :: 		CaptionButton26.Width       = 18;
	MOVLW       18
	MOVWF       _CaptionButton26+4 
;SmartGLCD_240x128_Demo_driver.c,1253 :: 		CaptionButton26.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton26+5 
;SmartGLCD_240x128_Demo_driver.c,1254 :: 		CaptionButton26.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton26+6 
;SmartGLCD_240x128_Demo_driver.c,1255 :: 		CaptionButton26.Caption     = CaptionButton26_Caption;
	MOVLW       _CaptionButton26_Caption+0
	MOVWF       _CaptionButton26+7 
	MOVLW       hi_addr(_CaptionButton26_Caption+0)
	MOVWF       _CaptionButton26+8 
;SmartGLCD_240x128_Demo_driver.c,1256 :: 		CaptionButton26.FontName    = 0;
	CLRF        _CaptionButton26+9 
	CLRF        _CaptionButton26+10 
	CLRF        _CaptionButton26+11 
;SmartGLCD_240x128_Demo_driver.c,1257 :: 		CaptionButton26.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton26+12 
;SmartGLCD_240x128_Demo_driver.c,1258 :: 		CaptionButton26.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton26+13 
;SmartGLCD_240x128_Demo_driver.c,1259 :: 		CaptionButton26.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton26+14 
;SmartGLCD_240x128_Demo_driver.c,1260 :: 		CaptionButton26.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton26+15 
;SmartGLCD_240x128_Demo_driver.c,1261 :: 		CaptionButton26.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton26+16 
;SmartGLCD_240x128_Demo_driver.c,1262 :: 		CaptionButton26.OnUpPtr     = 0;
	CLRF        _CaptionButton26+17 
	CLRF        _CaptionButton26+18 
	CLRF        _CaptionButton26+19 
	CLRF        _CaptionButton26+20 
;SmartGLCD_240x128_Demo_driver.c,1263 :: 		CaptionButton26.OnDownPtr   = 0;
	CLRF        _CaptionButton26+21 
	CLRF        _CaptionButton26+22 
	CLRF        _CaptionButton26+23 
	CLRF        _CaptionButton26+24 
;SmartGLCD_240x128_Demo_driver.c,1264 :: 		CaptionButton26.OnClickPtr  = CaptionButton26Click;
	MOVLW       _CaptionButton26Click+0
	MOVWF       _CaptionButton26+25 
	MOVLW       hi_addr(_CaptionButton26Click+0)
	MOVWF       _CaptionButton26+26 
	MOVLW       0
	MOVWF       _CaptionButton26+27 
	MOVLW       0
	MOVWF       _CaptionButton26+28 
;SmartGLCD_240x128_Demo_driver.c,1265 :: 		CaptionButton26.OnPressPtr  = 0;
	CLRF        _CaptionButton26+29 
	CLRF        _CaptionButton26+30 
	CLRF        _CaptionButton26+31 
	CLRF        _CaptionButton26+32 
;SmartGLCD_240x128_Demo_driver.c,1267 :: 		Image1.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _Image1+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _Image1+1 
;SmartGLCD_240x128_Demo_driver.c,1268 :: 		Image1.Left       = 186;
	MOVLW       186
	MOVWF       _Image1+2 
;SmartGLCD_240x128_Demo_driver.c,1269 :: 		Image1.Top        = 51;
	MOVLW       51
	MOVWF       _Image1+3 
;SmartGLCD_240x128_Demo_driver.c,1270 :: 		Image1.Width      = 50;
	MOVLW       50
	MOVWF       _Image1+4 
;SmartGLCD_240x128_Demo_driver.c,1271 :: 		Image1.Height     = 18;
	MOVLW       18
	MOVWF       _Image1+5 
;SmartGLCD_240x128_Demo_driver.c,1272 :: 		Image1.PictureWidth  = 50;
	MOVLW       50
	MOVWF       _Image1+6 
;SmartGLCD_240x128_Demo_driver.c,1273 :: 		Image1.PictureHeight = 18;
	MOVLW       18
	MOVWF       _Image1+7 
;SmartGLCD_240x128_Demo_driver.c,1274 :: 		Image1.PictureName = backspace;
	MOVLW       _backspace+0
	MOVWF       _Image1+8 
	MOVLW       hi_addr(_backspace+0)
	MOVWF       _Image1+9 
	MOVLW       higher_addr(_backspace+0)
	MOVWF       _Image1+10 
;SmartGLCD_240x128_Demo_driver.c,1275 :: 		Image1.Visible    = 1;
	MOVLW       1
	MOVWF       _Image1+11 
;SmartGLCD_240x128_Demo_driver.c,1276 :: 		Image1.AutoSize   = 0;
	CLRF        _Image1+12 
;SmartGLCD_240x128_Demo_driver.c,1277 :: 		Image1.OnUpPtr     = 0;
	CLRF        _Image1+13 
	CLRF        _Image1+14 
	CLRF        _Image1+15 
	CLRF        _Image1+16 
;SmartGLCD_240x128_Demo_driver.c,1278 :: 		Image1.OnDownPtr   = 0;
	CLRF        _Image1+17 
	CLRF        _Image1+18 
	CLRF        _Image1+19 
	CLRF        _Image1+20 
;SmartGLCD_240x128_Demo_driver.c,1279 :: 		Image1.OnClickPtr  = Image1Click;
	MOVLW       _Image1Click+0
	MOVWF       _Image1+21 
	MOVLW       hi_addr(_Image1Click+0)
	MOVWF       _Image1+22 
	MOVLW       0
	MOVWF       _Image1+23 
	MOVLW       0
	MOVWF       _Image1+24 
;SmartGLCD_240x128_Demo_driver.c,1280 :: 		Image1.OnPressPtr  = 0;
	CLRF        _Image1+25 
	CLRF        _Image1+26 
	CLRF        _Image1+27 
	CLRF        _Image1+28 
;SmartGLCD_240x128_Demo_driver.c,1282 :: 		CaptionButton27.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _CaptionButton27+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _CaptionButton27+1 
;SmartGLCD_240x128_Demo_driver.c,1283 :: 		CaptionButton27.Left        = 27;
	MOVLW       27
	MOVWF       _CaptionButton27+2 
;SmartGLCD_240x128_Demo_driver.c,1284 :: 		CaptionButton27.Top         = 75;
	MOVLW       75
	MOVWF       _CaptionButton27+3 
;SmartGLCD_240x128_Demo_driver.c,1285 :: 		CaptionButton27.Width       = 114;
	MOVLW       114
	MOVWF       _CaptionButton27+4 
;SmartGLCD_240x128_Demo_driver.c,1286 :: 		CaptionButton27.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton27+5 
;SmartGLCD_240x128_Demo_driver.c,1287 :: 		CaptionButton27.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton27+6 
;SmartGLCD_240x128_Demo_driver.c,1288 :: 		CaptionButton27.Caption     = CaptionButton27_Caption;
	MOVLW       _CaptionButton27_Caption+0
	MOVWF       _CaptionButton27+7 
	MOVLW       hi_addr(_CaptionButton27_Caption+0)
	MOVWF       _CaptionButton27+8 
;SmartGLCD_240x128_Demo_driver.c,1289 :: 		CaptionButton27.FontName    = 0;
	CLRF        _CaptionButton27+9 
	CLRF        _CaptionButton27+10 
	CLRF        _CaptionButton27+11 
;SmartGLCD_240x128_Demo_driver.c,1290 :: 		CaptionButton27.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton27+12 
;SmartGLCD_240x128_Demo_driver.c,1291 :: 		CaptionButton27.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton27+13 
;SmartGLCD_240x128_Demo_driver.c,1292 :: 		CaptionButton27.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton27+14 
;SmartGLCD_240x128_Demo_driver.c,1293 :: 		CaptionButton27.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton27+15 
;SmartGLCD_240x128_Demo_driver.c,1294 :: 		CaptionButton27.Visible     = 1;
	MOVLW       1
	MOVWF       _CaptionButton27+16 
;SmartGLCD_240x128_Demo_driver.c,1295 :: 		CaptionButton27.OnUpPtr     = 0;
	CLRF        _CaptionButton27+17 
	CLRF        _CaptionButton27+18 
	CLRF        _CaptionButton27+19 
	CLRF        _CaptionButton27+20 
;SmartGLCD_240x128_Demo_driver.c,1296 :: 		CaptionButton27.OnDownPtr   = 0;
	CLRF        _CaptionButton27+21 
	CLRF        _CaptionButton27+22 
	CLRF        _CaptionButton27+23 
	CLRF        _CaptionButton27+24 
;SmartGLCD_240x128_Demo_driver.c,1297 :: 		CaptionButton27.OnClickPtr  = CaptionButton27Click;
	MOVLW       _CaptionButton27Click+0
	MOVWF       _CaptionButton27+25 
	MOVLW       hi_addr(_CaptionButton27Click+0)
	MOVWF       _CaptionButton27+26 
	MOVLW       0
	MOVWF       _CaptionButton27+27 
	MOVLW       0
	MOVWF       _CaptionButton27+28 
;SmartGLCD_240x128_Demo_driver.c,1298 :: 		CaptionButton27.OnPressPtr  = 0;
	CLRF        _CaptionButton27+29 
	CLRF        _CaptionButton27+30 
	CLRF        _CaptionButton27+31 
	CLRF        _CaptionButton27+32 
;SmartGLCD_240x128_Demo_driver.c,1300 :: 		Label7.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _Label7+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _Label7+1 
;SmartGLCD_240x128_Demo_driver.c,1301 :: 		Label7.Left        = 8;
	MOVLW       8
	MOVWF       _Label7+2 
;SmartGLCD_240x128_Demo_driver.c,1302 :: 		Label7.Top         = 104;
	MOVLW       104
	MOVWF       _Label7+3 
;SmartGLCD_240x128_Demo_driver.c,1303 :: 		Label7.Width       = 1;
	MOVLW       1
	MOVWF       _Label7+4 
;SmartGLCD_240x128_Demo_driver.c,1304 :: 		Label7.Height      = 8;
	MOVLW       8
	MOVWF       _Label7+5 
;SmartGLCD_240x128_Demo_driver.c,1305 :: 		Label7.Caption     = Label7_Caption;
	MOVLW       _Label7_Caption+0
	MOVWF       _Label7+6 
	MOVLW       hi_addr(_Label7_Caption+0)
	MOVWF       _Label7+7 
;SmartGLCD_240x128_Demo_driver.c,1306 :: 		Label7.FontName    = 0;
	CLRF        _Label7+8 
	CLRF        _Label7+9 
	CLRF        _Label7+10 
;SmartGLCD_240x128_Demo_driver.c,1307 :: 		Label7.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label7+11 
;SmartGLCD_240x128_Demo_driver.c,1308 :: 		Label7.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label7+12 
;SmartGLCD_240x128_Demo_driver.c,1309 :: 		Label7.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label7+13 
;SmartGLCD_240x128_Demo_driver.c,1310 :: 		Label7.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label7+14 
;SmartGLCD_240x128_Demo_driver.c,1311 :: 		Label7.Visible     = 1;
	MOVLW       1
	MOVWF       _Label7+15 
;SmartGLCD_240x128_Demo_driver.c,1312 :: 		Label7.OnUpPtr     = 0;
	CLRF        _Label7+16 
	CLRF        _Label7+17 
	CLRF        _Label7+18 
	CLRF        _Label7+19 
;SmartGLCD_240x128_Demo_driver.c,1313 :: 		Label7.OnDownPtr   = 0;
	CLRF        _Label7+20 
	CLRF        _Label7+21 
	CLRF        _Label7+22 
	CLRF        _Label7+23 
;SmartGLCD_240x128_Demo_driver.c,1314 :: 		Label7.OnClickPtr  = 0;
	CLRF        _Label7+24 
	CLRF        _Label7+25 
	CLRF        _Label7+26 
	CLRF        _Label7+27 
;SmartGLCD_240x128_Demo_driver.c,1315 :: 		Label7.OnPressPtr  = 0;
	CLRF        _Label7+28 
	CLRF        _Label7+29 
	CLRF        _Label7+30 
	CLRF        _Label7+31 
;SmartGLCD_240x128_Demo_driver.c,1317 :: 		Rectangle2.OwnerScreen = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _Rectangle2+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _Rectangle2+1 
;SmartGLCD_240x128_Demo_driver.c,1318 :: 		Rectangle2.Left        = 5;
	MOVLW       5
	MOVWF       _Rectangle2+2 
;SmartGLCD_240x128_Demo_driver.c,1319 :: 		Rectangle2.Top         = 99;
	MOVLW       99
	MOVWF       _Rectangle2+3 
;SmartGLCD_240x128_Demo_driver.c,1320 :: 		Rectangle2.Width       = 176;
	MOVLW       176
	MOVWF       _Rectangle2+4 
;SmartGLCD_240x128_Demo_driver.c,1321 :: 		Rectangle2.Height      = 19;
	MOVLW       19
	MOVWF       _Rectangle2+5 
;SmartGLCD_240x128_Demo_driver.c,1322 :: 		Rectangle2.Visible     = 1;
	MOVLW       1
	MOVWF       _Rectangle2+6 
;SmartGLCD_240x128_Demo_driver.c,1323 :: 		Rectangle2.OnUpPtr     = 0;
	CLRF        _Rectangle2+7 
	CLRF        _Rectangle2+8 
	CLRF        _Rectangle2+9 
	CLRF        _Rectangle2+10 
;SmartGLCD_240x128_Demo_driver.c,1324 :: 		Rectangle2.OnDownPtr   = 0;
	CLRF        _Rectangle2+11 
	CLRF        _Rectangle2+12 
	CLRF        _Rectangle2+13 
	CLRF        _Rectangle2+14 
;SmartGLCD_240x128_Demo_driver.c,1325 :: 		Rectangle2.OnClickPtr  = 0;
	CLRF        _Rectangle2+15 
	CLRF        _Rectangle2+16 
	CLRF        _Rectangle2+17 
	CLRF        _Rectangle2+18 
;SmartGLCD_240x128_Demo_driver.c,1326 :: 		Rectangle2.OnPressPtr  = 0;
	CLRF        _Rectangle2+19 
	CLRF        _Rectangle2+20 
	CLRF        _Rectangle2+21 
	CLRF        _Rectangle2+22 
;SmartGLCD_240x128_Demo_driver.c,1328 :: 		RoundCaptionButton13.OwnerScreen  = &Screen3;
	MOVLW       _Screen3+0
	MOVWF       _RoundCaptionButton13+0 
	MOVLW       hi_addr(_Screen3+0)
	MOVWF       _RoundCaptionButton13+1 
;SmartGLCD_240x128_Demo_driver.c,1329 :: 		RoundCaptionButton13.Left         = 155;
	MOVLW       155
	MOVWF       _RoundCaptionButton13+2 
;SmartGLCD_240x128_Demo_driver.c,1330 :: 		RoundCaptionButton13.Top          = 75;
	MOVLW       75
	MOVWF       _RoundCaptionButton13+3 
;SmartGLCD_240x128_Demo_driver.c,1331 :: 		RoundCaptionButton13.Width        = 82;
	MOVLW       82
	MOVWF       _RoundCaptionButton13+4 
;SmartGLCD_240x128_Demo_driver.c,1332 :: 		RoundCaptionButton13.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton13+5 
;SmartGLCD_240x128_Demo_driver.c,1333 :: 		RoundCaptionButton13.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton13+6 
;SmartGLCD_240x128_Demo_driver.c,1334 :: 		RoundCaptionButton13.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton13+7 
;SmartGLCD_240x128_Demo_driver.c,1335 :: 		RoundCaptionButton13.Caption      = RoundCaptionButton13_Caption;
	MOVLW       _RoundCaptionButton13_Caption+0
	MOVWF       _RoundCaptionButton13+8 
	MOVLW       hi_addr(_RoundCaptionButton13_Caption+0)
	MOVWF       _RoundCaptionButton13+9 
;SmartGLCD_240x128_Demo_driver.c,1336 :: 		RoundCaptionButton13.FontName    = 0;
	CLRF        _RoundCaptionButton13+10 
	CLRF        _RoundCaptionButton13+11 
	CLRF        _RoundCaptionButton13+12 
;SmartGLCD_240x128_Demo_driver.c,1337 :: 		RoundCaptionButton13.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton13+13 
;SmartGLCD_240x128_Demo_driver.c,1338 :: 		RoundCaptionButton13.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton13+14 
;SmartGLCD_240x128_Demo_driver.c,1339 :: 		RoundCaptionButton13.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton13+15 
;SmartGLCD_240x128_Demo_driver.c,1340 :: 		RoundCaptionButton13.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton13+16 
;SmartGLCD_240x128_Demo_driver.c,1341 :: 		RoundCaptionButton13.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton13+17 
;SmartGLCD_240x128_Demo_driver.c,1342 :: 		RoundCaptionButton13.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton13+18 
	CLRF        _RoundCaptionButton13+19 
	CLRF        _RoundCaptionButton13+20 
	CLRF        _RoundCaptionButton13+21 
;SmartGLCD_240x128_Demo_driver.c,1343 :: 		RoundCaptionButton13.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton13+22 
	CLRF        _RoundCaptionButton13+23 
	CLRF        _RoundCaptionButton13+24 
	CLRF        _RoundCaptionButton13+25 
;SmartGLCD_240x128_Demo_driver.c,1344 :: 		RoundCaptionButton13.OnClickPtr  = RoundCaptionButton13Click;
	MOVLW       _RoundCaptionButton13Click+0
	MOVWF       _RoundCaptionButton13+26 
	MOVLW       hi_addr(_RoundCaptionButton13Click+0)
	MOVWF       _RoundCaptionButton13+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton13+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton13+29 
;SmartGLCD_240x128_Demo_driver.c,1345 :: 		RoundCaptionButton13.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton13+30 
	CLRF        _RoundCaptionButton13+31 
	CLRF        _RoundCaptionButton13+32 
	CLRF        _RoundCaptionButton13+33 
;SmartGLCD_240x128_Demo_driver.c,1347 :: 		RoundCaptionButton5.OwnerScreen  = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _RoundCaptionButton5+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _RoundCaptionButton5+1 
;SmartGLCD_240x128_Demo_driver.c,1348 :: 		RoundCaptionButton5.Left         = 187;
	MOVLW       187
	MOVWF       _RoundCaptionButton5+2 
;SmartGLCD_240x128_Demo_driver.c,1349 :: 		RoundCaptionButton5.Top          = 99;
	MOVLW       99
	MOVWF       _RoundCaptionButton5+3 
;SmartGLCD_240x128_Demo_driver.c,1350 :: 		RoundCaptionButton5.Width        = 42;
	MOVLW       42
	MOVWF       _RoundCaptionButton5+4 
;SmartGLCD_240x128_Demo_driver.c,1351 :: 		RoundCaptionButton5.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton5+5 
;SmartGLCD_240x128_Demo_driver.c,1352 :: 		RoundCaptionButton5.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton5+6 
;SmartGLCD_240x128_Demo_driver.c,1353 :: 		RoundCaptionButton5.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton5+7 
;SmartGLCD_240x128_Demo_driver.c,1354 :: 		RoundCaptionButton5.Caption      = RoundCaptionButton5_Caption;
	MOVLW       _RoundCaptionButton5_Caption+0
	MOVWF       _RoundCaptionButton5+8 
	MOVLW       hi_addr(_RoundCaptionButton5_Caption+0)
	MOVWF       _RoundCaptionButton5+9 
;SmartGLCD_240x128_Demo_driver.c,1355 :: 		RoundCaptionButton5.FontName    = 0;
	CLRF        _RoundCaptionButton5+10 
	CLRF        _RoundCaptionButton5+11 
	CLRF        _RoundCaptionButton5+12 
;SmartGLCD_240x128_Demo_driver.c,1356 :: 		RoundCaptionButton5.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton5+13 
;SmartGLCD_240x128_Demo_driver.c,1357 :: 		RoundCaptionButton5.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton5+14 
;SmartGLCD_240x128_Demo_driver.c,1358 :: 		RoundCaptionButton5.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton5+15 
;SmartGLCD_240x128_Demo_driver.c,1359 :: 		RoundCaptionButton5.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton5+16 
;SmartGLCD_240x128_Demo_driver.c,1360 :: 		RoundCaptionButton5.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton5+17 
;SmartGLCD_240x128_Demo_driver.c,1361 :: 		RoundCaptionButton5.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton5+18 
	CLRF        _RoundCaptionButton5+19 
	CLRF        _RoundCaptionButton5+20 
	CLRF        _RoundCaptionButton5+21 
;SmartGLCD_240x128_Demo_driver.c,1362 :: 		RoundCaptionButton5.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton5+22 
	CLRF        _RoundCaptionButton5+23 
	CLRF        _RoundCaptionButton5+24 
	CLRF        _RoundCaptionButton5+25 
;SmartGLCD_240x128_Demo_driver.c,1363 :: 		RoundCaptionButton5.OnClickPtr  = RoundCaptionButton5Click;
	MOVLW       _RoundCaptionButton5Click+0
	MOVWF       _RoundCaptionButton5+26 
	MOVLW       hi_addr(_RoundCaptionButton5Click+0)
	MOVWF       _RoundCaptionButton5+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton5+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton5+29 
;SmartGLCD_240x128_Demo_driver.c,1364 :: 		RoundCaptionButton5.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton5+30 
	CLRF        _RoundCaptionButton5+31 
	CLRF        _RoundCaptionButton5+32 
	CLRF        _RoundCaptionButton5+33 
;SmartGLCD_240x128_Demo_driver.c,1366 :: 		Label16.OwnerScreen = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _Label16+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _Label16+1 
;SmartGLCD_240x128_Demo_driver.c,1367 :: 		Label16.Left        = 96;
	MOVLW       96
	MOVWF       _Label16+2 
;SmartGLCD_240x128_Demo_driver.c,1368 :: 		Label16.Top         = 16;
	MOVLW       16
	MOVWF       _Label16+3 
;SmartGLCD_240x128_Demo_driver.c,1369 :: 		Label16.Width       = 40;
	MOVLW       40
	MOVWF       _Label16+4 
;SmartGLCD_240x128_Demo_driver.c,1370 :: 		Label16.Height      = 8;
	MOVLW       8
	MOVWF       _Label16+5 
;SmartGLCD_240x128_Demo_driver.c,1371 :: 		Label16.Caption     = Label16_Caption;
	MOVLW       _Label16_Caption+0
	MOVWF       _Label16+6 
	MOVLW       hi_addr(_Label16_Caption+0)
	MOVWF       _Label16+7 
;SmartGLCD_240x128_Demo_driver.c,1372 :: 		Label16.FontName    = 0;
	CLRF        _Label16+8 
	CLRF        _Label16+9 
	CLRF        _Label16+10 
;SmartGLCD_240x128_Demo_driver.c,1373 :: 		Label16.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label16+11 
;SmartGLCD_240x128_Demo_driver.c,1374 :: 		Label16.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label16+12 
;SmartGLCD_240x128_Demo_driver.c,1375 :: 		Label16.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label16+13 
;SmartGLCD_240x128_Demo_driver.c,1376 :: 		Label16.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label16+14 
;SmartGLCD_240x128_Demo_driver.c,1377 :: 		Label16.Visible     = 1;
	MOVLW       1
	MOVWF       _Label16+15 
;SmartGLCD_240x128_Demo_driver.c,1378 :: 		Label16.OnUpPtr     = 0;
	CLRF        _Label16+16 
	CLRF        _Label16+17 
	CLRF        _Label16+18 
	CLRF        _Label16+19 
;SmartGLCD_240x128_Demo_driver.c,1379 :: 		Label16.OnDownPtr   = 0;
	CLRF        _Label16+20 
	CLRF        _Label16+21 
	CLRF        _Label16+22 
	CLRF        _Label16+23 
;SmartGLCD_240x128_Demo_driver.c,1380 :: 		Label16.OnClickPtr  = 0;
	CLRF        _Label16+24 
	CLRF        _Label16+25 
	CLRF        _Label16+26 
	CLRF        _Label16+27 
;SmartGLCD_240x128_Demo_driver.c,1381 :: 		Label16.OnPressPtr  = 0;
	CLRF        _Label16+28 
	CLRF        _Label16+29 
	CLRF        _Label16+30 
	CLRF        _Label16+31 
;SmartGLCD_240x128_Demo_driver.c,1383 :: 		Label17.OwnerScreen = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _Label17+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _Label17+1 
;SmartGLCD_240x128_Demo_driver.c,1384 :: 		Label17.Left        = 8;
	MOVLW       8
	MOVWF       _Label17+2 
;SmartGLCD_240x128_Demo_driver.c,1385 :: 		Label17.Top         = 32;
	MOVLW       32
	MOVWF       _Label17+3 
;SmartGLCD_240x128_Demo_driver.c,1386 :: 		Label17.Width       = 184;
	MOVLW       184
	MOVWF       _Label17+4 
;SmartGLCD_240x128_Demo_driver.c,1387 :: 		Label17.Height      = 8;
	MOVLW       8
	MOVWF       _Label17+5 
;SmartGLCD_240x128_Demo_driver.c,1388 :: 		Label17.Caption     = Label17_Caption;
	MOVLW       _Label17_Caption+0
	MOVWF       _Label17+6 
	MOVLW       hi_addr(_Label17_Caption+0)
	MOVWF       _Label17+7 
;SmartGLCD_240x128_Demo_driver.c,1389 :: 		Label17.FontName    = 0;
	CLRF        _Label17+8 
	CLRF        _Label17+9 
	CLRF        _Label17+10 
;SmartGLCD_240x128_Demo_driver.c,1390 :: 		Label17.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label17+11 
;SmartGLCD_240x128_Demo_driver.c,1391 :: 		Label17.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label17+12 
;SmartGLCD_240x128_Demo_driver.c,1392 :: 		Label17.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label17+13 
;SmartGLCD_240x128_Demo_driver.c,1393 :: 		Label17.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label17+14 
;SmartGLCD_240x128_Demo_driver.c,1394 :: 		Label17.Visible     = 1;
	MOVLW       1
	MOVWF       _Label17+15 
;SmartGLCD_240x128_Demo_driver.c,1395 :: 		Label17.OnUpPtr     = 0;
	CLRF        _Label17+16 
	CLRF        _Label17+17 
	CLRF        _Label17+18 
	CLRF        _Label17+19 
;SmartGLCD_240x128_Demo_driver.c,1396 :: 		Label17.OnDownPtr   = 0;
	CLRF        _Label17+20 
	CLRF        _Label17+21 
	CLRF        _Label17+22 
	CLRF        _Label17+23 
;SmartGLCD_240x128_Demo_driver.c,1397 :: 		Label17.OnClickPtr  = 0;
	CLRF        _Label17+24 
	CLRF        _Label17+25 
	CLRF        _Label17+26 
	CLRF        _Label17+27 
;SmartGLCD_240x128_Demo_driver.c,1398 :: 		Label17.OnPressPtr  = 0;
	CLRF        _Label17+28 
	CLRF        _Label17+29 
	CLRF        _Label17+30 
	CLRF        _Label17+31 
;SmartGLCD_240x128_Demo_driver.c,1400 :: 		Label18.OwnerScreen = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _Label18+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _Label18+1 
;SmartGLCD_240x128_Demo_driver.c,1401 :: 		Label18.Left        = 8;
	MOVLW       8
	MOVWF       _Label18+2 
;SmartGLCD_240x128_Demo_driver.c,1402 :: 		Label18.Top         = 40;
	MOVLW       40
	MOVWF       _Label18+3 
;SmartGLCD_240x128_Demo_driver.c,1403 :: 		Label18.Width       = 208;
	MOVLW       208
	MOVWF       _Label18+4 
;SmartGLCD_240x128_Demo_driver.c,1404 :: 		Label18.Height      = 8;
	MOVLW       8
	MOVWF       _Label18+5 
;SmartGLCD_240x128_Demo_driver.c,1405 :: 		Label18.Caption     = Label18_Caption;
	MOVLW       _Label18_Caption+0
	MOVWF       _Label18+6 
	MOVLW       hi_addr(_Label18_Caption+0)
	MOVWF       _Label18+7 
;SmartGLCD_240x128_Demo_driver.c,1406 :: 		Label18.FontName    = 0;
	CLRF        _Label18+8 
	CLRF        _Label18+9 
	CLRF        _Label18+10 
;SmartGLCD_240x128_Demo_driver.c,1407 :: 		Label18.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label18+11 
;SmartGLCD_240x128_Demo_driver.c,1408 :: 		Label18.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label18+12 
;SmartGLCD_240x128_Demo_driver.c,1409 :: 		Label18.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label18+13 
;SmartGLCD_240x128_Demo_driver.c,1410 :: 		Label18.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label18+14 
;SmartGLCD_240x128_Demo_driver.c,1411 :: 		Label18.Visible     = 1;
	MOVLW       1
	MOVWF       _Label18+15 
;SmartGLCD_240x128_Demo_driver.c,1412 :: 		Label18.OnUpPtr     = 0;
	CLRF        _Label18+16 
	CLRF        _Label18+17 
	CLRF        _Label18+18 
	CLRF        _Label18+19 
;SmartGLCD_240x128_Demo_driver.c,1413 :: 		Label18.OnDownPtr   = 0;
	CLRF        _Label18+20 
	CLRF        _Label18+21 
	CLRF        _Label18+22 
	CLRF        _Label18+23 
;SmartGLCD_240x128_Demo_driver.c,1414 :: 		Label18.OnClickPtr  = 0;
	CLRF        _Label18+24 
	CLRF        _Label18+25 
	CLRF        _Label18+26 
	CLRF        _Label18+27 
;SmartGLCD_240x128_Demo_driver.c,1415 :: 		Label18.OnPressPtr  = 0;
	CLRF        _Label18+28 
	CLRF        _Label18+29 
	CLRF        _Label18+30 
	CLRF        _Label18+31 
;SmartGLCD_240x128_Demo_driver.c,1417 :: 		Label19.OwnerScreen = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _Label19+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _Label19+1 
;SmartGLCD_240x128_Demo_driver.c,1418 :: 		Label19.Left        = 8;
	MOVLW       8
	MOVWF       _Label19+2 
;SmartGLCD_240x128_Demo_driver.c,1419 :: 		Label19.Top         = 48;
	MOVLW       48
	MOVWF       _Label19+3 
;SmartGLCD_240x128_Demo_driver.c,1420 :: 		Label19.Width       = 192;
	MOVLW       192
	MOVWF       _Label19+4 
;SmartGLCD_240x128_Demo_driver.c,1421 :: 		Label19.Height      = 8;
	MOVLW       8
	MOVWF       _Label19+5 
;SmartGLCD_240x128_Demo_driver.c,1422 :: 		Label19.Caption     = Label19_Caption;
	MOVLW       _Label19_Caption+0
	MOVWF       _Label19+6 
	MOVLW       hi_addr(_Label19_Caption+0)
	MOVWF       _Label19+7 
;SmartGLCD_240x128_Demo_driver.c,1423 :: 		Label19.FontName    = 0;
	CLRF        _Label19+8 
	CLRF        _Label19+9 
	CLRF        _Label19+10 
;SmartGLCD_240x128_Demo_driver.c,1424 :: 		Label19.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label19+11 
;SmartGLCD_240x128_Demo_driver.c,1425 :: 		Label19.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label19+12 
;SmartGLCD_240x128_Demo_driver.c,1426 :: 		Label19.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label19+13 
;SmartGLCD_240x128_Demo_driver.c,1427 :: 		Label19.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label19+14 
;SmartGLCD_240x128_Demo_driver.c,1428 :: 		Label19.Visible     = 1;
	MOVLW       1
	MOVWF       _Label19+15 
;SmartGLCD_240x128_Demo_driver.c,1429 :: 		Label19.OnUpPtr     = 0;
	CLRF        _Label19+16 
	CLRF        _Label19+17 
	CLRF        _Label19+18 
	CLRF        _Label19+19 
;SmartGLCD_240x128_Demo_driver.c,1430 :: 		Label19.OnDownPtr   = 0;
	CLRF        _Label19+20 
	CLRF        _Label19+21 
	CLRF        _Label19+22 
	CLRF        _Label19+23 
;SmartGLCD_240x128_Demo_driver.c,1431 :: 		Label19.OnClickPtr  = 0;
	CLRF        _Label19+24 
	CLRF        _Label19+25 
	CLRF        _Label19+26 
	CLRF        _Label19+27 
;SmartGLCD_240x128_Demo_driver.c,1432 :: 		Label19.OnPressPtr  = 0;
	CLRF        _Label19+28 
	CLRF        _Label19+29 
	CLRF        _Label19+30 
	CLRF        _Label19+31 
;SmartGLCD_240x128_Demo_driver.c,1434 :: 		Label20.OwnerScreen = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _Label20+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _Label20+1 
;SmartGLCD_240x128_Demo_driver.c,1435 :: 		Label20.Left        = 8;
	MOVLW       8
	MOVWF       _Label20+2 
;SmartGLCD_240x128_Demo_driver.c,1436 :: 		Label20.Top         = 56;
	MOVLW       56
	MOVWF       _Label20+3 
;SmartGLCD_240x128_Demo_driver.c,1437 :: 		Label20.Width       = 184;
	MOVLW       184
	MOVWF       _Label20+4 
;SmartGLCD_240x128_Demo_driver.c,1438 :: 		Label20.Height      = 8;
	MOVLW       8
	MOVWF       _Label20+5 
;SmartGLCD_240x128_Demo_driver.c,1439 :: 		Label20.Caption     = Label20_Caption;
	MOVLW       _Label20_Caption+0
	MOVWF       _Label20+6 
	MOVLW       hi_addr(_Label20_Caption+0)
	MOVWF       _Label20+7 
;SmartGLCD_240x128_Demo_driver.c,1440 :: 		Label20.FontName    = 0;
	CLRF        _Label20+8 
	CLRF        _Label20+9 
	CLRF        _Label20+10 
;SmartGLCD_240x128_Demo_driver.c,1441 :: 		Label20.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label20+11 
;SmartGLCD_240x128_Demo_driver.c,1442 :: 		Label20.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label20+12 
;SmartGLCD_240x128_Demo_driver.c,1443 :: 		Label20.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label20+13 
;SmartGLCD_240x128_Demo_driver.c,1444 :: 		Label20.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label20+14 
;SmartGLCD_240x128_Demo_driver.c,1445 :: 		Label20.Visible     = 1;
	MOVLW       1
	MOVWF       _Label20+15 
;SmartGLCD_240x128_Demo_driver.c,1446 :: 		Label20.OnUpPtr     = 0;
	CLRF        _Label20+16 
	CLRF        _Label20+17 
	CLRF        _Label20+18 
	CLRF        _Label20+19 
;SmartGLCD_240x128_Demo_driver.c,1447 :: 		Label20.OnDownPtr   = 0;
	CLRF        _Label20+20 
	CLRF        _Label20+21 
	CLRF        _Label20+22 
	CLRF        _Label20+23 
;SmartGLCD_240x128_Demo_driver.c,1448 :: 		Label20.OnClickPtr  = 0;
	CLRF        _Label20+24 
	CLRF        _Label20+25 
	CLRF        _Label20+26 
	CLRF        _Label20+27 
;SmartGLCD_240x128_Demo_driver.c,1449 :: 		Label20.OnPressPtr  = 0;
	CLRF        _Label20+28 
	CLRF        _Label20+29 
	CLRF        _Label20+30 
	CLRF        _Label20+31 
;SmartGLCD_240x128_Demo_driver.c,1451 :: 		Label21.OwnerScreen = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _Label21+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _Label21+1 
;SmartGLCD_240x128_Demo_driver.c,1452 :: 		Label21.Left        = 8;
	MOVLW       8
	MOVWF       _Label21+2 
;SmartGLCD_240x128_Demo_driver.c,1453 :: 		Label21.Top         = 64;
	MOVLW       64
	MOVWF       _Label21+3 
;SmartGLCD_240x128_Demo_driver.c,1454 :: 		Label21.Width       = 224;
	MOVLW       224
	MOVWF       _Label21+4 
;SmartGLCD_240x128_Demo_driver.c,1455 :: 		Label21.Height      = 8;
	MOVLW       8
	MOVWF       _Label21+5 
;SmartGLCD_240x128_Demo_driver.c,1456 :: 		Label21.Caption     = Label21_Caption;
	MOVLW       _Label21_Caption+0
	MOVWF       _Label21+6 
	MOVLW       hi_addr(_Label21_Caption+0)
	MOVWF       _Label21+7 
;SmartGLCD_240x128_Demo_driver.c,1457 :: 		Label21.FontName    = 0;
	CLRF        _Label21+8 
	CLRF        _Label21+9 
	CLRF        _Label21+10 
;SmartGLCD_240x128_Demo_driver.c,1458 :: 		Label21.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label21+11 
;SmartGLCD_240x128_Demo_driver.c,1459 :: 		Label21.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label21+12 
;SmartGLCD_240x128_Demo_driver.c,1460 :: 		Label21.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label21+13 
;SmartGLCD_240x128_Demo_driver.c,1461 :: 		Label21.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label21+14 
;SmartGLCD_240x128_Demo_driver.c,1462 :: 		Label21.Visible     = 1;
	MOVLW       1
	MOVWF       _Label21+15 
;SmartGLCD_240x128_Demo_driver.c,1463 :: 		Label21.OnUpPtr     = 0;
	CLRF        _Label21+16 
	CLRF        _Label21+17 
	CLRF        _Label21+18 
	CLRF        _Label21+19 
;SmartGLCD_240x128_Demo_driver.c,1464 :: 		Label21.OnDownPtr   = 0;
	CLRF        _Label21+20 
	CLRF        _Label21+21 
	CLRF        _Label21+22 
	CLRF        _Label21+23 
;SmartGLCD_240x128_Demo_driver.c,1465 :: 		Label21.OnClickPtr  = 0;
	CLRF        _Label21+24 
	CLRF        _Label21+25 
	CLRF        _Label21+26 
	CLRF        _Label21+27 
;SmartGLCD_240x128_Demo_driver.c,1466 :: 		Label21.OnPressPtr  = 0;
	CLRF        _Label21+28 
	CLRF        _Label21+29 
	CLRF        _Label21+30 
	CLRF        _Label21+31 
;SmartGLCD_240x128_Demo_driver.c,1468 :: 		Label22.OwnerScreen = &Screen4;
	MOVLW       _Screen4+0
	MOVWF       _Label22+0 
	MOVLW       hi_addr(_Screen4+0)
	MOVWF       _Label22+1 
;SmartGLCD_240x128_Demo_driver.c,1469 :: 		Label22.Left        = 8;
	MOVLW       8
	MOVWF       _Label22+2 
;SmartGLCD_240x128_Demo_driver.c,1470 :: 		Label22.Top         = 72;
	MOVLW       72
	MOVWF       _Label22+3 
;SmartGLCD_240x128_Demo_driver.c,1471 :: 		Label22.Width       = 208;
	MOVLW       208
	MOVWF       _Label22+4 
;SmartGLCD_240x128_Demo_driver.c,1472 :: 		Label22.Height      = 8;
	MOVLW       8
	MOVWF       _Label22+5 
;SmartGLCD_240x128_Demo_driver.c,1473 :: 		Label22.Caption     = Label22_Caption;
	MOVLW       _Label22_Caption+0
	MOVWF       _Label22+6 
	MOVLW       hi_addr(_Label22_Caption+0)
	MOVWF       _Label22+7 
;SmartGLCD_240x128_Demo_driver.c,1474 :: 		Label22.FontName    = 0;
	CLRF        _Label22+8 
	CLRF        _Label22+9 
	CLRF        _Label22+10 
;SmartGLCD_240x128_Demo_driver.c,1475 :: 		Label22.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label22+11 
;SmartGLCD_240x128_Demo_driver.c,1476 :: 		Label22.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label22+12 
;SmartGLCD_240x128_Demo_driver.c,1477 :: 		Label22.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label22+13 
;SmartGLCD_240x128_Demo_driver.c,1478 :: 		Label22.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label22+14 
;SmartGLCD_240x128_Demo_driver.c,1479 :: 		Label22.Visible     = 1;
	MOVLW       1
	MOVWF       _Label22+15 
;SmartGLCD_240x128_Demo_driver.c,1480 :: 		Label22.OnUpPtr     = 0;
	CLRF        _Label22+16 
	CLRF        _Label22+17 
	CLRF        _Label22+18 
	CLRF        _Label22+19 
;SmartGLCD_240x128_Demo_driver.c,1481 :: 		Label22.OnDownPtr   = 0;
	CLRF        _Label22+20 
	CLRF        _Label22+21 
	CLRF        _Label22+22 
	CLRF        _Label22+23 
;SmartGLCD_240x128_Demo_driver.c,1482 :: 		Label22.OnClickPtr  = 0;
	CLRF        _Label22+24 
	CLRF        _Label22+25 
	CLRF        _Label22+26 
	CLRF        _Label22+27 
;SmartGLCD_240x128_Demo_driver.c,1483 :: 		Label22.OnPressPtr  = 0;
	CLRF        _Label22+28 
	CLRF        _Label22+29 
	CLRF        _Label22+30 
	CLRF        _Label22+31 
;SmartGLCD_240x128_Demo_driver.c,1485 :: 		RoundCaptionButton6.OwnerScreen  = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _RoundCaptionButton6+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _RoundCaptionButton6+1 
;SmartGLCD_240x128_Demo_driver.c,1486 :: 		RoundCaptionButton6.Left         = 187;
	MOVLW       187
	MOVWF       _RoundCaptionButton6+2 
;SmartGLCD_240x128_Demo_driver.c,1487 :: 		RoundCaptionButton6.Top          = 99;
	MOVLW       99
	MOVWF       _RoundCaptionButton6+3 
;SmartGLCD_240x128_Demo_driver.c,1488 :: 		RoundCaptionButton6.Width        = 42;
	MOVLW       42
	MOVWF       _RoundCaptionButton6+4 
;SmartGLCD_240x128_Demo_driver.c,1489 :: 		RoundCaptionButton6.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton6+5 
;SmartGLCD_240x128_Demo_driver.c,1490 :: 		RoundCaptionButton6.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton6+6 
;SmartGLCD_240x128_Demo_driver.c,1491 :: 		RoundCaptionButton6.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton6+7 
;SmartGLCD_240x128_Demo_driver.c,1492 :: 		RoundCaptionButton6.Caption      = RoundCaptionButton6_Caption;
	MOVLW       _RoundCaptionButton6_Caption+0
	MOVWF       _RoundCaptionButton6+8 
	MOVLW       hi_addr(_RoundCaptionButton6_Caption+0)
	MOVWF       _RoundCaptionButton6+9 
;SmartGLCD_240x128_Demo_driver.c,1493 :: 		RoundCaptionButton6.FontName    = 0;
	CLRF        _RoundCaptionButton6+10 
	CLRF        _RoundCaptionButton6+11 
	CLRF        _RoundCaptionButton6+12 
;SmartGLCD_240x128_Demo_driver.c,1494 :: 		RoundCaptionButton6.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton6+13 
;SmartGLCD_240x128_Demo_driver.c,1495 :: 		RoundCaptionButton6.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton6+14 
;SmartGLCD_240x128_Demo_driver.c,1496 :: 		RoundCaptionButton6.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton6+15 
;SmartGLCD_240x128_Demo_driver.c,1497 :: 		RoundCaptionButton6.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton6+16 
;SmartGLCD_240x128_Demo_driver.c,1498 :: 		RoundCaptionButton6.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton6+17 
;SmartGLCD_240x128_Demo_driver.c,1499 :: 		RoundCaptionButton6.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton6+18 
	CLRF        _RoundCaptionButton6+19 
	CLRF        _RoundCaptionButton6+20 
	CLRF        _RoundCaptionButton6+21 
;SmartGLCD_240x128_Demo_driver.c,1500 :: 		RoundCaptionButton6.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton6+22 
	CLRF        _RoundCaptionButton6+23 
	CLRF        _RoundCaptionButton6+24 
	CLRF        _RoundCaptionButton6+25 
;SmartGLCD_240x128_Demo_driver.c,1501 :: 		RoundCaptionButton6.OnClickPtr  = RoundCaptionButton6Click;
	MOVLW       _RoundCaptionButton6Click+0
	MOVWF       _RoundCaptionButton6+26 
	MOVLW       hi_addr(_RoundCaptionButton6Click+0)
	MOVWF       _RoundCaptionButton6+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton6+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton6+29 
;SmartGLCD_240x128_Demo_driver.c,1502 :: 		RoundCaptionButton6.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton6+30 
	CLRF        _RoundCaptionButton6+31 
	CLRF        _RoundCaptionButton6+32 
	CLRF        _RoundCaptionButton6+33 
;SmartGLCD_240x128_Demo_driver.c,1504 :: 		RoundCaptionButton7.OwnerScreen  = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _RoundCaptionButton7+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _RoundCaptionButton7+1 
;SmartGLCD_240x128_Demo_driver.c,1505 :: 		RoundCaptionButton7.Left         = 19;
	MOVLW       19
	MOVWF       _RoundCaptionButton7+2 
;SmartGLCD_240x128_Demo_driver.c,1506 :: 		RoundCaptionButton7.Top          = 11;
	MOVLW       11
	MOVWF       _RoundCaptionButton7+3 
;SmartGLCD_240x128_Demo_driver.c,1507 :: 		RoundCaptionButton7.Width        = 50;
	MOVLW       50
	MOVWF       _RoundCaptionButton7+4 
;SmartGLCD_240x128_Demo_driver.c,1508 :: 		RoundCaptionButton7.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton7+5 
;SmartGLCD_240x128_Demo_driver.c,1509 :: 		RoundCaptionButton7.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton7+6 
;SmartGLCD_240x128_Demo_driver.c,1510 :: 		RoundCaptionButton7.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton7+7 
;SmartGLCD_240x128_Demo_driver.c,1511 :: 		RoundCaptionButton7.Caption      = RoundCaptionButton7_Caption;
	MOVLW       _RoundCaptionButton7_Caption+0
	MOVWF       _RoundCaptionButton7+8 
	MOVLW       hi_addr(_RoundCaptionButton7_Caption+0)
	MOVWF       _RoundCaptionButton7+9 
;SmartGLCD_240x128_Demo_driver.c,1512 :: 		RoundCaptionButton7.FontName    = 0;
	CLRF        _RoundCaptionButton7+10 
	CLRF        _RoundCaptionButton7+11 
	CLRF        _RoundCaptionButton7+12 
;SmartGLCD_240x128_Demo_driver.c,1513 :: 		RoundCaptionButton7.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton7+13 
;SmartGLCD_240x128_Demo_driver.c,1514 :: 		RoundCaptionButton7.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton7+14 
;SmartGLCD_240x128_Demo_driver.c,1515 :: 		RoundCaptionButton7.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton7+15 
;SmartGLCD_240x128_Demo_driver.c,1516 :: 		RoundCaptionButton7.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton7+16 
;SmartGLCD_240x128_Demo_driver.c,1517 :: 		RoundCaptionButton7.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton7+17 
;SmartGLCD_240x128_Demo_driver.c,1518 :: 		RoundCaptionButton7.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton7+18 
	CLRF        _RoundCaptionButton7+19 
	CLRF        _RoundCaptionButton7+20 
	CLRF        _RoundCaptionButton7+21 
;SmartGLCD_240x128_Demo_driver.c,1519 :: 		RoundCaptionButton7.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton7+22 
	CLRF        _RoundCaptionButton7+23 
	CLRF        _RoundCaptionButton7+24 
	CLRF        _RoundCaptionButton7+25 
;SmartGLCD_240x128_Demo_driver.c,1520 :: 		RoundCaptionButton7.OnClickPtr  = RoundCaptionButton7Click;
	MOVLW       _RoundCaptionButton7Click+0
	MOVWF       _RoundCaptionButton7+26 
	MOVLW       hi_addr(_RoundCaptionButton7Click+0)
	MOVWF       _RoundCaptionButton7+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton7+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton7+29 
;SmartGLCD_240x128_Demo_driver.c,1521 :: 		RoundCaptionButton7.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton7+30 
	CLRF        _RoundCaptionButton7+31 
	CLRF        _RoundCaptionButton7+32 
	CLRF        _RoundCaptionButton7+33 
;SmartGLCD_240x128_Demo_driver.c,1523 :: 		RoundCaptionButton8.OwnerScreen  = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _RoundCaptionButton8+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _RoundCaptionButton8+1 
;SmartGLCD_240x128_Demo_driver.c,1524 :: 		RoundCaptionButton8.Left         = 91;
	MOVLW       91
	MOVWF       _RoundCaptionButton8+2 
;SmartGLCD_240x128_Demo_driver.c,1525 :: 		RoundCaptionButton8.Top          = 11;
	MOVLW       11
	MOVWF       _RoundCaptionButton8+3 
;SmartGLCD_240x128_Demo_driver.c,1526 :: 		RoundCaptionButton8.Width        = 50;
	MOVLW       50
	MOVWF       _RoundCaptionButton8+4 
;SmartGLCD_240x128_Demo_driver.c,1527 :: 		RoundCaptionButton8.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton8+5 
;SmartGLCD_240x128_Demo_driver.c,1528 :: 		RoundCaptionButton8.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton8+6 
;SmartGLCD_240x128_Demo_driver.c,1529 :: 		RoundCaptionButton8.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton8+7 
;SmartGLCD_240x128_Demo_driver.c,1530 :: 		RoundCaptionButton8.Caption      = RoundCaptionButton8_Caption;
	MOVLW       _RoundCaptionButton8_Caption+0
	MOVWF       _RoundCaptionButton8+8 
	MOVLW       hi_addr(_RoundCaptionButton8_Caption+0)
	MOVWF       _RoundCaptionButton8+9 
;SmartGLCD_240x128_Demo_driver.c,1531 :: 		RoundCaptionButton8.FontName    = 0;
	CLRF        _RoundCaptionButton8+10 
	CLRF        _RoundCaptionButton8+11 
	CLRF        _RoundCaptionButton8+12 
;SmartGLCD_240x128_Demo_driver.c,1532 :: 		RoundCaptionButton8.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton8+13 
;SmartGLCD_240x128_Demo_driver.c,1533 :: 		RoundCaptionButton8.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton8+14 
;SmartGLCD_240x128_Demo_driver.c,1534 :: 		RoundCaptionButton8.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton8+15 
;SmartGLCD_240x128_Demo_driver.c,1535 :: 		RoundCaptionButton8.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton8+16 
;SmartGLCD_240x128_Demo_driver.c,1536 :: 		RoundCaptionButton8.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton8+17 
;SmartGLCD_240x128_Demo_driver.c,1537 :: 		RoundCaptionButton8.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton8+18 
	CLRF        _RoundCaptionButton8+19 
	CLRF        _RoundCaptionButton8+20 
	CLRF        _RoundCaptionButton8+21 
;SmartGLCD_240x128_Demo_driver.c,1538 :: 		RoundCaptionButton8.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton8+22 
	CLRF        _RoundCaptionButton8+23 
	CLRF        _RoundCaptionButton8+24 
	CLRF        _RoundCaptionButton8+25 
;SmartGLCD_240x128_Demo_driver.c,1539 :: 		RoundCaptionButton8.OnClickPtr  = RoundCaptionButton8Click;
	MOVLW       _RoundCaptionButton8Click+0
	MOVWF       _RoundCaptionButton8+26 
	MOVLW       hi_addr(_RoundCaptionButton8Click+0)
	MOVWF       _RoundCaptionButton8+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton8+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton8+29 
;SmartGLCD_240x128_Demo_driver.c,1540 :: 		RoundCaptionButton8.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton8+30 
	CLRF        _RoundCaptionButton8+31 
	CLRF        _RoundCaptionButton8+32 
	CLRF        _RoundCaptionButton8+33 
;SmartGLCD_240x128_Demo_driver.c,1542 :: 		RoundCaptionButton9.OwnerScreen  = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _RoundCaptionButton9+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _RoundCaptionButton9+1 
;SmartGLCD_240x128_Demo_driver.c,1543 :: 		RoundCaptionButton9.Left         = 163;
	MOVLW       163
	MOVWF       _RoundCaptionButton9+2 
;SmartGLCD_240x128_Demo_driver.c,1544 :: 		RoundCaptionButton9.Top          = 11;
	MOVLW       11
	MOVWF       _RoundCaptionButton9+3 
;SmartGLCD_240x128_Demo_driver.c,1545 :: 		RoundCaptionButton9.Width        = 50;
	MOVLW       50
	MOVWF       _RoundCaptionButton9+4 
;SmartGLCD_240x128_Demo_driver.c,1546 :: 		RoundCaptionButton9.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton9+5 
;SmartGLCD_240x128_Demo_driver.c,1547 :: 		RoundCaptionButton9.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton9+6 
;SmartGLCD_240x128_Demo_driver.c,1548 :: 		RoundCaptionButton9.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton9+7 
;SmartGLCD_240x128_Demo_driver.c,1549 :: 		RoundCaptionButton9.Caption      = RoundCaptionButton9_Caption;
	MOVLW       _RoundCaptionButton9_Caption+0
	MOVWF       _RoundCaptionButton9+8 
	MOVLW       hi_addr(_RoundCaptionButton9_Caption+0)
	MOVWF       _RoundCaptionButton9+9 
;SmartGLCD_240x128_Demo_driver.c,1550 :: 		RoundCaptionButton9.FontName    = 0;
	CLRF        _RoundCaptionButton9+10 
	CLRF        _RoundCaptionButton9+11 
	CLRF        _RoundCaptionButton9+12 
;SmartGLCD_240x128_Demo_driver.c,1551 :: 		RoundCaptionButton9.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton9+13 
;SmartGLCD_240x128_Demo_driver.c,1552 :: 		RoundCaptionButton9.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton9+14 
;SmartGLCD_240x128_Demo_driver.c,1553 :: 		RoundCaptionButton9.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton9+15 
;SmartGLCD_240x128_Demo_driver.c,1554 :: 		RoundCaptionButton9.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton9+16 
;SmartGLCD_240x128_Demo_driver.c,1555 :: 		RoundCaptionButton9.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton9+17 
;SmartGLCD_240x128_Demo_driver.c,1556 :: 		RoundCaptionButton9.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton9+18 
	CLRF        _RoundCaptionButton9+19 
	CLRF        _RoundCaptionButton9+20 
	CLRF        _RoundCaptionButton9+21 
;SmartGLCD_240x128_Demo_driver.c,1557 :: 		RoundCaptionButton9.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton9+22 
	CLRF        _RoundCaptionButton9+23 
	CLRF        _RoundCaptionButton9+24 
	CLRF        _RoundCaptionButton9+25 
;SmartGLCD_240x128_Demo_driver.c,1558 :: 		RoundCaptionButton9.OnClickPtr  = RoundCaptionButton9Click;
	MOVLW       _RoundCaptionButton9Click+0
	MOVWF       _RoundCaptionButton9+26 
	MOVLW       hi_addr(_RoundCaptionButton9Click+0)
	MOVWF       _RoundCaptionButton9+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton9+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton9+29 
;SmartGLCD_240x128_Demo_driver.c,1559 :: 		RoundCaptionButton9.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton9+30 
	CLRF        _RoundCaptionButton9+31 
	CLRF        _RoundCaptionButton9+32 
	CLRF        _RoundCaptionButton9+33 
;SmartGLCD_240x128_Demo_driver.c,1561 :: 		Label3.OwnerScreen = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _Label3+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _Label3+1 
;SmartGLCD_240x128_Demo_driver.c,1562 :: 		Label3.Left        = 32;
	MOVLW       32
	MOVWF       _Label3+2 
;SmartGLCD_240x128_Demo_driver.c,1563 :: 		Label3.Top         = 32;
	MOVLW       32
	MOVWF       _Label3+3 
;SmartGLCD_240x128_Demo_driver.c,1564 :: 		Label3.Width       = 16;
	MOVLW       16
	MOVWF       _Label3+4 
;SmartGLCD_240x128_Demo_driver.c,1565 :: 		Label3.Height      = 8;
	MOVLW       8
	MOVWF       _Label3+5 
;SmartGLCD_240x128_Demo_driver.c,1566 :: 		Label3.Caption     = Label3_Caption;
	MOVLW       _Label3_Caption+0
	MOVWF       _Label3+6 
	MOVLW       hi_addr(_Label3_Caption+0)
	MOVWF       _Label3+7 
;SmartGLCD_240x128_Demo_driver.c,1567 :: 		Label3.FontName    = 0;
	CLRF        _Label3+8 
	CLRF        _Label3+9 
	CLRF        _Label3+10 
;SmartGLCD_240x128_Demo_driver.c,1568 :: 		Label3.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label3+11 
;SmartGLCD_240x128_Demo_driver.c,1569 :: 		Label3.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label3+12 
;SmartGLCD_240x128_Demo_driver.c,1570 :: 		Label3.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label3+13 
;SmartGLCD_240x128_Demo_driver.c,1571 :: 		Label3.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label3+14 
;SmartGLCD_240x128_Demo_driver.c,1572 :: 		Label3.Visible     = 1;
	MOVLW       1
	MOVWF       _Label3+15 
;SmartGLCD_240x128_Demo_driver.c,1573 :: 		Label3.OnUpPtr     = 0;
	CLRF        _Label3+16 
	CLRF        _Label3+17 
	CLRF        _Label3+18 
	CLRF        _Label3+19 
;SmartGLCD_240x128_Demo_driver.c,1574 :: 		Label3.OnDownPtr   = 0;
	CLRF        _Label3+20 
	CLRF        _Label3+21 
	CLRF        _Label3+22 
	CLRF        _Label3+23 
;SmartGLCD_240x128_Demo_driver.c,1575 :: 		Label3.OnClickPtr  = 0;
	CLRF        _Label3+24 
	CLRF        _Label3+25 
	CLRF        _Label3+26 
	CLRF        _Label3+27 
;SmartGLCD_240x128_Demo_driver.c,1576 :: 		Label3.OnPressPtr  = 0;
	CLRF        _Label3+28 
	CLRF        _Label3+29 
	CLRF        _Label3+30 
	CLRF        _Label3+31 
;SmartGLCD_240x128_Demo_driver.c,1578 :: 		Label4.OwnerScreen = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _Label4+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _Label4+1 
;SmartGLCD_240x128_Demo_driver.c,1579 :: 		Label4.Left        = 104;
	MOVLW       104
	MOVWF       _Label4+2 
;SmartGLCD_240x128_Demo_driver.c,1580 :: 		Label4.Top         = 32;
	MOVLW       32
	MOVWF       _Label4+3 
;SmartGLCD_240x128_Demo_driver.c,1581 :: 		Label4.Width       = 16;
	MOVLW       16
	MOVWF       _Label4+4 
;SmartGLCD_240x128_Demo_driver.c,1582 :: 		Label4.Height      = 8;
	MOVLW       8
	MOVWF       _Label4+5 
;SmartGLCD_240x128_Demo_driver.c,1583 :: 		Label4.Caption     = Label4_Caption;
	MOVLW       _Label4_Caption+0
	MOVWF       _Label4+6 
	MOVLW       hi_addr(_Label4_Caption+0)
	MOVWF       _Label4+7 
;SmartGLCD_240x128_Demo_driver.c,1584 :: 		Label4.FontName    = 0;
	CLRF        _Label4+8 
	CLRF        _Label4+9 
	CLRF        _Label4+10 
;SmartGLCD_240x128_Demo_driver.c,1585 :: 		Label4.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label4+11 
;SmartGLCD_240x128_Demo_driver.c,1586 :: 		Label4.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label4+12 
;SmartGLCD_240x128_Demo_driver.c,1587 :: 		Label4.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label4+13 
;SmartGLCD_240x128_Demo_driver.c,1588 :: 		Label4.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label4+14 
;SmartGLCD_240x128_Demo_driver.c,1589 :: 		Label4.Visible     = 1;
	MOVLW       1
	MOVWF       _Label4+15 
;SmartGLCD_240x128_Demo_driver.c,1590 :: 		Label4.OnUpPtr     = 0;
	CLRF        _Label4+16 
	CLRF        _Label4+17 
	CLRF        _Label4+18 
	CLRF        _Label4+19 
;SmartGLCD_240x128_Demo_driver.c,1591 :: 		Label4.OnDownPtr   = 0;
	CLRF        _Label4+20 
	CLRF        _Label4+21 
	CLRF        _Label4+22 
	CLRF        _Label4+23 
;SmartGLCD_240x128_Demo_driver.c,1592 :: 		Label4.OnClickPtr  = 0;
	CLRF        _Label4+24 
	CLRF        _Label4+25 
	CLRF        _Label4+26 
	CLRF        _Label4+27 
;SmartGLCD_240x128_Demo_driver.c,1593 :: 		Label4.OnPressPtr  = 0;
	CLRF        _Label4+28 
	CLRF        _Label4+29 
	CLRF        _Label4+30 
	CLRF        _Label4+31 
;SmartGLCD_240x128_Demo_driver.c,1595 :: 		Label5.OwnerScreen = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _Label5+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _Label5+1 
;SmartGLCD_240x128_Demo_driver.c,1596 :: 		Label5.Left        = 176;
	MOVLW       176
	MOVWF       _Label5+2 
;SmartGLCD_240x128_Demo_driver.c,1597 :: 		Label5.Top         = 32;
	MOVLW       32
	MOVWF       _Label5+3 
;SmartGLCD_240x128_Demo_driver.c,1598 :: 		Label5.Width       = 16;
	MOVLW       16
	MOVWF       _Label5+4 
;SmartGLCD_240x128_Demo_driver.c,1599 :: 		Label5.Height      = 8;
	MOVLW       8
	MOVWF       _Label5+5 
;SmartGLCD_240x128_Demo_driver.c,1600 :: 		Label5.Caption     = Label5_Caption;
	MOVLW       _Label5_Caption+0
	MOVWF       _Label5+6 
	MOVLW       hi_addr(_Label5_Caption+0)
	MOVWF       _Label5+7 
;SmartGLCD_240x128_Demo_driver.c,1601 :: 		Label5.FontName    = 0;
	CLRF        _Label5+8 
	CLRF        _Label5+9 
	CLRF        _Label5+10 
;SmartGLCD_240x128_Demo_driver.c,1602 :: 		Label5.FontWidth   = 7;
	MOVLW       7
	MOVWF       _Label5+11 
;SmartGLCD_240x128_Demo_driver.c,1603 :: 		Label5.FontHeight  = 7;
	MOVLW       7
	MOVWF       _Label5+12 
;SmartGLCD_240x128_Demo_driver.c,1604 :: 		Label5.FontOffset  = 32;
	MOVLW       32
	MOVWF       _Label5+13 
;SmartGLCD_240x128_Demo_driver.c,1605 :: 		Label5.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _Label5+14 
;SmartGLCD_240x128_Demo_driver.c,1606 :: 		Label5.Visible     = 1;
	MOVLW       1
	MOVWF       _Label5+15 
;SmartGLCD_240x128_Demo_driver.c,1607 :: 		Label5.OnUpPtr     = 0;
	CLRF        _Label5+16 
	CLRF        _Label5+17 
	CLRF        _Label5+18 
	CLRF        _Label5+19 
;SmartGLCD_240x128_Demo_driver.c,1608 :: 		Label5.OnDownPtr   = 0;
	CLRF        _Label5+20 
	CLRF        _Label5+21 
	CLRF        _Label5+22 
	CLRF        _Label5+23 
;SmartGLCD_240x128_Demo_driver.c,1609 :: 		Label5.OnClickPtr  = 0;
	CLRF        _Label5+24 
	CLRF        _Label5+25 
	CLRF        _Label5+26 
	CLRF        _Label5+27 
;SmartGLCD_240x128_Demo_driver.c,1610 :: 		Label5.OnPressPtr  = 0;
	CLRF        _Label5+28 
	CLRF        _Label5+29 
	CLRF        _Label5+30 
	CLRF        _Label5+31 
;SmartGLCD_240x128_Demo_driver.c,1612 :: 		RoundCaptionButton11.OwnerScreen  = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _RoundCaptionButton11+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _RoundCaptionButton11+1 
;SmartGLCD_240x128_Demo_driver.c,1613 :: 		RoundCaptionButton11.Left         = 59;
	MOVLW       59
	MOVWF       _RoundCaptionButton11+2 
;SmartGLCD_240x128_Demo_driver.c,1614 :: 		RoundCaptionButton11.Top          = 51;
	MOVLW       51
	MOVWF       _RoundCaptionButton11+3 
;SmartGLCD_240x128_Demo_driver.c,1615 :: 		RoundCaptionButton11.Width        = 114;
	MOVLW       114
	MOVWF       _RoundCaptionButton11+4 
;SmartGLCD_240x128_Demo_driver.c,1616 :: 		RoundCaptionButton11.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton11+5 
;SmartGLCD_240x128_Demo_driver.c,1617 :: 		RoundCaptionButton11.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton11+6 
;SmartGLCD_240x128_Demo_driver.c,1618 :: 		RoundCaptionButton11.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton11+7 
;SmartGLCD_240x128_Demo_driver.c,1619 :: 		RoundCaptionButton11.Caption      = RoundCaptionButton11_Caption;
	MOVLW       _RoundCaptionButton11_Caption+0
	MOVWF       _RoundCaptionButton11+8 
	MOVLW       hi_addr(_RoundCaptionButton11_Caption+0)
	MOVWF       _RoundCaptionButton11+9 
;SmartGLCD_240x128_Demo_driver.c,1620 :: 		RoundCaptionButton11.FontName    = 0;
	CLRF        _RoundCaptionButton11+10 
	CLRF        _RoundCaptionButton11+11 
	CLRF        _RoundCaptionButton11+12 
;SmartGLCD_240x128_Demo_driver.c,1621 :: 		RoundCaptionButton11.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton11+13 
;SmartGLCD_240x128_Demo_driver.c,1622 :: 		RoundCaptionButton11.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton11+14 
;SmartGLCD_240x128_Demo_driver.c,1623 :: 		RoundCaptionButton11.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton11+15 
;SmartGLCD_240x128_Demo_driver.c,1624 :: 		RoundCaptionButton11.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton11+16 
;SmartGLCD_240x128_Demo_driver.c,1625 :: 		RoundCaptionButton11.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton11+17 
;SmartGLCD_240x128_Demo_driver.c,1626 :: 		RoundCaptionButton11.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton11+18 
	CLRF        _RoundCaptionButton11+19 
	CLRF        _RoundCaptionButton11+20 
	CLRF        _RoundCaptionButton11+21 
;SmartGLCD_240x128_Demo_driver.c,1627 :: 		RoundCaptionButton11.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton11+22 
	CLRF        _RoundCaptionButton11+23 
	CLRF        _RoundCaptionButton11+24 
	CLRF        _RoundCaptionButton11+25 
;SmartGLCD_240x128_Demo_driver.c,1628 :: 		RoundCaptionButton11.OnClickPtr  = RoundCaptionButton11Click;
	MOVLW       _RoundCaptionButton11Click+0
	MOVWF       _RoundCaptionButton11+26 
	MOVLW       hi_addr(_RoundCaptionButton11Click+0)
	MOVWF       _RoundCaptionButton11+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton11+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton11+29 
;SmartGLCD_240x128_Demo_driver.c,1629 :: 		RoundCaptionButton11.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton11+30 
	CLRF        _RoundCaptionButton11+31 
	CLRF        _RoundCaptionButton11+32 
	CLRF        _RoundCaptionButton11+33 
;SmartGLCD_240x128_Demo_driver.c,1631 :: 		RoundCaptionButton12.OwnerScreen  = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _RoundCaptionButton12+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _RoundCaptionButton12+1 
;SmartGLCD_240x128_Demo_driver.c,1632 :: 		RoundCaptionButton12.Left         = 59;
	MOVLW       59
	MOVWF       _RoundCaptionButton12+2 
;SmartGLCD_240x128_Demo_driver.c,1633 :: 		RoundCaptionButton12.Top          = 75;
	MOVLW       75
	MOVWF       _RoundCaptionButton12+3 
;SmartGLCD_240x128_Demo_driver.c,1634 :: 		RoundCaptionButton12.Width        = 114;
	MOVLW       114
	MOVWF       _RoundCaptionButton12+4 
;SmartGLCD_240x128_Demo_driver.c,1635 :: 		RoundCaptionButton12.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton12+5 
;SmartGLCD_240x128_Demo_driver.c,1636 :: 		RoundCaptionButton12.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton12+6 
;SmartGLCD_240x128_Demo_driver.c,1637 :: 		RoundCaptionButton12.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton12+7 
;SmartGLCD_240x128_Demo_driver.c,1638 :: 		RoundCaptionButton12.Caption      = RoundCaptionButton12_Caption;
	MOVLW       _RoundCaptionButton12_Caption+0
	MOVWF       _RoundCaptionButton12+8 
	MOVLW       hi_addr(_RoundCaptionButton12_Caption+0)
	MOVWF       _RoundCaptionButton12+9 
;SmartGLCD_240x128_Demo_driver.c,1639 :: 		RoundCaptionButton12.FontName    = 0;
	CLRF        _RoundCaptionButton12+10 
	CLRF        _RoundCaptionButton12+11 
	CLRF        _RoundCaptionButton12+12 
;SmartGLCD_240x128_Demo_driver.c,1640 :: 		RoundCaptionButton12.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton12+13 
;SmartGLCD_240x128_Demo_driver.c,1641 :: 		RoundCaptionButton12.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton12+14 
;SmartGLCD_240x128_Demo_driver.c,1642 :: 		RoundCaptionButton12.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton12+15 
;SmartGLCD_240x128_Demo_driver.c,1643 :: 		RoundCaptionButton12.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton12+16 
;SmartGLCD_240x128_Demo_driver.c,1644 :: 		RoundCaptionButton12.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton12+17 
;SmartGLCD_240x128_Demo_driver.c,1645 :: 		RoundCaptionButton12.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton12+18 
	CLRF        _RoundCaptionButton12+19 
	CLRF        _RoundCaptionButton12+20 
	CLRF        _RoundCaptionButton12+21 
;SmartGLCD_240x128_Demo_driver.c,1646 :: 		RoundCaptionButton12.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton12+22 
	CLRF        _RoundCaptionButton12+23 
	CLRF        _RoundCaptionButton12+24 
	CLRF        _RoundCaptionButton12+25 
;SmartGLCD_240x128_Demo_driver.c,1647 :: 		RoundCaptionButton12.OnClickPtr  = RoundCaptionButton12Click;
	MOVLW       _RoundCaptionButton12Click+0
	MOVWF       _RoundCaptionButton12+26 
	MOVLW       hi_addr(_RoundCaptionButton12Click+0)
	MOVWF       _RoundCaptionButton12+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton12+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton12+29 
;SmartGLCD_240x128_Demo_driver.c,1648 :: 		RoundCaptionButton12.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton12+30 
	CLRF        _RoundCaptionButton12+31 
	CLRF        _RoundCaptionButton12+32 
	CLRF        _RoundCaptionButton12+33 
;SmartGLCD_240x128_Demo_driver.c,1650 :: 		RoundCaptionButton10.OwnerScreen  = &Screen5;
	MOVLW       _Screen5+0
	MOVWF       _RoundCaptionButton10+0 
	MOVLW       hi_addr(_Screen5+0)
	MOVWF       _RoundCaptionButton10+1 
;SmartGLCD_240x128_Demo_driver.c,1651 :: 		RoundCaptionButton10.Left         = 59;
	MOVLW       59
	MOVWF       _RoundCaptionButton10+2 
;SmartGLCD_240x128_Demo_driver.c,1652 :: 		RoundCaptionButton10.Top          = 99;
	MOVLW       99
	MOVWF       _RoundCaptionButton10+3 
;SmartGLCD_240x128_Demo_driver.c,1653 :: 		RoundCaptionButton10.Width        = 114;
	MOVLW       114
	MOVWF       _RoundCaptionButton10+4 
;SmartGLCD_240x128_Demo_driver.c,1654 :: 		RoundCaptionButton10.Height       = 18;
	MOVLW       18
	MOVWF       _RoundCaptionButton10+5 
;SmartGLCD_240x128_Demo_driver.c,1655 :: 		RoundCaptionButton10.BorderWidth  = 3;
	MOVLW       3
	MOVWF       _RoundCaptionButton10+6 
;SmartGLCD_240x128_Demo_driver.c,1656 :: 		RoundCaptionButton10.Round_Radius = 4;
	MOVLW       4
	MOVWF       _RoundCaptionButton10+7 
;SmartGLCD_240x128_Demo_driver.c,1657 :: 		RoundCaptionButton10.Caption      = RoundCaptionButton10_Caption;
	MOVLW       _RoundCaptionButton10_Caption+0
	MOVWF       _RoundCaptionButton10+8 
	MOVLW       hi_addr(_RoundCaptionButton10_Caption+0)
	MOVWF       _RoundCaptionButton10+9 
;SmartGLCD_240x128_Demo_driver.c,1658 :: 		RoundCaptionButton10.FontName    = 0;
	CLRF        _RoundCaptionButton10+10 
	CLRF        _RoundCaptionButton10+11 
	CLRF        _RoundCaptionButton10+12 
;SmartGLCD_240x128_Demo_driver.c,1659 :: 		RoundCaptionButton10.FontWidth    = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton10+13 
;SmartGLCD_240x128_Demo_driver.c,1660 :: 		RoundCaptionButton10.FontHeight   = 7;
	MOVLW       7
	MOVWF       _RoundCaptionButton10+14 
;SmartGLCD_240x128_Demo_driver.c,1661 :: 		RoundCaptionButton10.FontOffset   = 32;
	MOVLW       32
	MOVWF       _RoundCaptionButton10+15 
;SmartGLCD_240x128_Demo_driver.c,1662 :: 		RoundCaptionButton10.FontColor    = _clInvert;
	MOVLW       2
	MOVWF       _RoundCaptionButton10+16 
;SmartGLCD_240x128_Demo_driver.c,1663 :: 		RoundCaptionButton10.Visible      = 1;
	MOVLW       1
	MOVWF       _RoundCaptionButton10+17 
;SmartGLCD_240x128_Demo_driver.c,1664 :: 		RoundCaptionButton10.OnUpPtr     = 0;
	CLRF        _RoundCaptionButton10+18 
	CLRF        _RoundCaptionButton10+19 
	CLRF        _RoundCaptionButton10+20 
	CLRF        _RoundCaptionButton10+21 
;SmartGLCD_240x128_Demo_driver.c,1665 :: 		RoundCaptionButton10.OnDownPtr   = 0;
	CLRF        _RoundCaptionButton10+22 
	CLRF        _RoundCaptionButton10+23 
	CLRF        _RoundCaptionButton10+24 
	CLRF        _RoundCaptionButton10+25 
;SmartGLCD_240x128_Demo_driver.c,1666 :: 		RoundCaptionButton10.OnClickPtr  = RoundCaptionButton10Click;
	MOVLW       _RoundCaptionButton10Click+0
	MOVWF       _RoundCaptionButton10+26 
	MOVLW       hi_addr(_RoundCaptionButton10Click+0)
	MOVWF       _RoundCaptionButton10+27 
	MOVLW       0
	MOVWF       _RoundCaptionButton10+28 
	MOVLW       0
	MOVWF       _RoundCaptionButton10+29 
;SmartGLCD_240x128_Demo_driver.c,1667 :: 		RoundCaptionButton10.OnPressPtr  = 0;
	CLRF        _RoundCaptionButton10+30 
	CLRF        _RoundCaptionButton10+31 
	CLRF        _RoundCaptionButton10+32 
	CLRF        _RoundCaptionButton10+33 
;SmartGLCD_240x128_Demo_driver.c,1669 :: 		CaptionButton28.OwnerScreen = &Screen6;
	MOVLW       _Screen6+0
	MOVWF       _CaptionButton28+0 
	MOVLW       hi_addr(_Screen6+0)
	MOVWF       _CaptionButton28+1 
;SmartGLCD_240x128_Demo_driver.c,1670 :: 		CaptionButton28.Left        = 155;
	MOVLW       155
	MOVWF       _CaptionButton28+2 
;SmartGLCD_240x128_Demo_driver.c,1671 :: 		CaptionButton28.Top         = 107;
	MOVLW       107
	MOVWF       _CaptionButton28+3 
;SmartGLCD_240x128_Demo_driver.c,1672 :: 		CaptionButton28.Width       = 82;
	MOVLW       82
	MOVWF       _CaptionButton28+4 
;SmartGLCD_240x128_Demo_driver.c,1673 :: 		CaptionButton28.Height      = 18;
	MOVLW       18
	MOVWF       _CaptionButton28+5 
;SmartGLCD_240x128_Demo_driver.c,1674 :: 		CaptionButton28.BorderWidth = 3;
	MOVLW       3
	MOVWF       _CaptionButton28+6 
;SmartGLCD_240x128_Demo_driver.c,1675 :: 		CaptionButton28.Caption     = CaptionButton28_Caption;
	MOVLW       _CaptionButton28_Caption+0
	MOVWF       _CaptionButton28+7 
	MOVLW       hi_addr(_CaptionButton28_Caption+0)
	MOVWF       _CaptionButton28+8 
;SmartGLCD_240x128_Demo_driver.c,1676 :: 		CaptionButton28.FontName    = 0;
	CLRF        _CaptionButton28+9 
	CLRF        _CaptionButton28+10 
	CLRF        _CaptionButton28+11 
;SmartGLCD_240x128_Demo_driver.c,1677 :: 		CaptionButton28.FontWidth   = 7;
	MOVLW       7
	MOVWF       _CaptionButton28+12 
;SmartGLCD_240x128_Demo_driver.c,1678 :: 		CaptionButton28.FontHeight  = 7;
	MOVLW       7
	MOVWF       _CaptionButton28+13 
;SmartGLCD_240x128_Demo_driver.c,1679 :: 		CaptionButton28.FontOffset  = 32;
	MOVLW       32
	MOVWF       _CaptionButton28+14 
;SmartGLCD_240x128_Demo_driver.c,1680 :: 		CaptionButton28.FontColor   = _clInvert;
	MOVLW       2
	MOVWF       _CaptionButton28+15 
;SmartGLCD_240x128_Demo_driver.c,1681 :: 		CaptionButton28.Visible     = 0;
	CLRF        _CaptionButton28+16 
;SmartGLCD_240x128_Demo_driver.c,1682 :: 		CaptionButton28.OnUpPtr     = 0;
	CLRF        _CaptionButton28+17 
	CLRF        _CaptionButton28+18 
	CLRF        _CaptionButton28+19 
	CLRF        _CaptionButton28+20 
;SmartGLCD_240x128_Demo_driver.c,1683 :: 		CaptionButton28.OnDownPtr   = 0;
	CLRF        _CaptionButton28+21 
	CLRF        _CaptionButton28+22 
	CLRF        _CaptionButton28+23 
	CLRF        _CaptionButton28+24 
;SmartGLCD_240x128_Demo_driver.c,1684 :: 		CaptionButton28.OnClickPtr  = CaptionButton28Click;
	MOVLW       _CaptionButton28Click+0
	MOVWF       _CaptionButton28+25 
	MOVLW       hi_addr(_CaptionButton28Click+0)
	MOVWF       _CaptionButton28+26 
	MOVLW       0
	MOVWF       _CaptionButton28+27 
	MOVLW       0
	MOVWF       _CaptionButton28+28 
;SmartGLCD_240x128_Demo_driver.c,1685 :: 		CaptionButton28.OnPressPtr  = 0;
	CLRF        _CaptionButton28+29 
	CLRF        _CaptionButton28+30 
	CLRF        _CaptionButton28+31 
	CLRF        _CaptionButton28+32 
;SmartGLCD_240x128_Demo_driver.c,1686 :: 		}
L_end_InitializeObjects:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_InitializeObjects

SmartGLCD_240x128_Demo_driver_IsInsideObject:

;SmartGLCD_240x128_Demo_driver.c,1688 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, char Left, char Top, char Width, char Height) { // static
;SmartGLCD_240x128_Demo_driver.c,1689 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
	MOVLW       0
	SUBWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject131
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0, 0 
	SUBWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0, 0 
L_SmartGLCD_240x128_Demo_driver_IsInsideObject131:
	BTFSS       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject4
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0, 0 
	ADDWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       R3 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject132
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0, 0 
	SUBWF       R2, 0 
L_SmartGLCD_240x128_Demo_driver_IsInsideObject132:
	BTFSS       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject4
;SmartGLCD_240x128_Demo_driver.c,1690 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
	MOVLW       0
	SUBWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject133
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0, 0 
	SUBWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0, 0 
L_SmartGLCD_240x128_Demo_driver_IsInsideObject133:
	BTFSS       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject4
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0, 0 
	ADDWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       1
	SUBWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	SUBWFB      R1, 0 
	MOVWF       R3 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1, 0 
	SUBWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject134
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0, 0 
	SUBWF       R2, 0 
L_SmartGLCD_240x128_Demo_driver_IsInsideObject134:
	BTFSS       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_IsInsideObject4
L_SmartGLCD_240x128_Demo_driver_IsInsideObject124:
;SmartGLCD_240x128_Demo_driver.c,1691 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_IsInsideObject
L_SmartGLCD_240x128_Demo_driver_IsInsideObject4:
;SmartGLCD_240x128_Demo_driver.c,1693 :: 		return 0;
	CLRF        R0 
;SmartGLCD_240x128_Demo_driver.c,1694 :: 		}
L_end_IsInsideObject:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_IsInsideObject

_DrawCaptionButton:

;SmartGLCD_240x128_Demo_driver.c,1704 :: 		void DrawCaptionButton(TCaptionButton *Acaption_button) {
;SmartGLCD_240x128_Demo_driver.c,1705 :: 		T6963C_box(Acaption_button->Left, Acaption_button->Top,
	MOVLW       2
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_box_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_x0+1 
	MOVLW       3
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_box_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_box_y0+1 
;SmartGLCD_240x128_Demo_driver.c,1706 :: 		Acaption_button->Left + Acaption_button->Width - 1,
	MOVLW       4
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_box_x1+0 
	CLRF        FARG_T6963C_box_x1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_x1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_box_x1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_x1+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1707 :: 		Acaption_button->Top + Acaption_button->Height - 1, T6963C_WHITE);
	MOVLW       5
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_box_y1+0 
	CLRF        FARG_T6963C_box_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_box_y1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_box_y1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_box_y1+1, 1 
	MOVLW       8
	MOVWF       FARG_T6963C_box_pcolor+0 
	CALL        _T6963C_box+0, 0
;SmartGLCD_240x128_Demo_driver.c,1708 :: 		if ((Acaption_button->Width >= 5) && (Acaption_button->Height >= 5))
	MOVLW       4
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawCaptionButton8
	MOVLW       5
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawCaptionButton8
L__DrawCaptionButton125:
;SmartGLCD_240x128_Demo_driver.c,1709 :: 		T6963C_rectangle(Acaption_button->Left + 1, Acaption_button->Top + 1,
	MOVLW       2
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_rectangle_x0+0 
	CLRF        FARG_T6963C_rectangle_x0+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_x0+1, 1 
	MOVLW       3
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_rectangle_y0+0 
	CLRF        FARG_T6963C_rectangle_y0+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_y0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1710 :: 		Acaption_button->Left + Acaption_button->Width - 2,
	MOVLW       4
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_rectangle_x1+0 
	CLRF        FARG_T6963C_rectangle_x1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_x1+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_rectangle_x1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_rectangle_x1+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1711 :: 		Acaption_button->Top + Acaption_button->Height - 2, T6963C_BLACK);
	MOVLW       5
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_rectangle_y1+0 
	CLRF        FARG_T6963C_rectangle_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_y1+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_rectangle_y1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_rectangle_y1+1, 1 
	CLRF        FARG_T6963C_rectangle_pcolor+0 
	CALL        _T6963C_rectangle+0, 0
L_DrawCaptionButton8:
;SmartGLCD_240x128_Demo_driver.c,1712 :: 		T6963C_write_text(Acaption_button->Caption,
	MOVLW       7
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_write_text_str+1 
;SmartGLCD_240x128_Demo_driver.c,1713 :: 		(Acaption_button->Left + Acaption_button->BorderWidth + 2) / 8,
	MOVLW       2
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       6
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R5 
	MOVF        R5, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R4 
	MOVLW       3
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__DrawCaptionButton136:
	BZ          L__DrawCaptionButton137
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__DrawCaptionButton136
L__DrawCaptionButton137:
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_write_text_x+0 
;SmartGLCD_240x128_Demo_driver.c,1714 :: 		(Acaption_button->Top + Acaption_button->BorderWidth + 2) / 8, T6963C_ROM_MODE_XOR);
	MOVLW       3
	ADDWF       FARG_DrawCaptionButton_Acaption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawCaptionButton_Acaption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        R5, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R4 
	MOVLW       3
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__DrawCaptionButton138:
	BZ          L__DrawCaptionButton139
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__DrawCaptionButton138
L__DrawCaptionButton139:
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_driver.c,1715 :: 		}
L_end_DrawCaptionButton:
	RETURN      0
; end of _DrawCaptionButton

SmartGLCD_240x128_Demo_driver_DrawCaptionButtons:

;SmartGLCD_240x128_Demo_driver.c,1717 :: 		static void DrawCaptionButtons() {
;SmartGLCD_240x128_Demo_driver.c,1721 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons9:
	MOVLW       8
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons141
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons141:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons10
;SmartGLCD_240x128_Demo_driver.c,1722 :: 		local_caption_button = GetCaptionButton(i);
	MOVLW       10
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_local_caption_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_local_caption_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1723 :: 		if (local_caption_button->Visible == 1) {
	MOVLW       16
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons12
;SmartGLCD_240x128_Demo_driver.c,1724 :: 		DrawCaptionButton(local_caption_button);
	MOVF        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_local_caption_button_L0+0, 0 
	MOVWF       FARG_DrawCaptionButton_Acaption_button+0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_local_caption_button_L0+1, 0 
	MOVWF       FARG_DrawCaptionButton_Acaption_button+1 
	CALL        _DrawCaptionButton+0, 0
;SmartGLCD_240x128_Demo_driver.c,1725 :: 		}
L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons12:
;SmartGLCD_240x128_Demo_driver.c,1721 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1726 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons9
L_SmartGLCD_240x128_Demo_driver_DrawCaptionButtons10:
;SmartGLCD_240x128_Demo_driver.c,1727 :: 		}
L_end_DrawCaptionButtons:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_DrawCaptionButtons

_DrawRoundCaptionButton:

;SmartGLCD_240x128_Demo_driver.c,1730 :: 		void DrawRoundCaptionButton(TCaptionButton_Round *Around_caption_button) {
;SmartGLCD_240x128_Demo_driver.c,1731 :: 		T6963C_Rectangle_Round_Edges_Fill(Around_caption_button->Left, Around_caption_button->Top,
	MOVLW       2
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_upper_left+1 
	MOVLW       3
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_upper_left+1 
;SmartGLCD_240x128_Demo_driver.c,1732 :: 		Around_caption_button->Left + Around_caption_button->Width - 1,
	MOVLW       4
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_x_bottom_right+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1733 :: 		Around_caption_button->Top + Around_caption_button->Height - 1,  Around_caption_button->Round_Radius, T6963C_WHITE);
	MOVLW       5
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_Fill_y_bottom_right+1, 1 
	MOVLW       7
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_round_radius+1 
	MOVLW       8
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_Fill_color+0 
	CALL        _T6963C_Rectangle_Round_Edges_Fill+0, 0
;SmartGLCD_240x128_Demo_driver.c,1734 :: 		if ((Around_caption_button->Width >= 5) && (Around_caption_button->Height >= 5))
	MOVLW       4
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawRoundCaptionButton15
	MOVLW       5
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       5
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_DrawRoundCaptionButton15
L__DrawRoundCaptionButton126:
;SmartGLCD_240x128_Demo_driver.c,1735 :: 		T6963C_Rectangle_Round_Edges(Around_caption_button->Left + 1, Around_caption_button->Top + 1,
	MOVLW       2
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_upper_left+1, 1 
	MOVLW       3
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDLW       1
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_upper_left+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_upper_left+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1736 :: 		Around_caption_button->Left + Around_caption_button->Width - 2,
	MOVLW       4
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_x_bottom_right+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1737 :: 		Around_caption_button->Top + Around_caption_button->Height - 2, Around_caption_button->Round_Radius, T6963C_BLACK);
	MOVLW       5
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       2
	SUBWF       FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_Rectangle_Round_Edges_y_bottom_right+1, 1 
	MOVLW       7
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+0 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	MOVLW       0
	MOVWF       FARG_T6963C_Rectangle_Round_Edges_round_radius+1 
	CLRF        FARG_T6963C_Rectangle_Round_Edges_color+0 
	CALL        _T6963C_Rectangle_Round_Edges+0, 0
L_DrawRoundCaptionButton15:
;SmartGLCD_240x128_Demo_driver.c,1738 :: 		T6963C_write_text(Around_caption_button->Caption,
	MOVLW       8
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_write_text_str+1 
;SmartGLCD_240x128_Demo_driver.c,1739 :: 		(Around_caption_button->Left + Around_caption_button->BorderWidth + 2) / 8,
	MOVLW       2
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVLW       6
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R5 
	MOVF        R5, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R4 
	MOVLW       3
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__DrawRoundCaptionButton143:
	BZ          L__DrawRoundCaptionButton144
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__DrawRoundCaptionButton143
L__DrawRoundCaptionButton144:
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_write_text_x+0 
;SmartGLCD_240x128_Demo_driver.c,1740 :: 		(Around_caption_button->Top + Around_caption_button->BorderWidth + 2) / 8, T6963C_ROM_MODE_XOR);
	MOVLW       3
	ADDWF       FARG_DrawRoundCaptionButton_Around_caption_button+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRoundCaptionButton_Around_caption_button+1, 0 
	MOVWF       FSR0H 
	MOVF        R5, 0 
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       R3 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R4 
	MOVLW       3
	MOVWF       R2 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	MOVF        R2, 0 
L__DrawRoundCaptionButton145:
	BZ          L__DrawRoundCaptionButton146
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	BTFSC       R1, 6 
	BSF         R1, 7 
	ADDLW       255
	GOTO        L__DrawRoundCaptionButton145
L__DrawRoundCaptionButton146:
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_driver.c,1741 :: 		}
L_end_DrawRoundCaptionButton:
	RETURN      0
; end of _DrawRoundCaptionButton

SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons:

;SmartGLCD_240x128_Demo_driver.c,1743 :: 		static void DrawRoundCaptionButtons() {
;SmartGLCD_240x128_Demo_driver.c,1747 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons16:
	MOVLW       12
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons148
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons148:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons17
;SmartGLCD_240x128_Demo_driver.c,1748 :: 		local_round_caption_button = GetRoundCaptionButton(i);
	MOVLW       14
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_local_round_caption_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_local_round_caption_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1749 :: 		if (local_round_caption_button->Visible == 1) {
	MOVLW       17
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons19
;SmartGLCD_240x128_Demo_driver.c,1750 :: 		DrawRoundCaptionButton(local_round_caption_button);
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_local_round_caption_button_L0+0, 0 
	MOVWF       FARG_DrawRoundCaptionButton_Around_caption_button+0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_local_round_caption_button_L0+1, 0 
	MOVWF       FARG_DrawRoundCaptionButton_Around_caption_button+1 
	CALL        _DrawRoundCaptionButton+0, 0
;SmartGLCD_240x128_Demo_driver.c,1751 :: 		}
L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons19:
;SmartGLCD_240x128_Demo_driver.c,1747 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1752 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons16
L_SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons17:
;SmartGLCD_240x128_Demo_driver.c,1753 :: 		}
L_end_DrawRoundCaptionButtons:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons

_DrawLabel:

;SmartGLCD_240x128_Demo_driver.c,1756 :: 		void DrawLabel(TLabel *Alabel) {
;SmartGLCD_240x128_Demo_driver.c,1757 :: 		T6963C_write_text(Alabel->Caption, Alabel->Left / 8,
	MOVLW       6
	ADDWF       FARG_DrawLabel_Alabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_Alabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       2
	ADDWF       FARG_DrawLabel_Alabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_Alabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_write_text_x+0 
	RRCF        FARG_T6963C_write_text_x+0, 1 
	BCF         FARG_T6963C_write_text_x+0, 7 
	RRCF        FARG_T6963C_write_text_x+0, 1 
	BCF         FARG_T6963C_write_text_x+0, 7 
	RRCF        FARG_T6963C_write_text_x+0, 1 
	BCF         FARG_T6963C_write_text_x+0, 7 
;SmartGLCD_240x128_Demo_driver.c,1758 :: 		Alabel->Top / 8, T6963C_ROM_MODE_XOR);
	MOVLW       3
	ADDWF       FARG_DrawLabel_Alabel+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawLabel_Alabel+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_write_text_y+0 
	RRCF        FARG_T6963C_write_text_y+0, 1 
	BCF         FARG_T6963C_write_text_y+0, 7 
	RRCF        FARG_T6963C_write_text_y+0, 1 
	BCF         FARG_T6963C_write_text_y+0, 7 
	RRCF        FARG_T6963C_write_text_y+0, 1 
	BCF         FARG_T6963C_write_text_y+0, 7 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_driver.c,1759 :: 		}
L_end_DrawLabel:
	RETURN      0
; end of _DrawLabel

SmartGLCD_240x128_Demo_driver_DrawLabels:

;SmartGLCD_240x128_Demo_driver.c,1761 :: 		static void DrawLabels() {
;SmartGLCD_240x128_Demo_driver.c,1765 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_DrawLabels20:
	MOVFF       _CurrentScreen+0, FSR0
	MOVFF       _CurrentScreen+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawLabels151
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_DrawLabels151:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawLabels21
;SmartGLCD_240x128_Demo_driver.c,1766 :: 		local_label = GetLabel(i);
	MOVLW       2
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawLabels_local_label_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawLabels_local_label_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1767 :: 		if (local_label->Visible == 1) {
	MOVLW       15
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawLabels23
;SmartGLCD_240x128_Demo_driver.c,1768 :: 		DrawLabel(local_label);
	MOVF        SmartGLCD_240x128_Demo_driver_DrawLabels_local_label_L0+0, 0 
	MOVWF       FARG_DrawLabel_Alabel+0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawLabels_local_label_L0+1, 0 
	MOVWF       FARG_DrawLabel_Alabel+1 
	CALL        _DrawLabel+0, 0
;SmartGLCD_240x128_Demo_driver.c,1769 :: 		}
L_SmartGLCD_240x128_Demo_driver_DrawLabels23:
;SmartGLCD_240x128_Demo_driver.c,1765 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_DrawLabels_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1770 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawLabels20
L_SmartGLCD_240x128_Demo_driver_DrawLabels21:
;SmartGLCD_240x128_Demo_driver.c,1771 :: 		}
L_end_DrawLabels:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_DrawLabels

_DrawImage:

;SmartGLCD_240x128_Demo_driver.c,1774 :: 		void DrawImage(TImage *Aimage) {
;SmartGLCD_240x128_Demo_driver.c,1775 :: 		if (Aimage->AutoSize == 1) {
	MOVLW       12
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DrawImage24
;SmartGLCD_240x128_Demo_driver.c,1776 :: 		Aimage->Width  = Aimage->PictureWidth;
	MOVLW       4
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR1H 
	MOVLW       6
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;SmartGLCD_240x128_Demo_driver.c,1777 :: 		Aimage->Height = Aimage->PictureHeight;
	MOVLW       5
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR1H 
	MOVLW       7
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;SmartGLCD_240x128_Demo_driver.c,1778 :: 		}
L_DrawImage24:
;SmartGLCD_240x128_Demo_driver.c,1779 :: 		T6963C_PartialImage(Aimage->Left, Aimage->Top, Aimage->Width,
	MOVLW       2
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_x_left+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_x_left+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_x_left+1 
	MOVLW       3
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_y_top+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_y_top+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_y_top+1 
	MOVLW       4
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_width+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_width+1 
;SmartGLCD_240x128_Demo_driver.c,1780 :: 		Aimage->Height, Aimage->PictureWidth, Aimage->PictureHeight,
	MOVLW       5
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_height+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_height+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_height+1 
	MOVLW       6
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_picture_width+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_width+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_width+1 
	MOVLW       7
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_picture_height+0 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_height+1 
	MOVLW       0
	MOVWF       FARG_T6963C_PartialImage_picture_height+1 
;SmartGLCD_240x128_Demo_driver.c,1781 :: 		Aimage->PictureName);
	MOVLW       8
	ADDWF       FARG_DrawImage_Aimage+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawImage_Aimage+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_image+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_image+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_T6963C_PartialImage_image+2 
	CALL        _T6963C_PartialImage+0, 0
;SmartGLCD_240x128_Demo_driver.c,1782 :: 		}
L_end_DrawImage:
	RETURN      0
; end of _DrawImage

SmartGLCD_240x128_Demo_driver_DrawImages:

;SmartGLCD_240x128_Demo_driver.c,1784 :: 		static void DrawImages() {
;SmartGLCD_240x128_Demo_driver.c,1788 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_DrawImages25:
	MOVLW       4
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawImages154
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_DrawImages154:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawImages26
;SmartGLCD_240x128_Demo_driver.c,1789 :: 		local_image = GetImage(i);
	MOVLW       6
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawImages_local_image_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawImages_local_image_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1790 :: 		if (local_image->Visible == 1) {
	MOVLW       11
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawImages28
;SmartGLCD_240x128_Demo_driver.c,1791 :: 		DrawImage(local_image);
	MOVF        SmartGLCD_240x128_Demo_driver_DrawImages_local_image_L0+0, 0 
	MOVWF       FARG_DrawImage_Aimage+0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawImages_local_image_L0+1, 0 
	MOVWF       FARG_DrawImage_Aimage+1 
	CALL        _DrawImage+0, 0
;SmartGLCD_240x128_Demo_driver.c,1792 :: 		}
L_SmartGLCD_240x128_Demo_driver_DrawImages28:
;SmartGLCD_240x128_Demo_driver.c,1788 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_DrawImages_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1793 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawImages25
L_SmartGLCD_240x128_Demo_driver_DrawImages26:
;SmartGLCD_240x128_Demo_driver.c,1794 :: 		}
L_end_DrawImages:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_DrawImages

_DrawRectangle:

;SmartGLCD_240x128_Demo_driver.c,1797 :: 		void DrawRectangle(TRectangle *Arectangle) {
;SmartGLCD_240x128_Demo_driver.c,1798 :: 		T6963C_Rectangle(Arectangle->Left, Arectangle->Top,
	MOVLW       2
	ADDWF       FARG_DrawRectangle_Arectangle+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRectangle_Arectangle+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       FARG_T6963C_rectangle_x0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_x0+1 
	MOVLW       3
	ADDWF       FARG_DrawRectangle_Arectangle+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DrawRectangle_Arectangle+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       FARG_T6963C_rectangle_y0+0 
	MOVLW       0
	MOVWF       FARG_T6963C_rectangle_y0+1 
;SmartGLCD_240x128_Demo_driver.c,1799 :: 		Arectangle->Left + Arectangle->Width - 1,
	MOVLW       4
	ADDWF       FARG_DrawRectangle_Arectangle+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRectangle_Arectangle+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R1, 0 
	MOVWF       FARG_T6963C_rectangle_x1+0 
	CLRF        FARG_T6963C_rectangle_x1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_x1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_rectangle_x1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_rectangle_x1+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1800 :: 		Arectangle->Top + Arectangle->Height - 1, T6963C_WHITE);
	MOVLW       5
	ADDWF       FARG_DrawRectangle_Arectangle+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DrawRectangle_Arectangle+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FARG_T6963C_rectangle_y1+0 
	CLRF        FARG_T6963C_rectangle_y1+1 
	MOVLW       0
	ADDWFC      FARG_T6963C_rectangle_y1+1, 1 
	MOVLW       1
	SUBWF       FARG_T6963C_rectangle_y1+0, 1 
	MOVLW       0
	SUBWFB      FARG_T6963C_rectangle_y1+1, 1 
	MOVLW       8
	MOVWF       FARG_T6963C_rectangle_pcolor+0 
	CALL        _T6963C_rectangle+0, 0
;SmartGLCD_240x128_Demo_driver.c,1801 :: 		}
L_end_DrawRectangle:
	RETURN      0
; end of _DrawRectangle

SmartGLCD_240x128_Demo_driver_DrawRectangles:

;SmartGLCD_240x128_Demo_driver.c,1803 :: 		static void DrawRectangles() {
;SmartGLCD_240x128_Demo_driver.c,1807 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_DrawRectangles29:
	MOVLW       16
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRectangles157
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_DrawRectangles157:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRectangles30
;SmartGLCD_240x128_Demo_driver.c,1808 :: 		local_rectangle = GetRectangle(i);
	MOVLW       18
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawRectangles_local_rectangle_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_DrawRectangles_local_rectangle_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1809 :: 		if (local_rectangle->Visible == 1) {
	MOVLW       6
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRectangles32
;SmartGLCD_240x128_Demo_driver.c,1810 :: 		DrawRectangle(local_rectangle);
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRectangles_local_rectangle_L0+0, 0 
	MOVWF       FARG_DrawRectangle_Arectangle+0 
	MOVF        SmartGLCD_240x128_Demo_driver_DrawRectangles_local_rectangle_L0+1, 0 
	MOVWF       FARG_DrawRectangle_Arectangle+1 
	CALL        _DrawRectangle+0, 0
;SmartGLCD_240x128_Demo_driver.c,1811 :: 		}
L_SmartGLCD_240x128_Demo_driver_DrawRectangles32:
;SmartGLCD_240x128_Demo_driver.c,1807 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_DrawRectangles_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1812 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_DrawRectangles29
L_SmartGLCD_240x128_Demo_driver_DrawRectangles30:
;SmartGLCD_240x128_Demo_driver.c,1813 :: 		}
L_end_DrawRectangles:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_DrawRectangles

_DrawScreen:

;SmartGLCD_240x128_Demo_driver.c,1815 :: 		void DrawScreen(TScreen *aScreen) {
;SmartGLCD_240x128_Demo_driver.c,1816 :: 		T6963C_grFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD_240x128_Demo_driver.c,1817 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD_240x128_Demo_driver.c,1819 :: 		CurrentScreen = aScreen;
	MOVF        FARG_DrawScreen_aScreen+0, 0 
	MOVWF       _CurrentScreen+0 
	MOVF        FARG_DrawScreen_aScreen+1, 0 
	MOVWF       _CurrentScreen+1 
;SmartGLCD_240x128_Demo_driver.c,1821 :: 		DrawImages();
	CALL        SmartGLCD_240x128_Demo_driver_DrawImages+0, 0
;SmartGLCD_240x128_Demo_driver.c,1823 :: 		DrawCaptionButtons();
	CALL        SmartGLCD_240x128_Demo_driver_DrawCaptionButtons+0, 0
;SmartGLCD_240x128_Demo_driver.c,1825 :: 		DrawRoundCaptionButtons();
	CALL        SmartGLCD_240x128_Demo_driver_DrawRoundCaptionButtons+0, 0
;SmartGLCD_240x128_Demo_driver.c,1827 :: 		DrawRectangles();
	CALL        SmartGLCD_240x128_Demo_driver_DrawRectangles+0, 0
;SmartGLCD_240x128_Demo_driver.c,1830 :: 		DrawLabels();
	CALL        SmartGLCD_240x128_Demo_driver_DrawLabels+0, 0
;SmartGLCD_240x128_Demo_driver.c,1832 :: 		}
L_end_DrawScreen:
	RETURN      0
; end of _DrawScreen

SmartGLCD_240x128_Demo_driver_Process_TP_Press:

;SmartGLCD_240x128_Demo_driver.c,1834 :: 		static void Process_TP_Press(unsigned int X, unsigned int Y) {
;SmartGLCD_240x128_Demo_driver.c,1843 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press33:
	MOVLW       8
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press160
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press160:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press34
;SmartGLCD_240x128_Demo_driver.c,1844 :: 		local_caption_button = GetCaptionButton(i);
	MOVLW       10
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1845 :: 		if (IsInsideObject(X, Y, local_caption_button->Left, local_caption_button->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1846 :: 		local_caption_button->Width, local_caption_button->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press36
;SmartGLCD_240x128_Demo_driver.c,1847 :: 		if (local_caption_button->OnPressPtr != 0) {
	MOVLW       29
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press161
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press161
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press161
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press161:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press37
;SmartGLCD_240x128_Demo_driver.c,1848 :: 		local_caption_button->OnPressPtr();
	MOVLW       29
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,1849 :: 		return;
	GOTO        L_end_Process_TP_Press
;SmartGLCD_240x128_Demo_driver.c,1850 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press37:
;SmartGLCD_240x128_Demo_driver.c,1851 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press36:
;SmartGLCD_240x128_Demo_driver.c,1843 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1852 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press33
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press34:
;SmartGLCD_240x128_Demo_driver.c,1855 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press38:
	MOVLW       12
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press162
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press162:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press39
;SmartGLCD_240x128_Demo_driver.c,1856 :: 		local_caption_round_button = GetRoundCaptionButton(i);
	MOVLW       14
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_round_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_round_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1857 :: 		if (IsInsideObject(X, Y, local_caption_round_button->Left, local_caption_round_button->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1858 :: 		local_caption_round_button->Width, local_caption_round_button->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press41
;SmartGLCD_240x128_Demo_driver.c,1859 :: 		if (local_caption_round_button->OnPressPtr != 0) {
	MOVLW       30
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press163
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press163
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press163
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press163:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press42
;SmartGLCD_240x128_Demo_driver.c,1860 :: 		local_caption_round_button->OnPressPtr();
	MOVLW       30
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,1861 :: 		return;
	GOTO        L_end_Process_TP_Press
;SmartGLCD_240x128_Demo_driver.c,1862 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press42:
;SmartGLCD_240x128_Demo_driver.c,1863 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press41:
;SmartGLCD_240x128_Demo_driver.c,1855 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1864 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press38
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press39:
;SmartGLCD_240x128_Demo_driver.c,1867 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press43:
	MOVFF       _CurrentScreen+0, FSR0
	MOVFF       _CurrentScreen+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press164
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press164:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press44
;SmartGLCD_240x128_Demo_driver.c,1868 :: 		local_label = GetLabel(i);
	MOVLW       2
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_label_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_label_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1869 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1870 :: 		local_label->Width, local_label->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press46
;SmartGLCD_240x128_Demo_driver.c,1871 :: 		if (local_label->OnPressPtr != 0) {
	MOVLW       28
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press165
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press165
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press165
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press165:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press47
;SmartGLCD_240x128_Demo_driver.c,1872 :: 		local_label->OnPressPtr();
	MOVLW       28
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,1873 :: 		return;
	GOTO        L_end_Process_TP_Press
;SmartGLCD_240x128_Demo_driver.c,1874 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press47:
;SmartGLCD_240x128_Demo_driver.c,1875 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press46:
;SmartGLCD_240x128_Demo_driver.c,1867 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1876 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press43
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press44:
;SmartGLCD_240x128_Demo_driver.c,1879 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press48:
	MOVLW       4
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press166
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press166:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press49
;SmartGLCD_240x128_Demo_driver.c,1880 :: 		local_image = GetImage(i);
	MOVLW       6
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_image_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_image_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1881 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1882 :: 		local_image->Width, local_image->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press51
;SmartGLCD_240x128_Demo_driver.c,1883 :: 		if (local_image->OnPressPtr != 0) {
	MOVLW       25
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press167
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press167
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press167
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press167:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press52
;SmartGLCD_240x128_Demo_driver.c,1884 :: 		local_image->OnPressPtr();
	MOVLW       25
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,1885 :: 		return;
	GOTO        L_end_Process_TP_Press
;SmartGLCD_240x128_Demo_driver.c,1886 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press52:
;SmartGLCD_240x128_Demo_driver.c,1887 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press51:
;SmartGLCD_240x128_Demo_driver.c,1879 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1888 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press48
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press49:
;SmartGLCD_240x128_Demo_driver.c,1891 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press53:
	MOVLW       16
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press168
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press168:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press54
;SmartGLCD_240x128_Demo_driver.c,1892 :: 		local_rectangle = GetRectangle(i);
	MOVLW       18
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_rectangle_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_rectangle_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1893 :: 		if (IsInsideObject(X, Y, local_rectangle->Left, local_rectangle->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1894 :: 		local_rectangle->Width, local_rectangle->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press56
;SmartGLCD_240x128_Demo_driver.c,1895 :: 		if (local_rectangle->OnPressPtr != 0) {
	MOVLW       19
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press169
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press169
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press169
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press169:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press57
;SmartGLCD_240x128_Demo_driver.c,1896 :: 		local_rectangle->OnPressPtr();
	MOVLW       19
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Press_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,1897 :: 		return;
	GOTO        L_end_Process_TP_Press
;SmartGLCD_240x128_Demo_driver.c,1898 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press57:
;SmartGLCD_240x128_Demo_driver.c,1899 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press56:
;SmartGLCD_240x128_Demo_driver.c,1891 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Press_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1900 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Press53
L_SmartGLCD_240x128_Demo_driver_Process_TP_Press54:
;SmartGLCD_240x128_Demo_driver.c,1902 :: 		}
L_end_Process_TP_Press:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_Process_TP_Press

SmartGLCD_240x128_Demo_driver_Process_TP_Up:

;SmartGLCD_240x128_Demo_driver.c,1904 :: 		static void Process_TP_Up(unsigned int X, unsigned int Y) {
;SmartGLCD_240x128_Demo_driver.c,1913 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up58:
	MOVLW       8
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up171
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up171:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up59
;SmartGLCD_240x128_Demo_driver.c,1914 :: 		local_caption_button = GetCaptionButton(i);
	MOVLW       10
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1915 :: 		if (IsInsideObject(X, Y, local_caption_button->Left, local_caption_button->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1916 :: 		local_caption_button->Width, local_caption_button->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up61
;SmartGLCD_240x128_Demo_driver.c,1917 :: 		if (local_caption_button->OnUpPtr != 0)
	MOVLW       17
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up172
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up172
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up172
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up172:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up62
;SmartGLCD_240x128_Demo_driver.c,1918 :: 		local_caption_button->OnUpPtr();
	MOVLW       17
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up62:
;SmartGLCD_240x128_Demo_driver.c,1920 :: 		if (PressedObject == (void *)local_caption_button)
	MOVF        _PressedObject+1, 0 
	XORWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up173
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+0, 0 
	XORWF       _PressedObject+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up173:
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up63
;SmartGLCD_240x128_Demo_driver.c,1921 :: 		if (local_caption_button->OnClickPtr != 0)
	MOVLW       25
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up174
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up174
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up174
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up174:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up64
;SmartGLCD_240x128_Demo_driver.c,1922 :: 		local_caption_button->OnClickPtr();
	MOVLW       25
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up64:
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up63:
;SmartGLCD_240x128_Demo_driver.c,1924 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,1925 :: 		return;
	GOTO        L_end_Process_TP_Up
;SmartGLCD_240x128_Demo_driver.c,1927 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up61:
;SmartGLCD_240x128_Demo_driver.c,1913 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1928 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up58
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up59:
;SmartGLCD_240x128_Demo_driver.c,1931 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up65:
	MOVLW       12
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up175
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up175:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up66
;SmartGLCD_240x128_Demo_driver.c,1932 :: 		local_caption_round_button = GetRoundCaptionButton(i);
	MOVLW       14
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1933 :: 		if (IsInsideObject(X, Y, local_caption_round_button->Left, local_caption_round_button->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1934 :: 		local_caption_round_button->Width, local_caption_round_button->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up68
;SmartGLCD_240x128_Demo_driver.c,1935 :: 		if (local_caption_round_button->OnUpPtr != 0)
	MOVLW       18
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up176
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up176
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up176
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up176:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up69
;SmartGLCD_240x128_Demo_driver.c,1936 :: 		local_caption_round_button->OnUpPtr();
	MOVLW       18
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up69:
;SmartGLCD_240x128_Demo_driver.c,1938 :: 		if (PressedObject == (void *)local_caption_round_button)
	MOVF        _PressedObject+1, 0 
	XORWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up177
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+0, 0 
	XORWF       _PressedObject+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up177:
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up70
;SmartGLCD_240x128_Demo_driver.c,1939 :: 		if (local_caption_round_button->OnClickPtr != 0)
	MOVLW       26
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up178
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up178
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up178
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up178:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up71
;SmartGLCD_240x128_Demo_driver.c,1940 :: 		local_caption_round_button->OnClickPtr();
	MOVLW       26
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up71:
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up70:
;SmartGLCD_240x128_Demo_driver.c,1942 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,1943 :: 		return;
	GOTO        L_end_Process_TP_Up
;SmartGLCD_240x128_Demo_driver.c,1945 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up68:
;SmartGLCD_240x128_Demo_driver.c,1931 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1946 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up65
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up66:
;SmartGLCD_240x128_Demo_driver.c,1949 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up72:
	MOVFF       _CurrentScreen+0, FSR0
	MOVFF       _CurrentScreen+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up179
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up179:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up73
;SmartGLCD_240x128_Demo_driver.c,1950 :: 		local_label = GetLabel(i);
	MOVLW       2
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1951 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1952 :: 		local_label->Width, local_label->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up75
;SmartGLCD_240x128_Demo_driver.c,1953 :: 		if (local_label->OnUpPtr != 0)
	MOVLW       16
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up180
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up180
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up180
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up180:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up76
;SmartGLCD_240x128_Demo_driver.c,1954 :: 		local_label->OnUpPtr();
	MOVLW       16
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up76:
;SmartGLCD_240x128_Demo_driver.c,1956 :: 		if (PressedObject == (void *)local_label)
	MOVF        _PressedObject+1, 0 
	XORWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up181
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+0, 0 
	XORWF       _PressedObject+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up181:
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up77
;SmartGLCD_240x128_Demo_driver.c,1957 :: 		if (local_label->OnClickPtr != 0)
	MOVLW       24
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up182
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up182
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up182
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up182:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up78
;SmartGLCD_240x128_Demo_driver.c,1958 :: 		local_label->OnClickPtr();
	MOVLW       24
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up78:
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up77:
;SmartGLCD_240x128_Demo_driver.c,1960 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,1961 :: 		return;
	GOTO        L_end_Process_TP_Up
;SmartGLCD_240x128_Demo_driver.c,1963 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up75:
;SmartGLCD_240x128_Demo_driver.c,1949 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1964 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up72
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up73:
;SmartGLCD_240x128_Demo_driver.c,1967 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up79:
	MOVLW       4
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up183
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up183:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up80
;SmartGLCD_240x128_Demo_driver.c,1968 :: 		local_image = GetImage(i);
	MOVLW       6
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1969 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1970 :: 		local_image->Width, local_image->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up82
;SmartGLCD_240x128_Demo_driver.c,1971 :: 		if (local_image->OnUpPtr != 0)
	MOVLW       13
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up184
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up184
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up184
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up184:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up83
;SmartGLCD_240x128_Demo_driver.c,1972 :: 		local_image->OnUpPtr();
	MOVLW       13
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up83:
;SmartGLCD_240x128_Demo_driver.c,1974 :: 		if (PressedObject == (void *)local_image)
	MOVF        _PressedObject+1, 0 
	XORWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up185
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+0, 0 
	XORWF       _PressedObject+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up185:
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up84
;SmartGLCD_240x128_Demo_driver.c,1975 :: 		if (local_image->OnClickPtr != 0)
	MOVLW       21
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up186
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up186
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up186
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up186:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up85
;SmartGLCD_240x128_Demo_driver.c,1976 :: 		local_image->OnClickPtr();
	MOVLW       21
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up85:
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up84:
;SmartGLCD_240x128_Demo_driver.c,1978 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,1979 :: 		return;
	GOTO        L_end_Process_TP_Up
;SmartGLCD_240x128_Demo_driver.c,1981 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up82:
;SmartGLCD_240x128_Demo_driver.c,1967 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,1982 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up79
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up80:
;SmartGLCD_240x128_Demo_driver.c,1985 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up86:
	MOVLW       16
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up187
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up187:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up87
;SmartGLCD_240x128_Demo_driver.c,1986 :: 		local_rectangle = GetRectangle(i);
	MOVLW       18
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+1 
;SmartGLCD_240x128_Demo_driver.c,1987 :: 		if (IsInsideObject(X, Y, local_rectangle->Left, local_rectangle->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,1988 :: 		local_rectangle->Width, local_rectangle->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up89
;SmartGLCD_240x128_Demo_driver.c,1989 :: 		if (local_rectangle->OnUpPtr != 0)
	MOVLW       7
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up188
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up188
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up188
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up188:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up90
;SmartGLCD_240x128_Demo_driver.c,1990 :: 		local_rectangle->OnUpPtr();
	MOVLW       7
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up90:
;SmartGLCD_240x128_Demo_driver.c,1992 :: 		if (PressedObject == (void *)local_rectangle)
	MOVF        _PressedObject+1, 0 
	XORWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up189
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+0, 0 
	XORWF       _PressedObject+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up189:
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up91
;SmartGLCD_240x128_Demo_driver.c,1993 :: 		if (local_rectangle->OnClickPtr != 0)
	MOVLW       15
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up190
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up190
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up190
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up190:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up92
;SmartGLCD_240x128_Demo_driver.c,1994 :: 		local_rectangle->OnClickPtr();
	MOVLW       15
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Up_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up92:
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up91:
;SmartGLCD_240x128_Demo_driver.c,1996 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,1997 :: 		return;
	GOTO        L_end_Process_TP_Up
;SmartGLCD_240x128_Demo_driver.c,1999 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up89:
;SmartGLCD_240x128_Demo_driver.c,1985 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Up_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,2000 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Up86
L_SmartGLCD_240x128_Demo_driver_Process_TP_Up87:
;SmartGLCD_240x128_Demo_driver.c,2002 :: 		PressedObject = 0;
	CLRF        _PressedObject+0 
	CLRF        _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,2003 :: 		}
L_end_Process_TP_Up:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_Process_TP_Up

SmartGLCD_240x128_Demo_driver_Process_TP_Down:

;SmartGLCD_240x128_Demo_driver.c,2005 :: 		static void Process_TP_Down(unsigned int X, unsigned int Y) {
;SmartGLCD_240x128_Demo_driver.c,2014 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down93:
	MOVLW       8
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down192
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down192:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down94
;SmartGLCD_240x128_Demo_driver.c,2015 :: 		local_caption_button = GetCaptionButton(i);
	MOVLW       10
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,2016 :: 		if (IsInsideObject(X, Y, local_caption_button->Left, local_caption_button->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,2017 :: 		local_caption_button->Width, local_caption_button->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down96
;SmartGLCD_240x128_Demo_driver.c,2018 :: 		PressedObject = (void *)local_caption_button;
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+1, 0 
	MOVWF       _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,2019 :: 		if (local_caption_button->OnDownPtr != 0) {
	MOVLW       21
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down193
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down193
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down193
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down193:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down97
;SmartGLCD_240x128_Demo_driver.c,2020 :: 		local_caption_button->OnDownPtr();
	MOVLW       21
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,2021 :: 		return;
	GOTO        L_end_Process_TP_Down
;SmartGLCD_240x128_Demo_driver.c,2022 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down97:
;SmartGLCD_240x128_Demo_driver.c,2023 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down96:
;SmartGLCD_240x128_Demo_driver.c,2014 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtonsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,2024 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down93
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down94:
;SmartGLCD_240x128_Demo_driver.c,2027 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down98:
	MOVLW       12
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down194
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down194:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down99
;SmartGLCD_240x128_Demo_driver.c,2028 :: 		local_caption_round_button = GetRoundCaptionButton(i);
	MOVLW       14
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+1 
;SmartGLCD_240x128_Demo_driver.c,2029 :: 		if (IsInsideObject(X, Y, local_caption_round_button->Left, local_caption_round_button->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,2030 :: 		local_caption_round_button->Width, local_caption_round_button->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down101
;SmartGLCD_240x128_Demo_driver.c,2031 :: 		PressedObject = (void *)local_caption_round_button;
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+1, 0 
	MOVWF       _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,2032 :: 		if (local_caption_round_button->OnDownPtr != 0) {
	MOVLW       22
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down195
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down195
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down195
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down195:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down102
;SmartGLCD_240x128_Demo_driver.c,2033 :: 		local_caption_round_button->OnDownPtr();
	MOVLW       22
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_caption_round_button_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,2034 :: 		return;
	GOTO        L_end_Process_TP_Down
;SmartGLCD_240x128_Demo_driver.c,2035 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down102:
;SmartGLCD_240x128_Demo_driver.c,2036 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down101:
;SmartGLCD_240x128_Demo_driver.c,2027 :: 		for ( i = 0 ; i < CurrentScreen->CaptionButtons_RoundCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,2037 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down98
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down99:
;SmartGLCD_240x128_Demo_driver.c,2040 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down103:
	MOVFF       _CurrentScreen+0, FSR0
	MOVFF       _CurrentScreen+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down196
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down196:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down104
;SmartGLCD_240x128_Demo_driver.c,2041 :: 		local_label = GetLabel(i);
	MOVLW       2
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+1 
;SmartGLCD_240x128_Demo_driver.c,2042 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,2043 :: 		local_label->Width, local_label->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down106
;SmartGLCD_240x128_Demo_driver.c,2044 :: 		PressedObject = (void *)local_label;
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+1, 0 
	MOVWF       _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,2045 :: 		if (local_label->OnDownPtr != 0) {
	MOVLW       20
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down197
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down197
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down197
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down197:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down107
;SmartGLCD_240x128_Demo_driver.c,2046 :: 		local_label->OnDownPtr();
	MOVLW       20
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_label_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,2047 :: 		return;
	GOTO        L_end_Process_TP_Down
;SmartGLCD_240x128_Demo_driver.c,2048 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down107:
;SmartGLCD_240x128_Demo_driver.c,2049 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down106:
;SmartGLCD_240x128_Demo_driver.c,2040 :: 		for ( i = 0 ; i < CurrentScreen->LabelsCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,2050 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down103
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down104:
;SmartGLCD_240x128_Demo_driver.c,2053 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down108:
	MOVLW       4
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down198
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down198:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down109
;SmartGLCD_240x128_Demo_driver.c,2054 :: 		local_image = GetImage(i);
	MOVLW       6
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+1 
;SmartGLCD_240x128_Demo_driver.c,2055 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,2056 :: 		local_image->Width, local_image->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down111
;SmartGLCD_240x128_Demo_driver.c,2057 :: 		PressedObject = (void *)local_image;
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+1, 0 
	MOVWF       _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,2058 :: 		if (local_image->OnDownPtr != 0) {
	MOVLW       17
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down199
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down199
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down199
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down199:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down112
;SmartGLCD_240x128_Demo_driver.c,2059 :: 		local_image->OnDownPtr();
	MOVLW       17
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_image_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,2060 :: 		return;
	GOTO        L_end_Process_TP_Down
;SmartGLCD_240x128_Demo_driver.c,2061 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down112:
;SmartGLCD_240x128_Demo_driver.c,2062 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down111:
;SmartGLCD_240x128_Demo_driver.c,2053 :: 		for ( i = 0 ; i < CurrentScreen->ImagesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,2063 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down108
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down109:
;SmartGLCD_240x128_Demo_driver.c,2066 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0 
	CLRF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down113:
	MOVLW       16
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVF        POSTINC2+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down200
	MOVF        R1, 0 
	SUBWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down200:
	BTFSC       STATUS+0, 0 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down114
;SmartGLCD_240x128_Demo_driver.c,2067 :: 		local_rectangle = GetRectangle(i);
	MOVLW       18
	ADDWF       _CurrentScreen+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _CurrentScreen+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 0 
	MOVWF       R0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVF        R0, 0 
	ADDWF       R3, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      R4, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+0 
	MOVF        R1, 0 
	MOVWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+1 
;SmartGLCD_240x128_Demo_driver.c,2068 :: 		if (IsInsideObject(X, Y, local_rectangle->Left, local_rectangle->Top,
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_X+1 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+0 
	MOVF        FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Y+1 
	MOVLW       2
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Left+0 
	MOVLW       3
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Top+0 
;SmartGLCD_240x128_Demo_driver.c,2069 :: 		local_rectangle->Width, local_rectangle->Height) == 1) {
	MOVLW       4
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Width+0 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_IsInsideObject_Height+0 
	CALL        SmartGLCD_240x128_Demo_driver_IsInsideObject+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down116
;SmartGLCD_240x128_Demo_driver.c,2070 :: 		PressedObject = (void *)local_rectangle;
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+0, 0 
	MOVWF       _PressedObject+0 
	MOVF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+1, 0 
	MOVWF       _PressedObject+1 
;SmartGLCD_240x128_Demo_driver.c,2071 :: 		if (local_rectangle->OnDownPtr != 0) {
	MOVLW       11
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	MOVLW       0
	MOVWF       R0 
	XORWF       R4, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down201
	MOVF        R0, 0 
	XORWF       R3, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down201
	MOVF        R0, 0 
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down201
	MOVF        R1, 0 
	XORLW       0
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down201:
	BTFSC       STATUS+0, 2 
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down117
;SmartGLCD_240x128_Demo_driver.c,2072 :: 		local_rectangle->OnDownPtr();
	MOVLW       11
	ADDWF       SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      SmartGLCD_240x128_Demo_driver_Process_TP_Down_local_rectangle_L0+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	CALL        _____DoIFC+0, 0
;SmartGLCD_240x128_Demo_driver.c,2073 :: 		return;
	GOTO        L_end_Process_TP_Down
;SmartGLCD_240x128_Demo_driver.c,2074 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down117:
;SmartGLCD_240x128_Demo_driver.c,2075 :: 		}
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down116:
;SmartGLCD_240x128_Demo_driver.c,2066 :: 		for ( i = 0 ; i < CurrentScreen->RectanglesCount ; i++ ) {
	INFSNZ      SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+0, 1 
	INCF        SmartGLCD_240x128_Demo_driver_Process_TP_Down_i_L0+1, 1 
;SmartGLCD_240x128_Demo_driver.c,2076 :: 		}
	GOTO        L_SmartGLCD_240x128_Demo_driver_Process_TP_Down113
L_SmartGLCD_240x128_Demo_driver_Process_TP_Down114:
;SmartGLCD_240x128_Demo_driver.c,2078 :: 		}
L_end_Process_TP_Down:
	RETURN      0
; end of SmartGLCD_240x128_Demo_driver_Process_TP_Down

_Check_TP:

;SmartGLCD_240x128_Demo_driver.c,2080 :: 		void Check_TP() {
;SmartGLCD_240x128_Demo_driver.c,2081 :: 		if (TP_Press_Detect()) {
	CALL        _TP_Press_Detect+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Check_TP118
;SmartGLCD_240x128_Demo_driver.c,2083 :: 		if (TP_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
	MOVLW       _Xcoord+0
	MOVWF       FARG_TP_Get_Coordinates_x_coordinate+0 
	MOVLW       hi_addr(_Xcoord+0)
	MOVWF       FARG_TP_Get_Coordinates_x_coordinate+1 
	MOVLW       _Ycoord+0
	MOVWF       FARG_TP_Get_Coordinates_y_coordinate+0 
	MOVLW       hi_addr(_Ycoord+0)
	MOVWF       FARG_TP_Get_Coordinates_y_coordinate+1 
	CALL        _TP_Get_Coordinates+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Check_TP119
;SmartGLCD_240x128_Demo_driver.c,2084 :: 		Process_TP_Press(Xcoord, Ycoord);
	MOVF        _Xcoord+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+0 
	MOVF        _Xcoord+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_X+1 
	MOVF        _Ycoord+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+0 
	MOVF        _Ycoord+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Press_Y+1 
	CALL        SmartGLCD_240x128_Demo_driver_Process_TP_Press+0, 0
;SmartGLCD_240x128_Demo_driver.c,2085 :: 		if (PenDown == 0) {
	MOVF        _PenDown+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Check_TP120
;SmartGLCD_240x128_Demo_driver.c,2086 :: 		PenDown = 1;
	MOVLW       1
	MOVWF       _PenDown+0 
;SmartGLCD_240x128_Demo_driver.c,2087 :: 		Process_TP_Down(Xcoord, Ycoord);
	MOVF        _Xcoord+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+0 
	MOVF        _Xcoord+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_X+1 
	MOVF        _Ycoord+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+0 
	MOVF        _Ycoord+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Down_Y+1 
	CALL        SmartGLCD_240x128_Demo_driver_Process_TP_Down+0, 0
;SmartGLCD_240x128_Demo_driver.c,2088 :: 		}
L_Check_TP120:
;SmartGLCD_240x128_Demo_driver.c,2089 :: 		}
L_Check_TP119:
;SmartGLCD_240x128_Demo_driver.c,2090 :: 		}
	GOTO        L_Check_TP121
L_Check_TP118:
;SmartGLCD_240x128_Demo_driver.c,2091 :: 		else if (PenDown == 1) {
	MOVF        _PenDown+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_Check_TP122
;SmartGLCD_240x128_Demo_driver.c,2092 :: 		PenDown = 0;
	CLRF        _PenDown+0 
;SmartGLCD_240x128_Demo_driver.c,2093 :: 		Process_TP_Up(Xcoord, Ycoord);
	MOVF        _Xcoord+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+0 
	MOVF        _Xcoord+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_X+1 
	MOVF        _Ycoord+0, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+0 
	MOVF        _Ycoord+1, 0 
	MOVWF       FARG_SmartGLCD_240x128_Demo_driver_Process_TP_Up_Y+1 
	CALL        SmartGLCD_240x128_Demo_driver_Process_TP_Up+0, 0
;SmartGLCD_240x128_Demo_driver.c,2094 :: 		}
L_Check_TP122:
L_Check_TP121:
;SmartGLCD_240x128_Demo_driver.c,2095 :: 		}
L_end_Check_TP:
	RETURN      0
; end of _Check_TP

_Start_TP:

;SmartGLCD_240x128_Demo_driver.c,2097 :: 		void Start_TP() {
;SmartGLCD_240x128_Demo_driver.c,2098 :: 		InitializeTouchPanel();
	CALL        SmartGLCD_240x128_Demo_driver_InitializeTouchPanel+0, 0
;SmartGLCD_240x128_Demo_driver.c,2100 :: 		T6963C_write_text("CALIBRATION",40,7,T6963C_ROM_MODE_XOR);
	MOVLW       ?lstr4_SmartGLCD_240x128_Demo_driver+0
	MOVWF       FARG_T6963C_write_text_str+0 
	MOVLW       hi_addr(?lstr4_SmartGLCD_240x128_Demo_driver+0)
	MOVWF       FARG_T6963C_write_text_str+1 
	MOVLW       40
	MOVWF       FARG_T6963C_write_text_x+0 
	MOVLW       7
	MOVWF       FARG_T6963C_write_text_y+0 
	MOVLW       129
	MOVWF       FARG_T6963C_write_text_mode+0 
	CALL        _T6963C_write_text+0, 0
;SmartGLCD_240x128_Demo_driver.c,2101 :: 		Delay_ms(1000);
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_Start_TP123:
	DECFSZ      R13, 1, 1
	BRA         L_Start_TP123
	DECFSZ      R12, 1, 1
	BRA         L_Start_TP123
	DECFSZ      R11, 1, 1
	BRA         L_Start_TP123
	NOP
	NOP
;SmartGLCD_240x128_Demo_driver.c,2102 :: 		T6963C_grFill(0);                                        // Clear display
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD_240x128_Demo_driver.c,2103 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD_240x128_Demo_driver.c,2104 :: 		Calibrate();
	CALL        _Calibrate+0, 0
;SmartGLCD_240x128_Demo_driver.c,2106 :: 		T6963C_grFill(0);                                        // Clear display
	CLRF        FARG_T6963C_fill_v+0 
	CLRF        FARG_T6963C_fill_start+0 
	CLRF        FARG_T6963C_fill_start+1 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD_240x128_Demo_driver.c,2107 :: 		T6963C_txtFill(0);
	CLRF        FARG_T6963C_fill_v+0 
	MOVF        _T6963C_grMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_start+0 
	MOVF        _T6963C_grMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_start+1 
	MOVF        _T6963C_txtMemSize+0, 0 
	MOVWF       FARG_T6963C_fill_len+0 
	MOVF        _T6963C_txtMemSize+1, 0 
	MOVWF       FARG_T6963C_fill_len+1 
	CALL        _T6963C_fill+0, 0
;SmartGLCD_240x128_Demo_driver.c,2108 :: 		InitializeObjects();
	CALL        SmartGLCD_240x128_Demo_driver_InitializeObjects+0, 0
;SmartGLCD_240x128_Demo_driver.c,2109 :: 		DrawScreen(&Screen1);
	MOVLW       _Screen1+0
	MOVWF       FARG_DrawScreen_aScreen+0 
	MOVLW       hi_addr(_Screen1+0)
	MOVWF       FARG_DrawScreen_aScreen+1 
	CALL        _DrawScreen+0, 0
;SmartGLCD_240x128_Demo_driver.c,2110 :: 		}
L_end_Start_TP:
	RETURN      0
; end of _Start_TP
