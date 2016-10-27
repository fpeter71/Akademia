
_CpySubStr:

;Microfluid.c,81 ::                 void CpySubStr(char* dest, char *src, int ind, char until){
;Microfluid.c,82 ::                 int i, j = 0;
        CLRF       CpySubStr_j_L0+0
        CLRF       CpySubStr_j_L0+1
;Microfluid.c,84 ::                 for(i = ind; src[i] != until; i++)
        MOVF       FARG_CpySubStr_ind+0, 0
        MOVWF      R1+0
        MOVF       FARG_CpySubStr_ind+1, 0
        MOVWF      R1+1
L_CpySubStr0:
        MOVF       R1+0, 0
        ADDWF      FARG_CpySubStr_src+0, 0
        MOVWF      FSR0L
        MOVF       R1+1, 0
        ADDWFC     FARG_CpySubStr_src+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORWF      FARG_CpySubStr_until+0, 0
        BTFSC      STATUS+0, 2
        GOTO       L_CpySubStr1
;Microfluid.c,85 ::                 dest[j++] = src[i];
        MOVF       CpySubStr_j_L0+0, 0
        ADDWF      FARG_CpySubStr_dest+0, 0
        MOVWF      FSR1L
        MOVF       CpySubStr_j_L0+1, 0
        ADDWFC     FARG_CpySubStr_dest+1, 0
        MOVWF      FSR1H
        MOVF       R1+0, 0
        ADDWF      FARG_CpySubStr_src+0, 0
        MOVWF      FSR0L
        MOVF       R1+1, 0
        ADDWFC     FARG_CpySubStr_src+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        MOVWF      INDF1+0
        INCF       CpySubStr_j_L0+0, 1
        BTFSC      STATUS+0, 2
        INCF       CpySubStr_j_L0+1, 1
;Microfluid.c,84 ::                 for(i = ind; src[i] != until; i++)
        INCF       R1+0, 1
        BTFSC      STATUS+0, 2
        INCF       R1+1, 1
;Microfluid.c,85 ::                 dest[j++] = src[i];
        GOTO       L_CpySubStr0
L_CpySubStr1:
;Microfluid.c,87 ::                 dest[j] = '\0';
        MOVF       CpySubStr_j_L0+0, 0
        ADDWF      FARG_CpySubStr_dest+0, 0
        MOVWF      FSR1L
        MOVF       CpySubStr_j_L0+1, 0
        ADDWFC     FARG_CpySubStr_dest+1, 0
        MOVWF      FSR1H
        CLRF       INDF1+0
;Microfluid.c,88 ::                 }
L_end_CpySubStr:
        RETURN
; end of _CpySubStr

_HardInit:

;Microfluid.c,91 ::                 void HardInit(void){
;Microfluid.c,92 ::                 ANSELA = 0;
        CLRF       ANSELA+0
;Microfluid.c,93 ::                 ANSELB = 0;
        CLRF       ANSELB+0
;Microfluid.c,94 ::                 ANSELD = 0;
        CLRF       ANSELD+0
;Microfluid.c,95 ::                 ANSELE = 0;
        CLRF       ANSELE+0
;Microfluid.c,96 ::                 camLED_d = 0;
        BCF        TRISC1_bit+0, BitPos(TRISC1_bit+0)
;Microfluid.c,97 ::                 backLite_d = 0;
        BCF        TRISE0_bit+0, BitPos(TRISE0_bit+0)
;Microfluid.c,98 ::                 backLite = 0;
        BCF        RE0_bit+0, BitPos(RE0_bit+0)
;Microfluid.c,99 ::                 OSCCON = 0b01110000;
        MOVLW      112
        MOVWF      OSCCON+0
;Microfluid.c,100 ::                 camLED = 0;
        BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Microfluid.c,102 ::                 btnA_d = 1;
        BSF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;Microfluid.c,103 ::                 btnB_d = 1;
        BSF        TRISD1_bit+0, BitPos(TRISD1_bit+0)
;Microfluid.c,104 ::                 btnC_d = 1;
        BSF        TRISD2_bit+0, BitPos(TRISD2_bit+0)
;Microfluid.c,105 ::                 btnD_d = 1;
        BSF        TRISD3_bit+0, BitPos(TRISD3_bit+0)
;Microfluid.c,107 ::                 MX_S_d = 0;
        BCF        TRISB0_bit+0, BitPos(TRISB0_bit+0)
;Microfluid.c,108 ::                 MX_D_d = 0;                          //X Motor direction set as output
        BCF        TRISB1_bit+0, BitPos(TRISB1_bit+0)
;Microfluid.c,109 ::                 MX_E_d = 0;
        BCF        TRISB2_bit+0, BitPos(TRISB2_bit+0)
;Microfluid.c,110 ::                 MX_O_d = 1;
        BSF        TRISD4_bit+0, BitPos(TRISD4_bit+0)
;Microfluid.c,112 ::                 MX_S = 0;
        BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Microfluid.c,113 ::                 MX_D = 0;
        BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Microfluid.c,114 ::                 MX_E = 0;                            // Set Motor value 0
        BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Microfluid.c,116 ::                 chip_d = 1;                         // Set chip sensor as input
        BSF        TRISD5_bit+0, BitPos(TRISD5_bit+0)
;Microfluid.c,118 ::                 H1_d = 0;                           // Heat-FET
        BCF        TRISB5_bit+0, BitPos(TRISB5_bit+0)
;Microfluid.c,120 ::                 H1 = 0;                             //  Heat off
        BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Microfluid.c,122 ::                 batteryLow_d = 1;
        BSF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;Microfluid.c,123 ::                 batteryCharge_d = 1;
        BSF        TRISA4_bit+0, BitPos(TRISA4_bit+0)
;Microfluid.c,125 ::                 position = 0;
        CLRF       _position+0
        CLRF       _position+1
;Microfluid.c,126 ::                 cmdCtr = 0;
        CLRF       _cmdCtr+0
        CLRF       _cmdCtr+1
;Microfluid.c,127 ::                 buttonsState = 0;
        CLRF       _buttonsState+0
;Microfluid.c,128 ::                 buttonsOldState = 0;
        CLRF       _buttonsOldState+0
;Microfluid.c,129 ::                 cmdStarted = 0;
        CLRF       _cmdStarted+0
;Microfluid.c,131 ::                 doTempControl = 0;
        CLRF       _doTempControl+0
;Microfluid.c,132 ::                 }
L_end_HardInit:
        RETURN
; end of _HardInit

_GetButtonState:

