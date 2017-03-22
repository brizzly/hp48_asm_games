SAVE
INTOFF

DC HEXDCW 2DEAA
DC KEY    0020F
DC MKSTR  05B7D
DCCP 5 EC1
DCCP 5 X
DCCP 5 Y
DCCP 5 B
DCCP 5 S
DCCP 5 X2

A=0.A
D0=(5)X DAT0=A.A
D0=(5)Y DAT0=A.A
D0=(5)B DAT0=A.A
D0=(5)S DAT0=A.A
D0=(5)X2 DAT0=A.A

LC 01400 GOSBVL =MKSTR
AD0EX A+1.A ABIT=0.0
D0=(5)EC1 DAT0=A.A

GOSUBL INI.STACK

LA 3F D0=00128 DAT0=A.B

GOSUBL CL.MEM
D0=(5)EC1 A=DAT0.A
D0=00120 DAT0=A.A
R0=A.A
CLRST
%GOSUBL INI.STACK
GOSUBL DISP.LEVEL
GOSUBL CUBE

*LCD
GOSUBL TAB
GOSUBL TNEXT
GOSUBL TPREV
GOSUBL TDRAW
GOSUBL CUBE.P
GOSUBL CUBE.M
LC 02000 { C-1.A UPNC }
GOSUBL CURSOR
GOSUBL TD GOSUBL TG
GOSUBL TH GOSUBL TB
GOSUBL TQ
GOLONG LCD

*TQ
LC 001 GOSBVL =KEY
?CBIT=0.0 RTNYES
*QUIT
LC(3)$1FF
GOSBVL =KEY
?C#0.B GOYES QUIT

LA 37 D0=00128 DAT0=A.B
D0=(5)$8068D A=DAT0.A
D0=(5)$00120 DAT0=A.A
LOADRPL

*CL.MEM
D0=(5)EC1 A=DAT0.A D0=A
LC(3)$87 C+C.X A=0.W
{ DAT0=A.W D0+16
C-1.X UPNC }
RTN

*CURSOR
?ST=0.0 ->{ ST=1.0 } SKELSE { RTN }
*NCURSER
A=R0.A
GOSUBL XY
D0=A
LC 7  {
A=DAT0.B A=-A-1.B
DAT0=A.B D0+34
C-1.P UPNC }
RTN

*TD
LC 040 GOSBVL =KEY
?CBIT=0.0 RTNYES
D0=(5)X A=DAT0.A
LC(5)#12
?A=C.B RTNYES

?ST=1.0 ->{ ST=0.0
  GOSUBL NCURSER }

D0=(5)X A=DAT0.B
A+1.B
DAT0=A.B
A=R2.A A+2.A R2=A.A
GOSUBL CURSOR
RTN

*TG
LC 040 GOSBVL =KEY
?CBIT=0.2 RTNYES
D0=(5)X A=DAT0.B
?A=0.B RTNYES
?ST=1.0 ->{ ST=0.0 GOSUBL NCURSER }
D0=(5)X A=DAT0.B
A-1.B
DAT0=A.B
A=R2.A A-2.A R2=A.A
GOSUBL CURSOR
RTN

*TB
LC 040 GOSBVL =KEY
?CBIT=0.1 RTNYES
D0=(5)Y A=DAT0.B
LC 07 ?A=C.B RTNYES
?ST=1.0 ->{ ST=0.0
  GOSUBL NCURSER }

D0=(5)Y A=DAT0.B
A+1.B DAT0=A.B
A=R2.A
LC 00140 A+C.A
R2=A.A
GOSUBL CURSOR
RTN

*TH
LC 040 GOSBVL =KEY
?CBIT=0.3 RTNYES
D0=(5)Y A=DAT0.B
?A=0.B RTNYES
?ST=1.0 ->{ ST=0.0
  GOSUBL NCURSER }
D0=(5)Y A=DAT0.B
A-1.B DAT0=A.B
A=R2.A
LC 00140 A-C.A
R2=A.A
GOSUBL CURSOR
RTN

*XY
C=0.A
D0=(5)X C=DAT0.B C+C.A
A+C.A C=0.A
D0=(5)Y C=DAT0.B D=C.A
CSL.A C+D.A C+C.A
C+C.A C+C.A C+C.A
A+C.A
RTN

