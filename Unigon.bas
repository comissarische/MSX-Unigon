10 'Unigon
12 DEFINT B,I,J,L,C,W,H : color 0,0,0:screen 5:G=RND(-TIME):color 15,0,0:cls
13 set page 0,1:CLS:restore 18: for v=1 to 7: read c, p
14 pset (10, v*25):draw "c=c;r10m+5,+10m-5,+10l10m-5,-10m+5,-10":pset(30, v*25):draw "c=c;m+24,+12m-24,+12u24":pset(60, v*25+12):draw "c=c;m+24,-12d24m-24,-12":
15 pset(90, v*25):draw "c=c;r24d24l24u24":pset(120, v*25):draw "c=c;m+6,+3m-6,+3u6":pset(150, v*25+3):draw "c=c;m+6,-3d6m-6,-3"
16  if p<>0 then paint(12,v*25+3),p,c:paint(32,v*25+5),p,c:paint(65, v*25+12),p,c:paint(95, v*25+2),p,c:paint(122, v*25+2),p,c:paint(153, v*25+3),p,c:
17 next v: set page 0,0
18 DATA 14,0, 3,0, 10,0, 8,8, 4,4, 1,0, 1,1
19 _TURBO ON
20 DIM grid%(19,18),itms%(19,18), RS%(4,2), sp%(3):widt=256:heig=212:pi=3.1415926:sp%(1)=3:sp%(2)=4:sp%(3)=6
30 '____ ____ _    ____ ___  ___  ___  ____ 
40 '| __\|   ||\/\ |___\| _\ | _\ |  \ | . \
50 '| \__| . ||   \| /  [__ \[__ \| . \|  <_
60 '|___/|___/|/v\/|/   |___/|___/|/\_/|/\_/
70 'http://patorjk.com/software/taag/
80 'if shape=6 then cols=INT((widt-res*1.2)/(res*2*1.8))-1:?widt-res*2,res*1.8,res*.5+(14+.5)*res*1.8:rows=INT((heig-res*2)/(res/2.1*2))-1
90 'if shape=4 then cols=INT((widt-res*1.2)/(res*2))-1:rows=INT((heig-res*1.2)/(res*2))-1
100 'if shape=3 then cols = INT((widt-res*4)/res/.74/2)-1:rows=INT((heig-res*4)/res/1.78/2)-1:if int(cols/2)=cols/2 then cols=cols+1
105 shape=7:res=3.3:cols=29: rows=38 '? cols,rows
107 'gosub 2000
110 '
115 for i = 0 to cols:forj = 0 to rows
117 '
118 if i=0 or j=0 or i=cols or j=rows then fill=0:v=int(rnd(1)*5+1):gosub 1010:A$=INKEY$:IF A$<>"" then goto 122
119 Next j,i
122 shape=7:res=3.3:cols=29: rows=38
126 restore 4000
134 for l=1 to 71
137 read i,j: i=i-1: j=j+3: c=15::fill=1:v=int(rnd(1)*2+4):gosub 1010:A$=INKEY$:IF A$<>"" then goto 270 
140 NEXT l

270 IF INKEY$<>"" THEN GOTO 270 'clear keyboard buffer
280 C=15:X=18:Y=180:A$="> (c)Comissar 2024, v0.04 <":GOSUB 1590
285 LINE (170,180)-(175,182),4,BF
287 LINE (170,183)-(175,185),10,BF

300 goto 460

360 PC%=1:' Choose 1 or 2 player mode to pc%
370 LINE (40,115)-(210,142),15,B
375 LINE (41,116)-(209,141),0,BF
380 C=15:X=60:Y=120:A$="  1 player  ":GOSUB 1590
385 Y=130:A$="  2 players     ":GOSUB 1590
400 LINE(50,120)-(66,141),0,bf
401 Y=110+PC%*10:A$=">":GOSUB 1590:COPY(52,120)-STEP(10,32) TO (51,120),,TPSET 
403 gosub 1720:A$=INKEY$:IF A$="" AND RS%(1,2)=0 AND RS%(2,2)=0 AND RS%(3,2)=0 AND RS%(4,2)=0 THEN GOTO 403 ELSE IF A$<>" " AND ASC(A$)<>13 AND RS%(1,2)=0 AND RS%(2,2)=0 THEN PC%=PC% mod 2 + 1:GOTO 400

460 sh%=1:' Choose shape to sh%
470 LINE (40,115)-(210,152),15,B
475 LINE (41,116)-(209,151),0,BF
480 C=15:X=60:Y=120:A$="  TRI   - gon  ":GOSUB 1590
482 Y=130:A$="  TETRA - gon     ":GOSUB 1590
485 Y=140:A$="  HEXA  - gon     ":GOSUB 1590
488 LINE(170,116)-(209,151),0,bf
490 LINE(50,120)-(66,151),0,bf
491 X=60:C=15:Y=110+sh%*10:A$=">":GOSUB 1590:COPY(52,120)-STEP(10,32) TO (51,120),,TPSET 
492 shape=sp%(sh%):res=10:x=190:y=135:c=int(rnd(1)*13+2): fill=1: gosub 1060:c=int(rnd(1)*13+2): fill=0: gosub 1060
503 gosub 1720:A$=INKEY$:IF A$="" AND RS%(1,2)=0 AND RS%(2,2)=0 AND RS%(3,2)=0 AND RS%(4,2)=0 THEN GOTO 492 ELSE IF A$<>" " AND ASC(A$)<>13 AND RS%(1,2)=0 AND RS%(2,2)=0 THEN sh%=sh% mod 3 + 1:GOTO 488

600 if sh%=1 then cols=8:rows=11:res=9
602 if sh%=2 then cols=8:rows=6:res=13
604 if sh%=3 then cols=13:rows=7:res=10
609 cls
615 for i = 0 to cols:forj = 0 to rows
617 grid%(i,j)=14:fill=0:v=1
620 'if i=0 or j=0 or i=cols or j=rows then fill=1:grid%(i,j)=10
622 gosub 1000
629 Next j,i
640 grid%(0,rows) = 4: i=0:j=rows:fill=1:v=5:gosub 1000
650 grid%(cols,0) = 8: i=cols:j=0:c=8:fill=1:v=4:gosub 1000
641 'itms%(4,1) = 4: i=4:j=1:c=4:fill=1:gosub 1010:c=14:fill=0:gosub 1010
642 'itms%(5,4) = 4: i=5:j=4:c=4:fill=1:gosub 1010:c=14:fill=0:gosub 1010
651 'itms%(cols,2) = 8: i=cols:j=2:c=8:fill=1:gosub 1010:c=14:fill=0:gosub 1010
655 IF INKEY$<>"" THEN GOTO 655 'clear keyboard buffer
660 CP% = 1: EP%=2
665 CC% = CP%*4: EC%=EP%*4 'get start to si, sj
670 rm=0:for i = 0 to cols:forj = 0 to rows
680 if grid%(i,j) <> cc% then goto 700
682 ra=0:for si=i-1 to i+1: for sj=j-1 to j+1
684 if grid%(si,sj)=14 then gosub 1200: if is% then ra=1 else goto 686
686 next sj,si: if ra=0 goto 700 ' field with no moves 
690 rm=1:c=0:fill=0:v=6:gosub 1010:gosub 1670
695 v=6-CP%:gosub 1000:gosub 1670 
697 A$=INKEY$:IF A$="" AND RS%(1,2)=0 AND RS%(2,2)=0 AND RS%(3,2)=0 AND RS%(4,2)=0 THEN GOTO 690 ELSE IF A$<>" " AND ASC(A$)<>13 AND ASC(A$)<>27 AND RS%(1,2)=0 AND RS%(2,2)=0 THEN 700 else si=i: sj=j:GOTO 710
700 next j, i: if rm=0 then LINE (60,60)-(200,90),0,BF:LINE (60,60)-(200,90),15,B:X=80:Y=72:A$="Player"+STR$(EP%)+" win!":GOSUB 1590:COPY(80,72)-STEP(100,12) TO (79,72),,TPSET: gosub 2000:cls: goto 105  ' cc% loser
705 goto 670
710 if ASC(A$)=27 then cls: goto 105
720 'get end to ei ej
730 for i=si-1 to si+1: for j=sj-1 to sj+1: if i<0 or j<0 or i>cols or j>rows goto 800
765 if grid%(i,j)=14 then gosub 1200: if is% then grid%(i,j)=3:fill=0:v=2:gosub 1000
800 next j, i 
805 di = si:dj=sj
810 for si = 0 to cols:for sj = 0 to rows
820 if grid%(si,sj)<>3 then 880
830 for i=si-1 to si+1: for j=sj-1 to sj+1: if i<0 or j<0 or i>cols or j>rows goto 870
865 if grid%(i,j)=14 then gosub 1200: if is% then grid%(i,j)=10:fill=0:v=3:gosub 1000
870 next j, i 
880 next sj,si

890 rm=0:for i = 0 to cols:forj = 0 to rows
900 if grid%(i,j) <> 3 and grid%(i,j)<>10 then goto 920
910 rm=1:c=0:fill=0:v=6:gosub 1010:gosub 1670
912 c=grid%(i,j):v=(c-3)/7+2:gosub 1010:gosub 1670
915 A$=INKEY$:IF A$="" AND RS%(1,2)=0 AND RS%(2,2)=0 AND RS%(3,2)=0 AND RS%(4,2)=0 THEN GOTO 910 ELSE IF A$<>" " AND ASC(A$)<>13 AND ASC(A$)<>27 AND RS%(1,2)=0 AND RS%(2,2)=0 THEN 920 else ei=i: ej=j: ec=grid%(i,j):GOTO 940
920 next j, i: if rm=0 goto 665 'no moves from that position
930 goto 890
940 grid%(i,j)=CC%:fill=1:v=6-CP%:gosub 1000: if ASC(A$)=27 then cls: goto 105
950 if ec=10 then grid%(di,dj)=14:i=di:j=dj:c=0:fill=1:v=7:gosub 1010: fill=0:v=1:gosub 1000 'jump
960 for i = 0 to cols:forj = 0 to rows: if grid%(i,j) = 3 or grid%(i,j)=10 then grid%(i,j)=14:fill=0:v=1:gosub 1000
965 next j,i
967 si=ei:sj=ej:for i=si-1 to si+1: for j=sj-1 to sj+1: if i<0 or j<0 or i>cols or j>rows goto 969
968 if grid%(i,j)=EC% then gosub 1200: if is% then grid%(i,j)=CC%:fill=1:v=6-CP%:gosub 1000 'capture enemy
969 next j, i 

970 CP%=EP%: EP%=3-EP%: GOTO 665 'NEXT PLAYER
980 gosub 2000
985 restore 4000: GOTO 105
990 color 15, 4, 4: end

1000 c=grid%(i,j): rt=0
1010 if v=0 then 1019
1011 if shape=6 then x=3+i*17: y=20+j*22-(iand1)*11:copy (5,v*25)-(25,v*25+20),1 to (x,y),0,tpset:v=0:return
1012 if shape=3 then x=5+i*26: y=20+j*14: d=((j+i+1)and1)*30: copy (30+d,v*25)-(30+25+d,v*25+24),1 to (x,y),0,tpset:v=0:return
1013 if shape=7 then x=5+i*8: y=10+j*5: d=((j+i+1)and1)*30: copy (120+d,v*25)-(120+8+d,v*25+8),1 to (x,y),0,tpset:v=0:return
1015 if shape=4 then x=5+i*26: y=20+j*26: copy (90,v*25)-(90+25,v*25+24),1 to (x,y),0,tpset:v=0:return
1019 if shape=6 then x=res*1.5+i*res*1.8:if iand1 then y=res*1+j*(res*2):goto 1060 else y=res*2+j*(res*2): goto 1060
1020 if shape=4 then x=res*1.5+i*res*2:y=res*1.5+j*res*2:rt=pi/4:goto1060
1055 if shape=3 then   x=res*1.3+i*res*3.1:y=(1+j)*res*1.7
1057 if i+j+1 and 1 then rt=pi:x=x+res: goto1060 else rt=0:goto1060
1060 color c: angle=2*pi/shape:ox=-1:oy=-1:for m=0 to shape:a=m*angle
1070 sx =cos(a + rt)*((res-1)/cos(angle/2)):sy=sin(a+rt)*((res-1)/cos(angle/2)-1)
1080 ifox=-1andoy=-1then1085 else line (ox, oy)-(x+sx,y+sy)
1085 ox=x+sx:oy=y+sy
1090 next M:if fill=1 then paint(x,y),c
1100 return
1200 ' SUB Check if neibour (si,sj,i,j,shape) to is% (1/0)
1205 is%=0
1210 if shape=3 and ((ABS(sj-j)=1 and (si=i)) or ((si+sj+1 and 1) and sj=j and i-si=1) or ((si+sj and 1) and sj=j and si-i=1)) then is%=2:goto 1299
1215 if shape=4 and ABS(si-i)<=1 and abs(sj-j)<=1 and (si<>i or sj<>j) and (si=i or sj=j) then is%=1:goto 1299
1220 if shape=6 and ABS(si-i)<=1 and abs(sj-j)<=1 and (si<>i or sj<>j) and (si=i or sj=j) then is%=2:goto 1299
1259 if shape=6 and (si and 1) and ABS(si-i)<=1 and abs(sj-j)<=1 and (si<>i or sj<>j) and sj > j then is%=2:goto 1299
1265 if shape=6 and ((si+1 and 1)) and ABS(si-i)<=1 and abs(sj-j)<=1 and (si<>i or sj<>j) and sj < j then is%=2:goto 1299
1299 RETURN 

1590 ' SUB Put_String(a$,x,y,c)
1600 COLOR C:PRESET(X,Y):FOR I=1 TO LEN(A$):B=ASC(MID$(A$,I,1))
1610 '#I &h3A,B
1620 '#I &HCD,&H8D,&H00
1630 NEXT I:RETURN
1670 t=5
1680 'SUB Pause(t)
1690 A=TIME
1700 if ( TIME-A ) < t then goto 1700
1710 RETURN
1720 'SUB RealStrig() return RS%(device,is_pressed=1/is_released=2)
1730 FOR I=0 to 4
1740 A=STRIG(I):If A=0 and RS%(I,1)=-1 THEN RS%(I,2)=1 ELSE RS%(I,2)=0
1750 RS%(I,1)=A
1760 NEXT I
1770 RETURN

2000 a$=inkey$:if a$="" then 2000 else return

4000 data 5,3, 5,4, 5,5, 5,6, 5,7, 7,7, 6,7, 6,6, 7,6, 7,5, 7,4, 7,3
4005 data 9,8, 9,4, 9,5, 9,6, 9,7, 10,5, 10,4, 11,4, 11,5, 11,6, 11,7, 11,8
4010 data 13,1, 13,6, 13,7, 13,5, 13,4
4020 data 15,6, 15,7, 15,5, 15,4, 15,3, 16,4, 16,3, 16,6, 16,7, 17,3, 17,4, 17,5, 17,6, 17,7, 17,8, 17,9, 17,10, 16,10
4030 data 19,6, 19,7, 19,5, 19,4, 19,3, 20,4, 20,3, 20,6, 20,7, 21,4, 21,5, 21,6
4040 data 23,8, 23,4, 23,5, 23,6, 23,7, 24,5, 24,4, 25,4, 25,5, 25,6, 25,7, 25,8