;Microfluid.c,135 ::                 void GetButtonState(void){
;Microfluid.c,136 ::                 if(!btnA && !btnB && !btnC && !btnD){
        BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
        GOTO       L_GetButtonState5
        BTFSC      RD1_bit+0, BitPos(RD1_bit+0)
        GOTO       L_GetButtonState5
        BTFSC      RD2_bit+0, BitPos(RD2_bit+0)
        GOTO       L_GetButtonState5
        BTFSC      RD3_bit+0, BitPos(RD3_bit+0)
        GOTO       L_GetButtonState5
L__GetButtonState96:
;Microfluid.c,137 ::                 buttonsState = 0;
        CLRF       _buttonsState+0
;Microfluid.c,138 ::                 }
L_GetButtonState5:
;Microfluid.c,139 ::                 if(btnA){
        BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
        GOTO       L_GetButtonState6
;Microfluid.c,140 ::                 buttonsState |= BTN_A_MASK;
        BSF        _buttonsState+0, 0
;Microfluid.c,141 ::                 }
L_GetButtonState6:
;Microfluid.c,143 ::                 if(btnB){
        BTFSS      RD1_bit+0, BitPos(RD1_bit+0)
        GOTO       L_GetButtonState7
;Microfluid.c,144 ::                 buttonsState |= BTN_B_MASK;
        BSF        _buttonsState+0, 1
;Microfluid.c,145 ::                 }
L_GetButtonState7:
;Microfluid.c,147 ::                 if(btnC){
        BTFSS      RD2_bit+0, BitPos(RD2_bit+0)
        GOTO       L_GetButtonState8
;Microfluid.c,148 ::                 buttonsState |= BTN_C_MASK;
        BSF        _buttonsState+0, 2
;Microfluid.c,149 ::                 }
L_GetButtonState8:
;Microfluid.c,151 ::                 if(btnD){
        BTFSS      RD3_bit+0, BitPos(RD3_bit+0)
        GOTO       L_GetButtonState9
;Microfluid.c,152 ::                 buttonsState |= BTN_D_MASK;
        BSF        _buttonsState+0, 3
;Microfluid.c,153 ::                 }
L_GetButtonState9:
;Microfluid.c,176 ::                 }
L_end_GetButtonState:
        RETURN
; end of _GetButtonState

_ConvertAndSendTemp:

