HPHP48-W,*PU 
%TXT%%%%%%%%%%%%%%%%%%
%                    %
%%%%%%%%%%%%%%%%%%%%%%

**MARIO_1
P= 0
D0= 001D0 A=DAT0.A
A=A+3.A D0=A C=DAT0.A
B=C.P B=B-1.P

D0= 001C9 A=DAT0.A
D0=A D0=D0+ 1

%%%%% QUEL TALK ? %%%%
?ST=1.10 { D0=D0+ 8 }
D0=D0+ 6
D=0.P A=DAT0.P LC 1

DO {
?ST=0.10
 {
  ?A=C.P { GOLONG TN }
 } ELSE {
  ?A=C.P { GOLONG TN2 }
 }
C=C+1.P D=D+1.P
B--.P } WHILENC
RTN

*TN
D0= 001D5 C=DAT0.A

*UP1
?D�0.P { D0=C A=DAT0.A
C=C+A.A C=C+5.A D--.P
GOTO UP1 } C=C+5.A
RTN

*TN2
D0= 001D0 A=DAT0.A
A=A+3.A D0=A A=DAT0.P
B=A.P B--.P

D0= 001D5 C=DAT0.A

*UP2
?B�0.P { D0=C A=DAT0.A
C=C+A.A C=C+5.A B--.P
GOTO UP2 }

*UP3
?D�0.P { D0=C A=DAT0.A
C=C+A.A C=C+5.A D--.P
GOTO UP3 } C=C+5.A

RTN

@