*TAB

SKUBL {
$0FFFFFF70100000401000084015462B409AAA824098E6A24098AAA140100000401B9263409B26554098A253401B94354010000040100000409FFFFF40100000405100004055000040900000405500004051000040100000409FFFFF40100000405100004055000040900000409400004090000040100000409FFFFF40100000409570004050410040D520004015110040D4700040100000409FFFFF4010000040D470004051210040D52000405421004054200040100000409FFFFF4010000040D481004055440040D440004055440040DD91004010000040100000401000004010000040100000401000004010000040100000401000004010000040FFFFFF7
} C=RSTK D1=C

D0=(5)EC1
A=DAT0.A A+16.A
A+10.A D0=A D1+1
LC 3F
{
 A=DAT1.8
 DAT0=A.8 D0+34
 D1+8 C-1.B UPNC
}
 
GOSUBL CUBE
GOSUBL D.BLOC
GOSUBL D.SIZE
GOSUBL D.PIT
GOSUBL D.X
GOSUBL D.Y

RTN

*CUBE
A=R3.A D1=A
D0=(5)EC1 A=DAT0.A
LC 00749 A+C.A D0=A
LC 7
{
 A=DAT1.B
 DAT0=A.B D0+34
 D1+4 C-1.P UPNC
}
RTN

*CUBE.P
LC 001 GOSBVL =KEY
?CBIT=0.1 RTNYES
LC 00020
A=R3.A A+C.A R3=A.A
D0=(5)B A=DAT0.B
A+1.B DAT0=A.B
GOSUBL CUBE
RTN

*CUBE.M
LC 001 GOSBVL =KEY
?CBIT=0.2 RTNYES
D0=(5)B A=DAT0.B
?A=0.B RTNYES
A-1.B DAT0=A.B

LC 00020
A=R3.A A-C.A R3=A.A
GOSUBL CUBE
RTN

*INI.STACK
LOAD
SAVE
%%%%%%%%%%
% STRING %
%%%%%%%%%%

LC(5)#1283*#2 B=C.A

A=DAT1.A
?A=0.A GOYES MKS
D0=A A=DAT0.A
LC(5)$02A2C
?A#C.A GOYES MKS
D0+5 A=DAT0.A
A-5.A
?A#B.A GOYES MKS

SKIP {
*MKS
C=B.A GOSBVL =MKSTR
LC(6)$4C4D53 DAT0=C.6
AD0EX  A-10.A R0=A.A
A+16.A D0=A
LC(3)#159 A=0.W
{ DAT0=A.W D0+16
 C-1.X UPNC }
LOAD
A=R0.A
D-1.A
SKIPNC { SAVE GOTO QUIT }
D1-5 DAT1=A.A
SAVE
}

A=DAT1.A
A+16.A R2=A.A

LC(2)#13
D0=(5)X2 DAT0=C.B

%%%%%%%%%%
% DATAS  %
%%%%%%%%%%

SKUBL {
INCLUDE DATAS
} C=RSTK C+20.A R3=C.A
RTN

*D.BLOC
D0=(5)EC1 A=DAT0.A
LC 0067F A+C.A
R4=A.A A=0.W
D0=(5)B A=DAT0.B
GOSBVL =HEXDCW SETHEX
LC 2 D=C.P
GOLONG DISP_N

*D.X
D0=(5)EC1 A=DAT0.A
LC 0023F A+C.A
R4=A.A A=0.W
D0=(5)X A=DAT0.A
D0=(5)S C=DAT0.A
*INC ?C#0.A ->{ C-1.A
A+13.A GOTO INC }
GOSBVL =HEXDCW SETHEX
LC 4 D=C.P
GOLONG DISP_N

*D.Y
D0=(5)EC1 A=DAT0.A
LC 0034F A+C.A
R4=A.A A=0.W
D0=(5)Y A=DAT0.B
GOSBVL =HEXDCW SETHEX
LC 4 D=C.P
GOLONG DISP_N

*D.SIZE
D0=(5)EC1 A=DAT0.A
LC 0045F A+C.A
R4=A.A A=0.W
D0=(5)X2 A=DAT0.B
GOSBVL =HEXDCW SETHEX
LC 2 D=C.P
GOLONG DISP_N