;Microfluid.c,179 ::                 void ConvertAndSendTemp(unsigned int temp2write) {
;Microfluid.c,185 ::                 if (temp2write & 0x8000) {
        BTFSS      FARG_ConvertAndSendTemp_temp2write+1, 7
        GOTO       L_ConvertAndSendTemp10
;Microfluid.c,186 ::                 text[0] = '-';
        MOVF       _text+0, 0
        MOVWF      FSR1L
        MOVF       _text+1, 0
        MOVWF      FSR1H
        MOVLW      45
        MOVWF      INDF1+0
;Microfluid.c,187 ::                 temp2write = ~temp2write + 1;
        COMF       FARG_ConvertAndSendTemp_temp2write+0, 1
        COMF       FARG_ConvertAndSendTemp_temp2write+1, 1
        INCF       FARG_ConvertAndSendTemp_temp2write+0, 1
        BTFSC      STATUS+0, 2
        INCF       FARG_ConvertAndSendTemp_temp2write+1, 1
;Microfluid.c,188 ::                 }
L_ConvertAndSendTemp10:
;Microfluid.c,191 ::                 tempWhole = temp2write >> RES_SHIFT ;
        MOVF       FARG_ConvertAndSendTemp_temp2write+0, 0
        MOVWF      R0
        MOVF       FARG_ConvertAndSendTemp_temp2write+1, 0
        MOVWF      R1
        LSRF       R1, 1
        RRF        R0, 1
        MOVF       R0, 0
        MOVWF      ConvertAndSendTemp_tempWhole_L0+0
;Microfluid.c,194 ::                 if (tempWhole/100)
        MOVLW      100
        MOVWF      R4
        CALL       _Div_8x8_U+0
        MOVF       R0, 0
        BTFSC      STATUS+0, 2
        GOTO       L_ConvertAndSendTemp11
;Microfluid.c,195 ::                 text[0] = tempWhole/100  + 48;
        MOVLW      100
        MOVWF      R4
        MOVF       ConvertAndSendTemp_tempWhole_L0+0, 0
        MOVWF      R0
        CALL       _Div_8x8_U+0
        MOVF       _text+0, 0
        MOVWF      FSR1L
        MOVF       _text+1, 0
        MOVWF      FSR1H
        MOVLW      48
        ADDWF      R0, 0
        MOVWF      INDF1+0
        GOTO       L_ConvertAndSendTemp12
L_ConvertAndSendTemp11:
;Microfluid.c,197 ::                 text[0] = '0';
        MOVF       _text+0, 0
        MOVWF      FSR1L
        MOVF       _text+1, 0
        MOVWF      FSR1H
        MOVLW      48
        MOVWF      INDF1+0
L_ConvertAndSendTemp12:
;Microfluid.c,199 ::                 text[1] = (tempWhole/10)%10 + 48;             // Extract tens digit
        MOVLW      1
        ADDWF      _text+0, 0
        MOVWF      FLOC__ConvertAndSendTemp+0
        MOVLW      0
        ADDWFC     _text+1, 0
        MOVWF      FLOC__ConvertAndSendTemp+1
        MOVLW      10
        MOVWF      R4
        MOVF       ConvertAndSendTemp_tempWhole_L0+0, 0
        MOVWF      R0
        CALL       _Div_8x8_U+0
        MOVLW      10
        MOVWF      R4
        CALL       _Div_8x8_U+0
        MOVF       R8, 0
        MOVWF      R0
        MOVLW      48
        ADDWF      R0, 1
        MOVF       FLOC__ConvertAndSendTemp+0, 0
        MOVWF      FSR1L
        MOVF       FLOC__ConvertAndSendTemp+1, 0
        MOVWF      FSR1H
        MOVF       R0, 0
        MOVWF      INDF1+0
;Microfluid.c,200 ::                 text[2] =  tempWhole%10     + 48;             // Extract ones digit
        MOVLW      2
        ADDWF      _text+0, 0
        MOVWF      FLOC__ConvertAndSendTemp+0
        MOVLW      0
        ADDWFC     _text+1, 0
        MOVWF      FLOC__ConvertAndSendTemp+1
        MOVLW      10
        MOVWF      R4
        MOVF       ConvertAndSendTemp_tempWhole_L0+0, 0
        MOVWF      R0
        CALL       _Div_8x8_U+0
        MOVF       R8, 0
        MOVWF      R0
        MOVLW      48
        ADDWF      R0, 1
        MOVF       FLOC__ConvertAndSendTemp+0, 0
        MOVWF      FSR1L
        MOVF       FLOC__ConvertAndSendTemp+1, 0
        MOVWF      FSR1H
        MOVF       R0, 0
        MOVWF      INDF1+0
;Microfluid.c,203 ::                 tempFraction  = temp2write << (4-RES_SHIFT);
        MOVF       FARG_ConvertAndSendTemp_temp2write+0, 0
        MOVWF      R0
        MOVF       FARG_ConvertAndSendTemp_temp2write+1, 0
        MOVWF      R1
        LSLF       R0, 1
        RLF        R1, 1
        LSLF       R0, 1
        RLF        R1, 1
        LSLF       R0, 1
        RLF        R1, 1
        MOVF       R0, 0
        MOVWF      ConvertAndSendTemp_tempFraction_L0+0
        MOVF       R1, 0
        MOVWF      ConvertAndSendTemp_tempFraction_L0+1
;Microfluid.c,204 ::                 tempFraction &= 0x000F;
        MOVLW      15
        ANDWF      R0, 1
        MOVLW      0
        ANDWF      R1, 1
        MOVF       R0, 0
        MOVWF      ConvertAndSendTemp_tempFraction_L0+0
        MOVF       R1, 0
        MOVWF      ConvertAndSendTemp_tempFraction_L0+1
;Microfluid.c,205 ::                 tempFraction *= 625;
        MOVLW      113
        MOVWF      R4
        MOVLW      2
        MOVWF      R5
        CALL       _Mul_16x16_U+0
        MOVF       R0, 0
        MOVWF      ConvertAndSendTemp_tempFraction_L0+0
        MOVF       R1, 0
        MOVWF      ConvertAndSendTemp_tempFraction_L0+1
;Microfluid.c,208 ::                 text[4] =  tempFraction/1000    + 48;         // Extract thousands digit
        MOVLW      4
        ADDWF      _text+0, 0
        MOVWF      FLOC__ConvertAndSendTemp+0
        MOVLW      0
        ADDWFC     _text+1, 0
        MOVWF      FLOC__ConvertAndSendTemp+1
        MOVLW      232
        MOVWF      R4
        MOVLW      3
        MOVWF      R5
        CALL       _Div_16x16_U+0
        MOVLW      48
        ADDWF      R0, 1
        MOVF       FLOC__ConvertAndSendTemp+0, 0
        MOVWF      FSR1L
        MOVF       FLOC__ConvertAndSendTemp+1, 0
        MOVWF      FSR1H
        MOVF       R0, 0
        MOVWF      INDF1+0
;Microfluid.c,209 ::                 text[5] = (tempFraction/100)%10 + 48;         // Extract hundreds digit
        MOVLW      5
        ADDWF      _text+0, 0
        MOVWF      FLOC__ConvertAndSendTemp+0
        MOVLW      0
        ADDWFC     _text+1, 0
        MOVWF      FLOC__ConvertAndSendTemp+1
        MOVLW      100
        MOVWF      R4
        MOVLW      0
        MOVWF      R5
        MOVF       ConvertAndSendTemp_tempFraction_L0+0, 0
        MOVWF      R0
        MOVF       ConvertAndSendTemp_tempFraction_L0+1, 0
        MOVWF      R1
        CALL       _Div_16x16_U+0
        MOVLW      10
        MOVWF      R4
        MOVLW      0
        MOVWF      R5
        CALL       _Div_16x16_U+0
        MOVF       R8, 0
        MOVWF      R0
        MOVF       R9, 0
        MOVWF      R1
        MOVLW      48
        ADDWF      R0, 1
        MOVF       FLOC__ConvertAndSendTemp+0, 0
        MOVWF      FSR1L
        MOVF       FLOC__ConvertAndSendTemp+1, 0
        MOVWF      FSR1H
        MOVF       R0, 0
        MOVWF      INDF1+0
;Microfluid.c,210 ::                 text[6] = (tempFraction/10)%10  + 48;         // Extract tens digit
        MOVLW      6
        ADDWF      _text+0, 0
        MOVWF      FLOC__ConvertAndSendTemp+0
        MOVLW      0
        ADDWFC     _text+1, 0
        MOVWF      FLOC__ConvertAndSendTemp+1
        MOVLW      10
        MOVWF      R4
        MOVLW      0
        MOVWF      R5
        MOVF       ConvertAndSendTemp_tempFraction_L0+0, 0
        MOVWF      R0
        MOVF       ConvertAndSendTemp_tempFraction_L0+1, 0
        MOVWF      R1
        CALL       _Div_16x16_U+0
        MOVLW      10
        MOVWF      R4
        MOVLW      0
        MOVWF      R5
        CALL       _Div_16x16_U+0
        MOVF       R8, 0
        MOVWF      R0
        MOVF       R9, 0
        MOVWF      R1
        MOVLW      48
        ADDWF      R0, 1
        MOVF       FLOC__ConvertAndSendTemp+0, 0
        MOVWF      FSR1L
        MOVF       FLOC__ConvertAndSendTemp+1, 0
        MOVWF      FSR1H
        MOVF       R0, 0
        MOVWF      INDF1+0
;Microfluid.c,211 ::                 text[7] =  tempFraction%10      + 48;         // Extract ones digit
        MOVLW      7
        ADDWF      _text+0, 0
        MOVWF      FLOC__ConvertAndSendTemp+0
        MOVLW      0
        ADDWFC     _text+1, 0
        MOVWF      FLOC__ConvertAndSendTemp+1
        MOVLW      10
        MOVWF      R4
        MOVLW      0
        MOVWF      R5
        MOVF       ConvertAndSendTemp_tempFraction_L0+0, 0
        MOVWF      R0
        MOVF       ConvertAndSendTemp_tempFraction_L0+1, 0
        MOVWF      R1
        CALL       _Div_16x16_U+0
        MOVF       R8, 0
        MOVWF      R0
        MOVF       R9, 0
        MOVWF      R1
        MOVLW      48
        ADDWF      R0, 1
        MOVF       FLOC__ConvertAndSendTemp+0, 0
        MOVWF      FSR1L
        MOVF       FLOC__ConvertAndSendTemp+1, 0
        MOVWF      FSR1H
        MOVF       R0, 0
        MOVWF      INDF1+0
;Microfluid.c,213 ::                 for(i = 0; i < 8; i++)
        CLRF       ConvertAndSendTemp_i_L0+0
        CLRF       ConvertAndSendTemp_i_L0+1
L_ConvertAndSendTemp13:
        MOVLW      128
        XORWF      ConvertAndSendTemp_i_L0+1, 0
        MOVWF      R0
        MOVLW      128
        SUBWF      R0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__ConvertAndSendTemp106
        MOVLW      8
        SUBWF      ConvertAndSendTemp_i_L0+0, 0
L__ConvertAndSendTemp106:
        BTFSC      STATUS+0, 0
        GOTO       L_ConvertAndSendTemp14
;Microfluid.c,214 ::                 UART1_Write(text[i]);
        MOVF       ConvertAndSendTemp_i_L0+0, 0
        ADDWF      _text+0, 0
        MOVWF      FSR0L
        MOVF       ConvertAndSendTemp_i_L0+1, 0
        ADDWFC     _text+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,213 ::                 for(i = 0; i < 8; i++)
        INCF       ConvertAndSendTemp_i_L0+0, 1
        BTFSC      STATUS+0, 2
        INCF       ConvertAndSendTemp_i_L0+1, 1
;Microfluid.c,214 ::                 UART1_Write(text[i]);
        GOTO       L_ConvertAndSendTemp13
L_ConvertAndSendTemp14:
;Microfluid.c,216 ::                 UART1_Write(10);
        MOVLW      10
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,217 ::                 UART1_Write(13);
        MOVLW      13
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,218 ::                 }
L_end_ConvertAndSendTemp:
        RETURN
