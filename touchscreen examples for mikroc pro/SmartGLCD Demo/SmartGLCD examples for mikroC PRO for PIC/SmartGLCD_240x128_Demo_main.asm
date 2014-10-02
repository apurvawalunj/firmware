
_main:

;SmartGLCD_240x128_Demo_main.c,34 :: 		void main() {
;SmartGLCD_240x128_Demo_main.c,36 :: 		Start_TP();
	CALL        _Start_TP+0, 0
;SmartGLCD_240x128_Demo_main.c,38 :: 		while (1) {
L_main0:
;SmartGLCD_240x128_Demo_main.c,39 :: 		Check_TP();
	CALL        _Check_TP+0, 0
;SmartGLCD_240x128_Demo_main.c,41 :: 		}
	GOTO        L_main0
;SmartGLCD_240x128_Demo_main.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