*D.PIT
D0=(5)EC1 A=DAT0.A
LC 0056F A+C.A
R4=A.A A=0.W
D0=(5)S A=DAT0.B A+1.B
GOSBVL =HEXDCW SETHEX
LC 2 D=C.P
GOLONG DISP_N

*DISP_N
GOSUBL GET_DAT
C=0.P

{
 ?B=C.P EXIT
 D1+1 C+1.P UP
}

*DSP
A=R4.A D0=A
LC 4  { A=DAT1.P
DAT0=A.P D0+34
D1+16 C-1.P UPNC }
BSR.A A=R4.A A-1.A R4=A.A
D-1.P ?D#0.P ->{ GOTO DISP_N }
RTN

*GET_DAT
GOSUBL DAT
$237757677723637752445114555515115277777277731577521444515455151127774771775363710000000000000000
*DAT
C=RSTK D1=C
RTN

*TDRAW
LC 008 GOSBVL =KEY
?CBIT=0.4 RTNYES

D0=(5)X A=DAT0.A
D0=(5)S C=DAT0.A
{
 ?C=0.A 
 {
  C-1.A
  A+13.A
  UP2
 }
}
LC(5)#160
?A>=C.A RTNYES

?ST=1.0 ->{ ST=0.0
 GOSUBL NCURSER }
A=R3.A D1=A
A=R0.A GOSUBL XY D0=A
LC 7
{ A=DAT1.B DAT0=A.B
D0+34 D1+4
C-1.P UPNC }
A=R2.A D0=A D1=(5)B
A=DAT1.B DAT0=A.B
GOSUBL CURSOR
RTN

*DISP.LEVEL
D0=(5)EC1 A=DAT0.A
R4=A.A

LC(2)#13 D=C.B % X
LC(2)#08 B=C.B % Y

A=R2.A
D0=(5)X C=DAT0.B
{
 ?C=0.B EXIT
 C-1.B A-2.A UP
}
D0=(5)Y C=DAT0.B
RSTK=C
{
 C=RSTK
 ?C=0.B EXIT
 C-1.B RSTK=C
 LC 00140 A-C.A UP
}

D0=A CD0EX RSTK=C D0=C

*BCL
D1=(5)B C=DAT1.B
A=R3.A
{
 ?C=0.B EXIT
 A-32.A
 C-1.B UP
}
D1=A C=0.B

{
 A=DAT0.B ?A=C.B EXIT
 C+1.B D1+32 UP
}

A=R4.A D0=A
LC 7
{
 A=DAT1.B DAT0=A.B
 D0+34 D1+4 C-1.P
 UPNC
}

 A=R4.A A+2.A R4=A.A
 C=RSTK C+2.A RSTK=C
 D0=C

D-1.B
?D#0.B ->{ GOTO BCL }

LC(2)#13 D=C.B

C=RSTK
LA(5)$126 C+A.A
RSTK=C D0=C

A=R4.A A-26.A
LC 00110 A+C.A R4=A.A

B-1.B ?B#0.B ->{ GOTO BCL }
C=RSTK
D0=(5)S A=DAT0.B
LC(2)#12
?A<C.B RTNYES

D0=(5)EC1
A=DAT0.A A+8.A D0=A
A=0.W LC 3F
{
 DAT0=A.W D0+16
 DAT0=A.B D0+18
 C-1.B UPNC
}
RTN

*TNEXT
LC 008 GOSBVL =KEY
?CBIT=0.7 RTNYES
D0=(5)S A=DAT0.B
D1=(5)X2 C=DAT1.B C-1.B
?A>=C.B RTNYES
A+1.B DAT0=A.B

A=R2.A A+26.A R2=A.A
GOSUBL DISP.LEVEL
ST=0.0
RTN

*TPREV
LC 020 GOSBVL =KEY
?CBIT=0.7 RTNYES
D0=(5)S A=DAT0.B
?A=0.B RTNYES
A-1.B DAT0=A.B

A=R2.A A-26.A R2=A.A
GOSUBL DISP.LEVEL
ST=0.0
RTN


@