; end of _ConvertAndSendTemp

_DoStep:

;Microfluid.c,221 ::                 void DoStep(int val, char stop, int delay, int uart){
;Microfluid.c,226 ::                 if(val > 0){
        MOVLW      128
        MOVWF      R0
        MOVLW      128
        XORWF      FARG_DoStep_val+1, 0
        SUBWF      R0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__DoStep108
        MOVF       FARG_DoStep_val+0, 0
        SUBLW      0
L__DoStep108:
        BTFSC      STATUS+0, 0
        GOTO       L_DoStep16
;Microfluid.c,227 ::                 negative = 0;
        CLRF       DoStep_negative_L0+0
;Microfluid.c,228 ::                 forEnd = val;
        MOVF       FARG_DoStep_val+0, 0
        MOVWF      DoStep_forEnd_L0+0
        MOVF       FARG_DoStep_val+1, 0
        MOVWF      DoStep_forEnd_L0+1
;Microfluid.c,229 ::                 } else {
        GOTO       L_DoStep17
L_DoStep16:
;Microfluid.c,230 ::                 negative = 1;
        MOVLW      1
        MOVWF      DoStep_negative_L0+0
;Microfluid.c,231 ::                 forEnd = val * -1;
        MOVF       FARG_DoStep_val+0, 0
        MOVWF      R0
        MOVF       FARG_DoStep_val+1, 0
        MOVWF      R1
        MOVLW      255
        MOVWF      R4
        MOVLW      255
        MOVWF      R5
        CALL       _Mul_16x16_U+0
        MOVF       R0, 0
        MOVWF      DoStep_forEnd_L0+0
        MOVF       R1, 0
        MOVWF      DoStep_forEnd_L0+1
;Microfluid.c,232 ::                 }
L_DoStep17:
;Microfluid.c,234 ::                 if(stop == 1){
        MOVF       FARG_DoStep_stop+0, 0
        XORLW      1
        BTFSS      STATUS+0, 2
        GOTO       L_DoStep18
;Microfluid.c,235 ::                 MX_S = 0;
        BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Microfluid.c,236 ::                 MX_D = 0;
        BCF        RB1_bit+0, BitPos(RB1_bit+0)
;Microfluid.c,237 ::                 MX_E = 0;
        BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Microfluid.c,239 ::                 return;
        GOTO       L_end_DoStep
;Microfluid.c,240 ::                 }
L_DoStep18:
;Microfluid.c,242 ::                 MX_E = 1;
        BSF        RB2_bit+0, BitPos(RB2_bit+0)
;Microfluid.c,243 ::                 MX_D = negative ? 0 : 1;
        MOVF       DoStep_negative_L0+0, 0
        BTFSC      STATUS+0, 2
        GOTO       L_DoStep19
        CLRF       ?FLOC___DoStepT74+0
        GOTO       L_DoStep20
L_DoStep19:
        MOVLW      1
        MOVWF      ?FLOC___DoStepT74+0
L_DoStep20:
        BTFSC      ?FLOC___DoStepT74+0, 0
        GOTO       L__DoStep109
        BCF        RB1_bit+0, BitPos(RB1_bit+0)
        GOTO       L__DoStep110
L__DoStep109:
        BSF        RB1_bit+0, BitPos(RB1_bit+0)
L__DoStep110:
;Microfluid.c,245 ::                 for(i = 0; i < forEnd; i++){
        CLRF       DoStep_i_L0+0
        CLRF       DoStep_i_L0+1
L_DoStep21:
        MOVLW      128
        XORWF      DoStep_i_L0+1, 0
        MOVWF      R0
        MOVLW      128
        XORWF      DoStep_forEnd_L0+1, 0
        SUBWF      R0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__DoStep111
        MOVF       DoStep_forEnd_L0+0, 0
        SUBWF      DoStep_i_L0+0, 0
L__DoStep111:
        BTFSC      STATUS+0, 0
        GOTO       L_DoStep22
;Microfluid.c,246 ::                 MX_S = 1;
        BSF        RB0_bit+0, BitPos(RB0_bit+0)
;Microfluid.c,248 ::                 if(delay != 0){
        MOVLW      0
        XORWF      FARG_DoStep_delay+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__DoStep112
        MOVLW      0
        XORWF      FARG_DoStep_delay+0, 0
L__DoStep112:
        BTFSC      STATUS+0, 2
        GOTO       L_DoStep24
;Microfluid.c,249 ::                 for(j = 0; j < delay; j++)
        CLRF       DoStep_j_L0+0
        CLRF       DoStep_j_L0+1
L_DoStep25:
        MOVLW      128
        XORWF      DoStep_j_L0+1, 0
        MOVWF      R0
        MOVLW      128
        XORWF      FARG_DoStep_delay+1, 0
        SUBWF      R0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__DoStep113
        MOVF       FARG_DoStep_delay+0, 0
        SUBWF      DoStep_j_L0+0, 0
L__DoStep113:
        BTFSC      STATUS+0, 0
        GOTO       L_DoStep26
;Microfluid.c,250 ::                 Delay_ms(1);
        MOVLW      3
        MOVWF      R12
        MOVLW      151
        MOVWF      R13
L_DoStep28:
        DECFSZ     R13, 1
        GOTO       L_DoStep28
        DECFSZ     R12, 1
        GOTO       L_DoStep28
        NOP
        NOP
;Microfluid.c,249 ::                 for(j = 0; j < delay; j++)
        INCF       DoStep_j_L0+0, 1
        BTFSC      STATUS+0, 2
        INCF       DoStep_j_L0+1, 1
;Microfluid.c,250 ::                 Delay_ms(1);
        GOTO       L_DoStep25
L_DoStep26:
;Microfluid.c,251 ::                 }
L_DoStep24:
;Microfluid.c,252 ::                 MX_S = 0;
        BCF        RB0_bit+0, BitPos(RB0_bit+0)
;Microfluid.c,254 ::                 if(delay != 0){
        MOVLW      0
        XORWF      FARG_DoStep_delay+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__DoStep114
        MOVLW      0
        XORWF      FARG_DoStep_delay+0, 0
L__DoStep114:
        BTFSC      STATUS+0, 2
        GOTO       L_DoStep29
;Microfluid.c,255 ::                 for(j = 0; j < delay; j++)
        CLRF       DoStep_j_L0+0
        CLRF       DoStep_j_L0+1
L_DoStep30:
        MOVLW      128
        XORWF      DoStep_j_L0+1, 0
        MOVWF      R0
        MOVLW      128
        XORWF      FARG_DoStep_delay+1, 0
        SUBWF      R0, 0
        BTFSS      STATUS+0, 2
        GOTO       L__DoStep115
        MOVF       FARG_DoStep_delay+0, 0
        SUBWF      DoStep_j_L0+0, 0
L__DoStep115:
        BTFSC      STATUS+0, 0
        GOTO       L_DoStep31
;Microfluid.c,256 ::                 Delay_ms(1);
        MOVLW      3
        MOVWF      R12
        MOVLW      151
        MOVWF      R13
L_DoStep33:
        DECFSZ     R13, 1
        GOTO       L_DoStep33
        DECFSZ     R12, 1
        GOTO       L_DoStep33
        NOP
        NOP
;Microfluid.c,255 ::                 for(j = 0; j < delay; j++)
        INCF       DoStep_j_L0+0, 1
        BTFSC      STATUS+0, 2
        INCF       DoStep_j_L0+1, 1
;Microfluid.c,256 ::                 Delay_ms(1);
        GOTO       L_DoStep30
L_DoStep31:
;Microfluid.c,257 ::                 }
L_DoStep29:
;Microfluid.c,245 ::                 for(i = 0; i < forEnd; i++){
        INCF       DoStep_i_L0+0, 1
        BTFSC      STATUS+0, 2
        INCF       DoStep_i_L0+1, 1
;Microfluid.c,258 ::                 }
        GOTO       L_DoStep21
L_DoStep22:
;Microfluid.c,260 ::                 Delay_ms(500);
        MOVLW      6
        MOVWF      R11
        MOVLW      19
        MOVWF      R12
        MOVLW      173
        MOVWF      R13
L_DoStep34:
        DECFSZ     R13, 1
        GOTO       L_DoStep34
        DECFSZ     R12, 1
        GOTO       L_DoStep34
        DECFSZ     R11, 1
        GOTO       L_DoStep34
        NOP
        NOP
;Microfluid.c,261 ::                 MX_E = 0;
        BCF        RB2_bit+0, BitPos(RB2_bit+0)
;Microfluid.c,262 ::                 }
L_end_DoStep:
        RETURN
; end of _DoStep

_GetTemp:

;Microfluid.c,265 ::                 unsigned int GetTemp(void){
;Microfluid.c,269 ::                 Ow_Reset(OW_PIN);                         // Onewire reset signal
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Reset_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Reset_port+1
        CLRF       FARG_Ow_Reset_pin+0
        CALL       _Ow_Reset+0
;Microfluid.c,270 ::                 Ow_Write(OW_PIN, 0xCC);                   // Issue command SKIP_ROM
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Write_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Write_port+1
        CLRF       FARG_Ow_Write_pin+0
        MOVLW      204
        MOVWF      FARG_Ow_Write_data_+0
        CALL       _Ow_Write+0
;Microfluid.c,271 ::                 Ow_Write(OW_PIN, 0x44);                   // Issue command CONVERT_T
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Write_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Write_port+1
        CLRF       FARG_Ow_Write_pin+0
        MOVLW      68
        MOVWF      FARG_Ow_Write_data_+0
        CALL       _Ow_Write+0
;Microfluid.c,272 ::                 Delay_us(120);
        MOVLW      79
        MOVWF      R13
L_GetTemp35:
        DECFSZ     R13, 1
        GOTO       L_GetTemp35
        NOP
        NOP
;Microfluid.c,274 ::                 Ow_Reset(OW_PIN);
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Reset_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Reset_port+1
        CLRF       FARG_Ow_Reset_pin+0
        CALL       _Ow_Reset+0
;Microfluid.c,275 ::                 Ow_Write(OW_PIN, 0xCC);                   // Issue command SKIP_ROM
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Write_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Write_port+1
        CLRF       FARG_Ow_Write_pin+0
        MOVLW      204
        MOVWF      FARG_Ow_Write_data_+0
        CALL       _Ow_Write+0
;Microfluid.c,276 ::                 Ow_Write(OW_PIN, 0xBE);                   // Issue command READ_SCRATCHPAD
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Write_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Write_port+1
        CLRF       FARG_Ow_Write_pin+0
        MOVLW      190
        MOVWF      FARG_Ow_Write_data_+0
        CALL       _Ow_Write+0
;Microfluid.c,278 ::                 t = Ow_Read(OW_PIN);
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Read_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Read_port+1
        CLRF       FARG_Ow_Read_pin+0
        CALL       _Ow_Read+0
        MOVF       R0, 0
        MOVWF      GetTemp_t_L0+0
        CLRF       GetTemp_t_L0+1
;Microfluid.c,279 ::                 t = (Ow_Read(OW_PIN) << 8) + t;
        MOVLW      PORTC+0
        MOVWF      FARG_Ow_Read_port+0
        MOVLW      hi_addr(PORTC+0)
        MOVWF      FARG_Ow_Read_port+1
        CLRF       FARG_Ow_Read_pin+0
        CALL       _Ow_Read+0
        MOVF       R0, 0
        MOVWF      R3
        CLRF       R2
        MOVF       GetTemp_t_L0+0, 0
        ADDWF      R2, 0
        MOVWF      R0
        MOVF       GetTemp_t_L0+1, 0
        ADDWFC     R3, 0
        MOVWF      R1
        MOVF       R0, 0
        MOVWF      GetTemp_t_L0+0
        MOVF       R1, 0
        MOVWF      GetTemp_t_L0+1
;Microfluid.c,281 ::                 return t;
;Microfluid.c,282 ::                 }
L_end_GetTemp:
        RETURN
; end of _GetTemp

_InterpretCmd:

;Microfluid.c,285 ::                 void InterpretCmd(char *cmdstr){
;Microfluid.c,287 ::                 switch(cmdstr[0]){
        MOVF       FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FLOC__InterpretCmd+0
        MOVF       FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FLOC__InterpretCmd+1
        GOTO       L_InterpretCmd36
;Microfluid.c,288 ::                 case 'T':
L_InterpretCmd38:
;Microfluid.c,289 ::                 temp = GetTemp();
        CALL       _GetTemp+0
        MOVF       R0, 0
        MOVWF      _temp+0
        MOVF       R1, 0
        MOVWF      _temp+1
;Microfluid.c,291 ::                 UART1_Write(temp);
        MOVF       R0, 0
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,292 ::                 UART1_Write(temp << 8);
        CLRF       FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,293 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,294 ::                 case 't':
L_InterpretCmd39:
;Microfluid.c,295 ::                 ConvertAndSendTemp(GetTemp());
        CALL       _GetTemp+0
        MOVF       R0, 0
        MOVWF      FARG_ConvertAndSendTemp_temp2write+0
        MOVF       R1, 0
        MOVWF      FARG_ConvertAndSendTemp_temp2write+1
        CALL       _ConvertAndSendTemp+0
;Microfluid.c,296 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,297 ::                 case '+':
L_InterpretCmd40:
;Microfluid.c,298 ::                 CpySubStr(subcmd, cmdstr, 1, ';');
        MOVLW      InterpretCmd_subcmd_L0+0
        MOVWF      FARG_CpySubStr_dest+0
        MOVLW      hi_addr(InterpretCmd_subcmd_L0+0)
        MOVWF      FARG_CpySubStr_dest+1
        MOVF       FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FARG_CpySubStr_src+0
        MOVF       FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FARG_CpySubStr_src+1
        MOVLW      1
        MOVWF      FARG_CpySubStr_ind+0
        MOVLW      0
        MOVWF      FARG_CpySubStr_ind+1
        MOVLW      59
        MOVWF      FARG_CpySubStr_until+0
        CALL       _CpySubStr+0
;Microfluid.c,299 ::                 DoStep(atoi(subcmd), 0, 100, 0);
        MOVLW      InterpretCmd_subcmd_L0+0
        MOVWF      FARG_atoi_s+0
        MOVLW      hi_addr(InterpretCmd_subcmd_L0+0)
        MOVWF      FARG_atoi_s+1
        CALL       _atoi+0
        MOVF       R0, 0
        MOVWF      FARG_DoStep_val+0
        MOVF       R1, 0
        MOVWF      FARG_DoStep_val+1
        CLRF       FARG_DoStep_stop+0
        MOVLW      100
        MOVWF      FARG_DoStep_delay+0
        MOVLW      0
        MOVWF      FARG_DoStep_delay+1
        CLRF       FARG_DoStep_uart+0
        CLRF       FARG_DoStep_uart+1
        CALL       _DoStep+0
;Microfluid.c,300 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,301 ::                 case '-':
L_InterpretCmd41:
;Microfluid.c,302 ::                 CpySubStr(subcmd, cmdstr, 1, ';');
        MOVLW      InterpretCmd_subcmd_L0+0
        MOVWF      FARG_CpySubStr_dest+0
        MOVLW      hi_addr(InterpretCmd_subcmd_L0+0)
        MOVWF      FARG_CpySubStr_dest+1
        MOVF       FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FARG_CpySubStr_src+0
        MOVF       FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FARG_CpySubStr_src+1
        MOVLW      1
        MOVWF      FARG_CpySubStr_ind+0
        MOVLW      0
        MOVWF      FARG_CpySubStr_ind+1
        MOVLW      59
        MOVWF      FARG_CpySubStr_until+0
        CALL       _CpySubStr+0
;Microfluid.c,303 ::                 DoStep(atoi(subcmd) * -1, 0, 100, 0);
        MOVLW      InterpretCmd_subcmd_L0+0
        MOVWF      FARG_atoi_s+0
        MOVLW      hi_addr(InterpretCmd_subcmd_L0+0)
        MOVWF      FARG_atoi_s+1
        CALL       _atoi+0
        MOVLW      255
        MOVWF      R4
        MOVLW      255
        MOVWF      R5
        CALL       _Mul_16x16_U+0
        MOVF       R0, 0
        MOVWF      FARG_DoStep_val+0
        MOVF       R1, 0
        MOVWF      FARG_DoStep_val+1
        CLRF       FARG_DoStep_stop+0
        MOVLW      100
        MOVWF      FARG_DoStep_delay+0
        MOVLW      0
        MOVWF      FARG_DoStep_delay+1
        CLRF       FARG_DoStep_uart+0
        CLRF       FARG_DoStep_uart+1
        CALL       _DoStep+0
;Microfluid.c,304 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,305 ::                 case '*':
L_InterpretCmd42:
;Microfluid.c,306 ::                 DoStep(0, 1, 0, 0);
        CLRF       FARG_DoStep_val+0
        CLRF       FARG_DoStep_val+1
        MOVLW      1
        MOVWF      FARG_DoStep_stop+0
        CLRF       FARG_DoStep_delay+0
        CLRF       FARG_DoStep_delay+1
        CLRF       FARG_DoStep_uart+0
        CLRF       FARG_DoStep_uart+1
        CALL       _DoStep+0
;Microfluid.c,307 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,308 ::                 case 'B':
L_InterpretCmd43:
;Microfluid.c,309 ::                 UART1_Write(buttonsState);
        MOVF       _buttonsState+0, 0
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,310 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,311 ::                 case 'L':
L_InterpretCmd44:
;Microfluid.c,312 ::                 if(cmdstr[1] == 'N'){
        MOVLW      1
        ADDWF      FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FSR0L
        MOVLW      0
        ADDWFC     FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      78
        BTFSS      STATUS+0, 2
        GOTO       L_InterpretCmd45
;Microfluid.c,313 ::                 camLED = 1;
        BSF        RC1_bit+0, BitPos(RC1_bit+0)
;Microfluid.c,314 ::                 } else if(cmdstr[1] == 'F'){
        GOTO       L_InterpretCmd46
L_InterpretCmd45:
        MOVLW      1
        ADDWF      FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FSR0L
        MOVLW      0
        ADDWFC     FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      70
        BTFSS      STATUS+0, 2
        GOTO       L_InterpretCmd47
;Microfluid.c,315 ::                 camLED = 0;
        BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Microfluid.c,316 ::                 }
L_InterpretCmd47:
L_InterpretCmd46:
;Microfluid.c,317 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,318 ::                 case 'P':
L_InterpretCmd48:
;Microfluid.c,319 ::                 if(cmdstr[1] == 'H'){
        MOVLW      1
        ADDWF      FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FSR0L
        MOVLW      0
        ADDWFC     FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      72
        BTFSS      STATUS+0, 2
        GOTO       L_InterpretCmd49
;Microfluid.c,320 ::                 doTempControl = 1;
        MOVLW      1
        MOVWF      _doTempControl+0
;Microfluid.c,321 ::                 } else if(cmdstr[1] == 'C'){
        GOTO       L_InterpretCmd50
L_InterpretCmd49:
        MOVLW      1
        ADDWF      FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FSR0L
        MOVLW      0
        ADDWFC     FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      67
        BTFSS      STATUS+0, 2
        GOTO       L_InterpretCmd51
;Microfluid.c,322 ::                 doTempControl = 0;
        CLRF       _doTempControl+0
;Microfluid.c,323 ::                 H1 = 0;
        BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Microfluid.c,324 ::                 } else if(cmdstr[1] == 'F'){
        GOTO       L_InterpretCmd52
L_InterpretCmd51:
        MOVLW      1
        ADDWF      FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FSR0L
        MOVLW      0
        ADDWFC     FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      70
        BTFSS      STATUS+0, 2
        GOTO       L_InterpretCmd53
;Microfluid.c,325 ::                 doTempControl = 0;
        CLRF       _doTempControl+0
;Microfluid.c,326 ::                 H1 = 0;
        BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Microfluid.c,327 ::                 }
L_InterpretCmd53:
L_InterpretCmd52:
L_InterpretCmd50:
;Microfluid.c,328 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,329 ::                 case 'D':
L_InterpretCmd54:
;Microfluid.c,330 ::                 if(cmdstr[1] == 'N'){
        MOVLW      1
        ADDWF      FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FSR0L
        MOVLW      0
        ADDWFC     FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      78
        BTFSS      STATUS+0, 2
        GOTO       L_InterpretCmd55
;Microfluid.c,331 ::                 backLite = 1;
        BSF        RE0_bit+0, BitPos(RE0_bit+0)
;Microfluid.c,332 ::                 } else if(cmdstr[1] == 'F'){
        GOTO       L_InterpretCmd56
L_InterpretCmd55:
        MOVLW      1
        ADDWF      FARG_InterpretCmd_cmdstr+0, 0
        MOVWF      FSR0L
        MOVLW      0
        ADDWFC     FARG_InterpretCmd_cmdstr+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      70
        BTFSS      STATUS+0, 2
        GOTO       L_InterpretCmd57
;Microfluid.c,333 ::                 backLite = 0;
        BCF        RE0_bit+0, BitPos(RE0_bit+0)
;Microfluid.c,334 ::                 }
L_InterpretCmd57:
L_InterpretCmd56:
;Microfluid.c,335 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,336 ::                 case 'C':
L_InterpretCmd58:
;Microfluid.c,337 ::                 if (!chip){
        BTFSC      RD5_bit+0, BitPos(RD5_bit+0)
        GOTO       L_InterpretCmd59
;Microfluid.c,338 ::                 UART1_Write ('Y');
        MOVLW      89
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,339 ::                 } else {
        GOTO       L_InterpretCmd60
L_InterpretCmd59:
;Microfluid.c,340 ::                 UART1_Write ('N');
        MOVLW      78
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,341 ::                 }
L_InterpretCmd60:
;Microfluid.c,342 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,343 ::                 case 'K':
L_InterpretCmd61:
;Microfluid.c,344 ::                 UART1_Write('K');
        MOVLW      75
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,345 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,346 ::                 case 'A':
L_InterpretCmd62:
;Microfluid.c,347 ::                 if(!batteryLow && !batteryCharge){
        BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
        GOTO       L_InterpretCmd65
        BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
        GOTO       L_InterpretCmd65
L__InterpretCmd98:
;Microfluid.c,348 ::                 UART1_Write('G');
        MOVLW      71
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,349 ::                 }
        GOTO       L_InterpretCmd66
L_InterpretCmd65:
;Microfluid.c,350 ::                 else if(batteryLow && !batteryCharge){
        BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
        GOTO       L_InterpretCmd69
        BTFSC      RA4_bit+0, BitPos(RA4_bit+0)
        GOTO       L_InterpretCmd69
L__InterpretCmd97:
;Microfluid.c,351 ::                 UART1_Write('F');
        MOVLW      70
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,352 ::                 }
        GOTO       L_InterpretCmd70
L_InterpretCmd69:
;Microfluid.c,353 ::                 else if(batteryCharge){
        BTFSS      RA4_bit+0, BitPos(RA4_bit+0)
        GOTO       L_InterpretCmd71
;Microfluid.c,354 ::                 UART1_Write('E');
        MOVLW      69
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,355 ::                 }
L_InterpretCmd71:
L_InterpretCmd70:
L_InterpretCmd66:
;Microfluid.c,356 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,357 ::                 default:
L_InterpretCmd72:
;Microfluid.c,358 ::                 UART1_Write('!');
        MOVLW      33
        MOVWF      FARG_UART1_Write_data_+0
        CALL       _UART1_Write+0
;Microfluid.c,359 ::                 break;
        GOTO       L_InterpretCmd37
;Microfluid.c,360 ::                 }
L_InterpretCmd36:
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      84
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd38
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      116
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd39
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      43
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd40
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      45
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd41
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      42
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd42
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      66
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd43
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      76
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd44
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      80
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd48
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      68
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd54
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      67
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd58
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      75
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd61
        MOVF       FLOC__InterpretCmd+0, 0
        MOVWF      FSR0L
        MOVF       FLOC__InterpretCmd+1, 0
        MOVWF      FSR0H
        MOVF       INDF0+0, 0
        XORLW      65
        BTFSC      STATUS+0, 2
        GOTO       L_InterpretCmd62
        GOTO       L_InterpretCmd72
L_InterpretCmd37:
;Microfluid.c,361 ::                 }
L_end_InterpretCmd:
        RETURN
; end of _InterpretCmd

_TempControl:

;Microfluid.c,363 ::                 void TempControl(void){
;Microfluid.c,369 ::                 temp = GetTemp();
        CALL       _GetTemp+0
        MOVF       R0, 0
        MOVWF      _temp+0
        MOVF       R1, 0
        MOVWF      _temp+1
;Microfluid.c,371 ::                 tempWhole = temp >> RES_SHIFT ;
        MOVF       R0, 0
        MOVWF      R2
        MOVF       R1, 0
        MOVWF      R3
        LSRF       R3, 1
        RRF        R2, 1
        MOVF       R2, 0
        MOVWF      TempControl_tempWhole_L0+0
;Microfluid.c,376 ::                 if(tempWhole < 37){
        MOVLW      37
        SUBWF      R2, 0
        BTFSC      STATUS+0, 0
        GOTO       L_TempControl73
;Microfluid.c,377 ::                 H1 = 1;
        BSF        RB5_bit+0, BitPos(RB5_bit+0)
;Microfluid.c,378 ::                 } else if(tempWhole >= 36){
        GOTO       L_TempControl74
L_TempControl73:
        MOVLW      36
        SUBWF      TempControl_tempWhole_L0+0, 0
        BTFSS      STATUS+0, 0
        GOTO       L_TempControl75
;Microfluid.c,379 ::                 H1 = 0;
        BCF        RB5_bit+0, BitPos(RB5_bit+0)
;Microfluid.c,380 ::                 }
L_TempControl75:
L_TempControl74:
;Microfluid.c,382 ::                 }
L_end_TempControl:
        RETURN
; end of _TempControl

_main:

;Microfluid.c,385 ::                 void main(void) {
;Microfluid.c,386 ::                 HardInit();
        CALL       _HardInit+0
;Microfluid.c,388 ::                 backLite = 0;
        BCF        RE0_bit+0, BitPos(RE0_bit+0)
;Microfluid.c,389 ::                 camLED = 1;
        BSF        RC1_bit+0, BitPos(RC1_bit+0)
;Microfluid.c,390 ::                 Delay_ms(200);
        MOVLW      3
        MOVWF      R11
        MOVLW      8
        MOVWF      R12
        MOVLW      119
        MOVWF      R13
L_main76:
        DECFSZ     R13, 1
        GOTO       L_main76
        DECFSZ     R12, 1
        GOTO       L_main76
        DECFSZ     R11, 1
        GOTO       L_main76
;Microfluid.c,391 ::                 backLite = 1;
        BSF        RE0_bit+0, BitPos(RE0_bit+0)
;Microfluid.c,392 ::                 camLED = 0;
        BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Microfluid.c,393 ::                 Delay_ms(200);
        MOVLW      3
        MOVWF      R11
        MOVLW      8
        MOVWF      R12
        MOVLW      119
        MOVWF      R13
L_main77:
        DECFSZ     R13, 1
        GOTO       L_main77
        DECFSZ     R12, 1
        GOTO       L_main77
        DECFSZ     R11, 1
        GOTO       L_main77
;Microfluid.c,394 ::                 backLite = 0;
        BCF        RE0_bit+0, BitPos(RE0_bit+0)
;Microfluid.c,395 ::                 camLED = 1;
        BSF        RC1_bit+0, BitPos(RC1_bit+0)
;Microfluid.c,396 ::                 Delay_ms(200);
        MOVLW      3
        MOVWF      R11
        MOVLW      8
        MOVWF      R12
        MOVLW      119
        MOVWF      R13
L_main78:
        DECFSZ     R13, 1
        GOTO       L_main78
        DECFSZ     R12, 1
        GOTO       L_main78
        DECFSZ     R11, 1
        GOTO       L_main78
;Microfluid.c,397 ::                 backLite = 1;
        BSF        RE0_bit+0, BitPos(RE0_bit+0)
;Microfluid.c,398 ::                 camLED = 0;
        BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Microfluid.c,400 ::                 UART1_Init(9600);                // Initialize UART module at 9600 bps
        BSF        BAUDCON+0, 3
        CLRF       SPBRGH+0
        MOVLW      207
        MOVWF      SPBRG+0
        BSF        TXSTA+0, 2
        CALL       _UART1_Init+0
;Microfluid.c,401 ::                 Delay_ms(100);
        MOVLW      2
        MOVWF      R11
        MOVLW      4
        MOVWF      R12
        MOVLW      186
        MOVWF      R13
L_main79:
        DECFSZ     R13, 1
        GOTO       L_main79
        DECFSZ     R12, 1
        GOTO       L_main79
        DECFSZ     R11, 1
        GOTO       L_main79
        NOP
;Microfluid.c,403 ::                 cmdCtr = 0;
        CLRF       _cmdCtr+0
        CLRF       _cmdCtr+1
;Microfluid.c,404 ::                 for(;;) {                     // Endless loop
L_main80:
;Microfluid.c,405 ::                 GetButtonState();
        CALL       _GetButtonState+0
;Microfluid.c,406 ::                 if (UART1_Data_Ready()) {     // If data is received,
        CALL       _UART1_Data_Ready+0
        MOVF       R0, 0
        BTFSC      STATUS+0, 2
        GOTO       L_main83
;Microfluid.c,407 ::                 uart_rd = UART1_Read();     // read the received data,
        CALL       _UART1_Read+0
        MOVF       R0, 0
        MOVWF      _uart_rd+0
;Microfluid.c,409 ::                 if(uart_rd == '#' && !cmdStarted){
        MOVF       R0, 0
        XORLW      35
        BTFSS      STATUS+0, 2
        GOTO       L_main86
        MOVF       _cmdStarted+0, 0
        BTFSS      STATUS+0, 2
        GOTO       L_main86
L__main101:
;Microfluid.c,410 ::                 cmdStarted = 1;
        MOVLW      1
        MOVWF      _cmdStarted+0
;Microfluid.c,411 ::                 } else if(uart_rd == ';' && cmdStarted){
        GOTO       L_main87
L_main86:
        MOVF       _uart_rd+0, 0
        XORLW      59
        BTFSS      STATUS+0, 2
        GOTO       L_main90
        MOVF       _cmdStarted+0, 0
        BTFSC      STATUS+0, 2
        GOTO       L_main90
L__main100:
;Microfluid.c,412 ::                 cmd[cmdCtr++] = uart_rd;
        MOVLW      _cmd+0
        ADDWF      _cmdCtr+0, 0
        MOVWF      FSR1L
        MOVLW      hi_addr(_cmd+0)
        ADDWFC     _cmdCtr+1, 0
        MOVWF      FSR1H
        MOVF       _uart_rd+0, 0
        MOVWF      INDF1+0
        INCF       _cmdCtr+0, 1
        BTFSC      STATUS+0, 2
        INCF       _cmdCtr+1, 1
;Microfluid.c,413 ::                 InterpretCmd(cmd);
        MOVLW      _cmd+0
        MOVWF      FARG_InterpretCmd_cmdstr+0
        MOVLW      hi_addr(_cmd+0)
        MOVWF      FARG_InterpretCmd_cmdstr+1
        CALL       _InterpretCmd+0
;Microfluid.c,414 ::                 cmdCtr = 0;
        CLRF       _cmdCtr+0
        CLRF       _cmdCtr+1
;Microfluid.c,415 ::                 cmdStarted = 0;
        CLRF       _cmdStarted+0
;Microfluid.c,416 ::                 } else {
        GOTO       L_main91
L_main90:
;Microfluid.c,417 ::                 if(cmdStarted)
        MOVF       _cmdStarted+0, 0
        BTFSC      STATUS+0, 2
        GOTO       L_main92
;Microfluid.c,418 ::                 cmd[cmdCtr++] = uart_rd;
        MOVLW      _cmd+0
        ADDWF      _cmdCtr+0, 0
        MOVWF      FSR1L
        MOVLW      hi_addr(_cmd+0)
        ADDWFC     _cmdCtr+1, 0
        MOVWF      FSR1H
        MOVF       _uart_rd+0, 0
        MOVWF      INDF1+0
        INCF       _cmdCtr+0, 1
        BTFSC      STATUS+0, 2
        INCF       _cmdCtr+1, 1
L_main92:
;Microfluid.c,419 ::                 }
L_main91:
L_main87:
;Microfluid.c,420 ::                 }
L_main83:
;Microfluid.c,421 ::                 cnt++;
        MOVLW      1
        ADDWF      _cnt+0, 1
        MOVLW      0
        ADDWFC     _cnt+1, 1
        ADDWFC     _cnt+2, 1
        ADDWFC     _cnt+3, 1
;Microfluid.c,422 ::                 if  (doTempControl && cnt >= 2000){
        MOVF       _doTempControl+0, 0
        BTFSC      STATUS+0, 2
        GOTO       L_main95
        MOVLW      0
        SUBWF      _cnt+3, 0
        BTFSS      STATUS+0, 2
        GOTO       L__main120
        MOVLW      0
        SUBWF      _cnt+2, 0
        BTFSS      STATUS+0, 2
        GOTO       L__main120
        MOVLW      7
        SUBWF      _cnt+1, 0
        BTFSS      STATUS+0, 2
        GOTO       L__main120
        MOVLW      208
        SUBWF      _cnt+0, 0
L__main120:
        BTFSS      STATUS+0, 0
        GOTO       L_main95
L__main99:
;Microfluid.c,423 ::                 TempControl();
        CALL       _TempControl+0
;Microfluid.c,424 ::                 cnt = 0;
        CLRF       _cnt+0
        CLRF       _cnt+1
        CLRF       _cnt+2
        CLRF       _cnt+3
;Microfluid.c,425 ::                 }
L_main95:
;Microfluid.c,426 ::                 }
        GOTO       L_main80
;Microfluid.c,427 ::                 }
L_end_main:
        GOTO       $+0
; end of _main