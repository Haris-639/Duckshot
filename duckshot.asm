;LEVEL1-> kill 1 ducks with unlimited bullets and Win
;LEVEL2-> kill 2 ducks with unlimited bullets and Win
;LEVEL3-> kill 3 ducks with 3 bullets and Win



.model small
.stack 100H
.data
	killcount db 0
	bird_color db 12
	bird_color2 db 04
	bird_color3 db 5
	eye_color db 15
	eye_color2 db 15
	eye_color3 db 15
	gain_reward1 db 0
	exittt db 0
;---------------------- tree ----------------------
	
lengthstorer db 0

f1 db "file.txt$", 0
fileinfo dw 0
x_tree_start dw 60
y_tree_start dw 145
x_tree_end dw 80
y_tree_end dw 170

flag db 0
x_tree_start_block dw 50
y_tree_start_block dw 130
x_tree_end_block dw 90
y_tree_end_block dw 145

x_tree_start_block3 dw 60
y_tree_start_block3 dw 120
x_tree_end_block3 dw 80
y_tree_end_block3 dw 130
scoree dw 0,'$'

	h1 dw 300
	h2 dw 320


	mediumm11 dB 'LEVEL : 2' , '$'
	hard11 dB    'LEVEL : 3' , '$'


gamewin db ' !!! YOU WON !!!','$'

	totScore0 db '     SCORE : 0     ','$'
	totScore2 db '     SCORE : 10     ','$'
	totScorelvl2 db '     SCORE : 20     ','$'
	totScore db '     SCORE : 30     ','$'
	totScorer db '     SCORE : 60     ','$'



;---------level---------
easy db '. LEVEL 01','$'
	mediumm db '. LEVEL 02','$'
	hard db '. LEVEL 03','$'

		special_reward_x dw 20
	special_reward_y dw 25
	special_reward_x_end dw 30
	special_reward_y_end dw 35
	sb2 dw 0


	gamebar db  "--------------$"
	grass db "     $"

	;----------------- Printing Line ---------------------
	sk db 10
	temp dw 0
	temp1 dw 0
	temp2 dw 0
	temp3 dw 0
	clr db 0

	;-------------------MENU-----------------------------
	NameStorer db 60 dup (?),'$'
	string1 db 'ENTER YOUR NAME : ','$'
	string2 db 'MALLARD MAYHEM' , '$'
	;--------------------INSTRUCTIONS------------------------
	in1 db '-------------------------------- INSTRUCTIONS ----------------------------------','$'
	ins1 db '---> Welcome To Mallard Mayhem <---','$'
	ins2 db '. Use Arrow keys to move the shooter','$'
	ins3 db '. Use Space key to shoot ','$'

	ins4 db '. Each Bird Hit Is Worth 10 Points ','$'
	ins5 db '. Press Esc To Exit ','$'
	ins6 db '-- Press Enter To Go To Main Menu --','$'
	ins7 db '--------------------------------------------------------------------------------','$'
	
	cursor1 dw 0
	cursor2 dw 0
	score dB 'Score : ' , '$'
	namee dB 'NAME  : ' , '$'
	easy11 dB    'LEVEL : 1' , '$'
	p db 'PAUSED','$'

	;------------------------------------LEVELS-------------------------------
	
	
	easy1 db 'LEVEL 01','$'
	;--------------------------------------GAME WORKING------------------------------------------
	x dw 155
	y dw 30
	x_bird dw 170
	y_bird dw 35
	eyex dw 158
	eyey dw 32

	x2 dw 55
	y2 dw 30
	x_bird2 dw 70
	y_bird2 dw 35
	eyex2 dw 58
	eyey2 dw 32

	x3 dw 100
	y3 dw 40
	x_bird3 dw 115
	y_bird3 dw 45
	eyex3 dw 103
	eyey3 dw 42

	bird_speed dw 400

	
	bar_start dw 150
	bar_end dw 151
	bar_y dw 105
	
	shoot_Start dw 155
	shoot_End dw 160
	
	shoot_Start_left dw 142
	shoot_End_left dw 147

	shoot_start_y dw 98
	shoot_end_y dw 103
	shoot_start_y_below dw 108	
	shoot_end_y_below dw 112


	counter dw 0
	counter2 dw 0
	counter3 dw 0
	initial dw 115
	
	direction dw 3      ;1= right 2=top 3=left 4=bottom
	lives dw 3
	angle_horizontal dw 1 ; 1=right->left 2=left->right
	angle_vertical dw 1   ; 1=top->bottom 2=bottom->top


	direction2 dw 1      ;1= right 2=top 3=left 4=bottom
	angle_horizontal2 dw 1 ; 1=right->left 2=left->right
	angle_vertical2 dw 1   ; 1=top->bottom 2=bottom->top

	direction3 dw 2      ;1= right 2=top 3=left 4=bottom
	angle_horizontal3 dw 1 ; 1=right->left 2=left->right
	angle_vertical3 dw 1   ; 1=top->bottom 2=bottom->top

	
	LEVELS dw 0


.code

jmp main


REINITIALIZE proc

	mov killcount , 0
	mov bird_color , 12
	mov bird_color2 , 04
	mov bird_color3 , 5
	mov eye_color , 15
	mov eye_color2 , 15
	mov eye_color3 , 15
	mov gain_reward1 , 0
	mov x_tree_start , 60
	mov y_tree_start , 145
	mov x_tree_end , 80
	mov y_tree_end , 170
	mov flag , 0
	mov x_tree_start_block , 50
	mov y_tree_start_block , 130
	mov x_tree_end_block , 90
	mov y_tree_end_block , 145
	mov x_tree_start_block3 , 60
	mov y_tree_start_block3 , 120
	mov x_tree_end_block3 , 80
	mov y_tree_end_block3 , 130
	mov scoree , 0
	mov special_reward_x , 20
	mov special_reward_y , 25
	mov special_reward_x_end , 30
	mov special_reward_y_end , 35
	mov sb2 , 0
	mov h1 , 300
	mov h2 , 320
	mov sk , 10
	mov temp , 0
	mov temp1 , 0
	mov temp2 , 0
	mov temp3 , 0
	mov clr , 0
	mov x , 155
	mov y , 30
	mov x_bird , 170
	mov y_bird , 35
	mov eyex , 158
	mov eyey , 32
	mov x2 , 55
	mov y2 , 30
	mov x_bird2 , 70
	mov y_bird2 , 35
	mov eyex2 , 58
	mov eyey2 , 32
	mov x3 , 100
	mov y3 , 40
	mov x_bird3 , 115
	mov y_bird3 , 45
	mov eyex3 , 103
	mov eyey3 , 42
	mov bird_speed , 400
	mov bar_start , 150
	mov bar_end , 151
	mov bar_y , 105
	mov shoot_Start , 155
	mov shoot_End , 160
	mov shoot_Start_left , 142
	mov shoot_End_left , 147
	mov shoot_start_y , 98
	mov shoot_end_y , 103
	mov shoot_start_y_below , 108	
	mov shoot_end_y_below , 112
	mov counter , 0
	mov counter2 , 0
	mov counter3 , 0
	mov initial , 115
	mov direction , 3      ;1= right 2=top 3=left 4=bottom
	mov lives , 3
	mov angle_horizontal , 1 ; 1=right->left 2=left->right
	mov angle_vertical , 1   ; 1=top->bottom 2=bottom->top
	mov direction2 , 1      ;1= right 2=top 3=left 4=bottom
	mov angle_horizontal2 , 1 ; 1=right->left 2=left->right
	mov angle_vertical2 , 1   ; 1=top->bottom 2=bottom->top
	mov direction3 , 2      ;1= right 2=top 3=left 4=bottom
	mov angle_horizontal3 , 1 ; 1=right->left 2=left->right
	mov angle_vertical3 , 1   ; 1=top->bottom 2=bottom->top
	mov LEVELS , 0

ret

REINITIALIZE endp


RemoveHeart proc
	
	mov clr,0
	mov ax,h1
	mov temp1,ax
	mov bx,temp1
	
	mov dx,h2
	mov temp,dx
	
	mov temp2,5
	mov temp3,20
	call line
	ret
RemoveHeart endp

;---------------------------------file Handling

FileHandling proc
	
	;open a file
	mov ah, 3dh
	mov al, 2
	mov dx, offset f1
	int 21h
	

	
	;write to a file
	mov fileinfo, ax
	
	mov cx, 0
	mov dx, 0
	mov ah, 42h
	mov al, 2
	int 21h
	
	
	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof namee-1
	mov dx, offset namee
	int 21h
	
	mov cx, 0
	mov dx, 0
	mov ah, 42h
	mov al, 2
	int 21h
	
	mov ah, 40h
	mov bx, fileinfo
	mov cx, 10
	mov dx, offset NameStorer
	int 21h
	
	mov cx, 0
	mov dx, 0
	mov ah, 42h
	mov al, 2
	int 21h
	
	cmp LEVELS,1
	je call_1_fh
	cmp LEVELS,2
	je call_2_fh
	cmp LEVELS,3
	je call_3_fh
	
call_1_fh:
	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof easy11-1
	mov dx, offset easy11
	int 21h


	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof totScore2-1
	mov dx, offset totScore2
	int 21h

		jmp skip_fh
		
call_2_fh:
	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof mediumm11-1
	mov dx, offset mediumm11
	;add score,48
	int 21h

	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof totScorelvl2-1
	mov dx, offset totScorelvl2
	;add score,48
	int 21h



		jmp skip_fh
		
call_3_fh:
		mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof hard11-1
	mov dx, offset hard11
	add score,48
	int 21h

	cmp scoree,0
	je kill_0

	cmp scoree,10
	je kill_1

	cmp scoree,20
	je kill_2
	cmp scoree,60
	je kill_3
	

	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof totScore-1
	mov dx, offset totScore
	int 21h

jmp skip_fh

	kill_0:
			mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof totScore0-1
	mov dx, offset totScore0
	int 21h
jmp skip_fh

	kill_1:
		mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof totScore2-1
	mov dx, offset totScore2
	int 21h
jmp skip_fh
	kill_2:
	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof totScorelvl2-1
	mov dx, offset totScorelvl2
	int 21h
jmp skip_fh
	kill_3:
	mov ah, 40h
	mov bx, fileinfo
	mov cx, lengthof totScorer-1
	mov dx, offset totScorer
	int 21h

	
	skip_fh:
	


	
	;close a file
	mov ah, 3eh
	mov bx, fileinfo
	int 21h	
	
	ret

FileHandling endp






;--------------------------------------------------- BEEP PROCEDURE --------------------------------------------------------
BEEP PROC 

        mov     al, 182         ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 1000        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 35         ; Pause for duration of note.
pause1:
        mov     cx, 1000
pause2:
        dec     cx
        jne     pause2
        dec     bx
        jne     pause1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 10001100b   ; Reset bits 1 and 0.
        out     61h, al 

RET
BEEP ENDP

;-------------------------------------check boundary for bird 1---------------------------------

RIGHT_BORDER_TOP_TO_BOTTOM PROC
		
		SUB eyex,1
		ADD eyey,1
		SUB x,1
		SUB x_bird,1
		ADD y,1
		ADD y_bird,1

ret
RIGHT_BORDER_TOP_TO_BOTTOM ENDP


RIGHT_BORDER_BOTTOM_TO_TOP PROC
		
		SUB eyex,1
		SUB eyey,1
		SUB x,1
		SUB x_bird,1
		sub y,1
		sub y_bird,1

ret
RIGHT_BORDER_BOTTOM_TO_TOP ENDP

;---------------------------------------- TOP BORDER ---------------------------------------------


TOP_BORDER_RIGHT_TO_LEFT PROC
	
		SUB eyex,1
		ADD eyey,1
		SUB x,1
		SUB x_bird,1
		ADD y,1
		ADD y_bird,1

ret
TOP_BORDER_RIGHT_TO_LEFT ENDP


TOP_BORDER_LEFT_TO_RIGHT PROC
		ADD eyex,1
		ADD eyey,1
		ADD x,1
		ADD x_bird,1
		ADD y,1
		ADD y_bird,1

ret
TOP_BORDER_LEFT_TO_RIGHT ENDP

;---------------------------------------- LEFT BORDER ---------------------------------------------

LEFT_BORDER_TOP_TO_BOTTOM PROC
		ADD eyex,1
		ADD eyey,1
		ADD x,1
		ADD x_bird,1
		ADD y,1
		ADD y_bird,1

ret
LEFT_BORDER_TOP_TO_BOTTOM ENDP


LEFT_BORDER_BOTTOM_TO_TOP PROC
		ADD eyex,1
		SUB eyey,1
		ADD x,1
		ADD x_bird,1
		sub y,1
		sub y_bird,1

ret
LEFT_BORDER_BOTTOM_TO_TOP ENDP


;---------------------------------------- BOTTOM BORDER ---------------------------------------------



BOTTOM_BORDER_RIGHT_TO_LEFT PROC
		ADD eyex,1
		SUB eyey,1
		ADD x,1
		ADD x_bird,1
		SUB y,1
		SUB y_bird,1
ret
BOTTOM_BORDER_RIGHT_TO_LEFT ENDP


BOTTOM_BORDER_LEFT_TO_RIGHT PROC
		SUB eyex,1
		SUB eyey,1
		SUB x,1
		SUB x_bird,1
		SUB y,1
		SUB y_bird,1
ret
BOTTOM_BORDER_LEFT_TO_RIGHT ENDP


;-------------------------------------check boundary for bird 2---------------------------------
RIGHT_BORDER_TOP_TO_BOTTOM2 PROC
		SUB x2,1
		SUB x_bird2,1
		ADD y2,1
		ADD y_bird2,1
		SUB eyex2,1
		ADD eyey2,1
ret
RIGHT_BORDER_TOP_TO_BOTTOM2 ENDP


RIGHT_BORDER_BOTTOM_TO_TOP2 PROC


		SUB x2,1
		SUB x_bird2,1
		sub y2,1
		sub y_bird2,1
		SUB eyex2,1
		SUB eyey2,1
ret
RIGHT_BORDER_BOTTOM_TO_TOP2 ENDP

;---------------------------------------- TOP BORDER ---------------------------------------------


TOP_BORDER_RIGHT_TO_LEFT2 PROC

		SUB x2,1
		SUB x_bird2,1
		ADD y2,1
		ADD y_bird2,1
				SUB eyex2,1
		ADD eyey2,1
ret
TOP_BORDER_RIGHT_TO_LEFT2 ENDP


TOP_BORDER_LEFT_TO_RIGHT2 PROC
		ADD x2,1
		ADD x_bird2,1
		ADD y2,1
		ADD y_bird2,1
				ADD eyex2,1
		ADD eyey2,1
ret
TOP_BORDER_LEFT_TO_RIGHT2 ENDP

;---------------------------------------- LEFT BORDER ---------------------------------------------

LEFT_BORDER_TOP_TO_BOTTOM2 PROC

		ADD x2,1
		ADD x_bird2,1
		ADD y2,1
		ADD y_bird2,1
				ADD eyex2,1
		ADD eyey2,1
ret
LEFT_BORDER_TOP_TO_BOTTOM2 ENDP


LEFT_BORDER_BOTTOM_TO_TOP2 PROC


		ADD x2,1
		ADD x_bird2,1
		sub y2,1
		sub y_bird2,1
				ADD eyex2,1
		SUB eyey2,1
ret
LEFT_BORDER_BOTTOM_TO_TOP2 ENDP


;---------------------------------------- BOTTOM BORDER ---------------------------------------------



BOTTOM_BORDER_RIGHT_TO_LEFT2 PROC

		ADD x2,1
		ADD x_bird2,1
		SUB y2,1
		SUB y_bird2,1
				ADD eyex2,1
		SUB eyey2,1
ret
BOTTOM_BORDER_RIGHT_TO_LEFT2 ENDP


BOTTOM_BORDER_LEFT_TO_RIGHT2 PROC
		

		SUB eyex2,1
		SUB eyey2,1
		SUB x2,1
		SUB x_bird2,1
		SUB y2,1
		SUB y_bird2,1
ret
BOTTOM_BORDER_LEFT_TO_RIGHT2 ENDP


;-------------------------------------check boundary for bird 3---------------------------------

RIGHT_BORDER_TOP_TO_BOTTOM3 PROC
		
		SUB x3,1
		SUB x_bird3,1
		ADD y3,1
		ADD y_bird3,1
		SUB eyex3,1
		ADD eyey3,1

ret
RIGHT_BORDER_TOP_TO_BOTTOM3 ENDP


RIGHT_BORDER_BOTTOM_TO_TOP3 PROC
		
		SUB x3,1
		SUB x_bird3,1
		sub y3,1
		sub y_bird3,1
				SUB eyex3,1
		SUB eyey3,1

ret
RIGHT_BORDER_BOTTOM_TO_TOP3 ENDP

;---------------------------------------- TOP BORDER ---------------------------------------------


TOP_BORDER_RIGHT_TO_LEFT3 PROC
	
		SUB x3,1
		SUB x_bird3,1
		ADD y3,1
		ADD y_bird3,1
				SUB eyex3,1
		ADD eyey3,1

ret
TOP_BORDER_RIGHT_TO_LEFT3 ENDP


TOP_BORDER_LEFT_TO_RIGHT3 PROC
	
		ADD x3,1
		ADD x_bird3,1
		ADD y3,1
		ADD y_bird3,1
		ADD eyex3,1
		ADD eyey3,1
ret
TOP_BORDER_LEFT_TO_RIGHT3 ENDP

;---------------------------------------- LEFT BORDER ---------------------------------------------

LEFT_BORDER_TOP_TO_BOTTOM3 PROC
	
		ADD x3,1
		ADD x_bird3,1
		ADD y3,1
		ADD y_bird3,1
				ADD eyex3,1
		ADD eyey3,1

ret
LEFT_BORDER_TOP_TO_BOTTOM3 ENDP


LEFT_BORDER_BOTTOM_TO_TOP3 PROC
		
		ADD x3,1
		ADD x_bird3,1
		sub y3,1
		sub y_bird3,1
				ADD eyex3,1
		SUB eyey3,1

ret
LEFT_BORDER_BOTTOM_TO_TOP3 ENDP


;---------------------------------------- BOTTOM BORDER ---------------------------------------------



BOTTOM_BORDER_RIGHT_TO_LEFT3 PROC
	
		ADD x3,1
		ADD x_bird3,1
		SUB y3,1
		SUB y_bird3,1
		ADD eyex3,1
		SUB eyey3,1
ret
BOTTOM_BORDER_RIGHT_TO_LEFT3 ENDP


BOTTOM_BORDER_LEFT_TO_RIGHT3 PROC
		
		SUB x3,1
		SUB x_bird3,1
		SUB y3,1
		SUB y_bird3,1
		SUB eyex3,1
		SUB eyey3,1
ret
BOTTOM_BORDER_LEFT_TO_RIGHT3 ENDP




Instructions proc
	mov ah, 0
	mov al, 13h  
	int 10h
	;----------------------------------------------------
	
	mov ah, 00h
	mov al,03
	int 10h
	mov ah,09h
	mov bh, 00h
	mov al, 20h
	mov cx,800h
	mov bl, 0fh  
	int 10h
	;--------------------------------------------------------------
	
	mov ah,02h
	mov bx,0
	mov dh,3
	mov dl,0
	int 10h
	lea dx,in1
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,7
	mov dl,21
	int 10h
	lea dx,ins1
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,10
	mov dl,15
	int 10h
	lea dx,ins2
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,12
	mov dl,15
	int 10h
	lea dx,ins3
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,14
	mov dl,15
	int 10h
	lea dx,ins4
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,16
	mov dl,15
	int 10h
	lea dx,ins5
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,21
	mov dl,15
	int 10h
	lea dx,ins6
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,24
	mov dl,0
	int 10h
	lea dx,ins7
	mov ah,09h
	int 21h
	ret
Instructions endp



line proc

	mov dx, temp2 ; y start
	L1_line:
		mov cx, bx   
	L2_line:
		mov al, clr
		mov ah, 0ch
		int 10h
		inc cx
		cmp cx,temp  
		jne L2_line
		inc dx
		cmp dx,temp3   
		jne L1_line
		ret
line endp

printname macro xaxis, yaxis, letter, color                 
   push dx 
   push ax 
   push cx
   push bx

MOV DH, xaxis		
MOV DL, yaxis		
MOV AH, 02H
INT 10H
MOV AL, letter    
MOV BL, color
MOV CX, 1
MOV AH, 09H
INT 10H
   pop bx 
   pop cx
   pop ax
   pop dx
endm




FirstScreen proc
    mov ah, 00h
    mov al, 13
    int 10h

    ;------------------------------------------------------------------------------


mov ah, 06h
int 10h

printname 5, 7, 'M', 3
printname 5, 9, 'A', 3
printname 5, 11, 'L', 3
printname 5, 13, 'L', 3
printname 5, 15, 'A', 3
printname 5, 17, 'R', 3
printname 5, 19, 'D', 3

mov al, 7
mov cx, 27
l1D:
printname 7, al, '_', 6
inc al
loop l1D

printname 9, 22, 'M', 3
printname 9, 24, 'A', 3
printname 9, 26, 'Y', 3
printname 9, 28, 'H', 3
printname 9, 30, 'E', 3
printname 9, 32, 'M', 3




printname 17, 7, 'E', 6
printname 17, 8, 'n', 6
printname 17, 9, 't', 6
printname 17, 10, 'e', 6
printname 17, 11, 'r', 6

printname 17, 13, 'Y', 6
printname 17, 14, 'o', 6
printname 17, 15, 'u', 6
printname 17, 16, 'r', 6

printname 17, 18, 'N', 6
printname 17, 19, 'a', 6
printname 17, 20, 'm', 6
printname 17, 21, 'e', 6
printname 17, 23, ':', 6
printname 17, 24, ' ', 6

    ;-------------------- NAME INPUT ---------------------------
    mov si, 0
    mov si, offset NameStorer
l1_firstscreen:
    mov cx, 2
    mov ah, 01h        
    int 21h
    cmp al, 0dh        
    je helper
    mov [si], al
    inc si
    jmp l1_firstscreen


helper:
    mov si, 0
    ret
FirstScreen endp

create_tree proc


mov cx,x_tree_start
mov dx,y_tree_start

L1_createtree:

MOV CX,x_tree_start

	L2_tree:

	MOV AL, 6
	MOV AH, 0CH
	INT 10H

	INC CX
	CMP CX,x_tree_end
	JNE L2_tree

	INC DX

	CMP DX,y_tree_end
JNE L1_createtree



		
ret

create_tree endp

create_tree_block proc

inc counter
mov cx,x_tree_start_block
mov dx,y_tree_start_block


L1_createtree_block:

MOV CX,x_tree_start_block

	L2_tree_block:

	MOV AL, 2
	MOV AH, 0CH
	INT 10H

	INC CX
	CMP CX,x_tree_end_block
	JNE L2_tree_block

	INC DX

	CMP DX,y_tree_end_block
JNE L1_createtree_block
		
ret

create_tree_block endp



create_tree_block3 proc

inc counter
mov cx,x_tree_start_block3
mov dx,y_tree_start_block3


L1_createtree_block3:

MOV CX,x_tree_start_block3

	L2_tree_block3:

	MOV AL, 2
	MOV AH, 0CH
	INT 10H

	INC CX
	CMP CX,x_tree_end_block3
	JNE L2_tree_block3

	INC DX

	CMP DX,y_tree_end_block3
JNE L1_createtree_block3
		
ret

create_tree_block3 endp

Pausee proc
	
	mov ah,02h
	mov bx,0
	mov dh,15
	mov dl,15
	int 10h
	
	lea dx,p  
	mov ah,09h
	int 21h
	ret
Pausee endp

newLine proc
	push ax
	push dx
        mov ah, 02h
        mov dl, 0Ah
        int 21h
	pop dx
	pop ax
        ret
    newLine endp



Cursor proc
	mov ah, 0
	mov al, 13h 
	int 10h
	;----------------------------------------------------
	mov ah, 00h
	int 10h
	mov ah,09h
	mov bh, 00h
	mov al, 20h
	mov cx,800h
	mov bl, 40h  
	int 10h
	;--------------------------------------------------------------
	mov clr,10
	mov temp1,100
	mov bx,temp1
	mov temp,110
	mov dx,cursor1
	mov temp2,dx   
	mov ax,cursor2
	mov temp3,ax
	call line

	printname 3, 10, 'N', 6
	printname 3, 11, 'A', 6
	printname 3, 12, 'M', 6
	printname 3, 13, 'E', 6
	printname 3, 15, ':', 6
	
	

	mov ah,02h
	mov bx,0
	mov dh,3
	mov dl,23
	int 10h
	lea dx,NameStorer
	mov ah,09h
	int 21h
	

	
	printname 10, 17, 'S', 3
	printname 10, 18, 'T', 3
	printname 10, 19, 'A', 3
	printname 10, 20, 'R', 3
	printname 10, 21, 'T', 3
	printname 10, 23, 'G', 3
	printname 10, 24, 'A', 3
	printname 10, 25, 'M', 3
	printname 10, 26, 'E', 3
	


	printname 12, 17, 'I', 3
	printname 12, 18, 'N', 3
	printname 12, 19, 'S', 3
	printname 12, 20, 'T', 3
	printname 12, 21, 'R', 3
	printname 12, 22, 'U', 3
	printname 12, 23, 'C', 3
	printname 12, 24, 'T', 3
	printname 12, 25, 'I', 3
	printname 12, 26, 'O', 3
	printname 12, 27, 'N', 3


	printname 14, 17, 'E', 3
	printname 14, 18, 'X', 3
	printname 14, 19, 'I', 3
	printname 14, 20, 'T', 3
	

	ret
Cursor endp

Difficulty proc
	mov ah, 0
	mov al, 13h  ; Display 
	int 10h
	;----------------------------------------------------
	mov ah, 00h
	int 10h
	mov ah,09h
	mov bh, 00h
	mov al, 20h
	mov cx,800h
	mov bl, 40h  ; This is Blue & White.
	int 10h
	;--------------------------------------------------------------
	mov clr,10
	mov temp1,100
	mov bx,temp1
	mov temp,110
	mov dx,cursor1
	mov temp2,dx   ;cursor1
	mov ax,cursor2
	mov temp3,ax	;cursor2
	call line
	

printname 3, 7, 'M', 3
printname 3, 9, 'A', 3
printname 3, 11, 'L', 3
printname 3, 13, 'L', 3
printname 3, 15, 'A', 3
printname 3, 17, 'R', 3
printname 3, 19, 'D', 3

mov al, 5
mov cx, 30
l1D:
printname 5, al, '_', 6
inc al
loop l1D

printname 7, 22, 'M', 3
printname 7, 24, 'A', 3
printname 7, 26, 'Y', 3
printname 7, 28, 'H', 3
printname 7, 30, 'E', 3
printname 7, 32, 'M', 3
	
	
	printname 10, 17, 'L', 6
	printname 10, 18, 'E', 6
	printname 10, 19, 'V', 6
	printname 10, 20, 'E', 6
	printname 10, 21, 'L', 6
	printname 10, 23, '1', 6

	printname 12, 17, 'L', 6
	printname 12, 18, 'E', 6
	printname 12, 19, 'V', 6
	printname 12, 20, 'E', 6
	printname 12, 21, 'L', 6
	printname 12, 23, '2', 6

	printname 14, 17, 'L', 6
	printname 14, 18, 'E', 6
	printname 14, 19, 'V', 6
	printname 14, 20, 'E', 6
	printname 14, 21, 'L', 6
	printname 14, 23, '3', 6
	ret
Difficulty endp



reward proc
mov ax,special_reward_x
cmp bar_start,ax
ja check2r
jmp noreward

check2r:
mov ax,special_reward_x_end
cmp bar_end,ax
jb check3r
jmp noreward

check3r:
mov ax,special_reward_y
cmp bar_y,ax
ja check4r
jmp noreward

check4r:
mov ax,special_reward_y_end
cmp bar_y,ax
jb gain
jmp noreward

gain:

add scoree,30
call UpdateScore
mov gain_reward1,1

noreward:

ret
reward endp



kill_bird_1_check proc
mov ax,x
cmp bar_start,ax
ja check2
jmp nokill1

check2:
mov ax,x_bird
cmp bar_end,ax
jb check3
jmp nokill1

check3:
mov ax,y
cmp bar_y,ax
ja check4
jmp nokill1

check4:
mov ax,y_bird
cmp bar_y,ax
jb kill
jmp nokill1

kill:

mov flag,1
add scoree,10
call UpdateScore
mov bird_color,0
mov eye_color,0
inc killcount
jmp enddd1
nokill1:


enddd1:
ret
kill_bird_1_check endp


kill_bird_2_check proc

mov ax,x2
cmp bar_start,ax
ja check_2
jmp nokill

check_2:
mov ax,x_bird2
cmp bar_end,ax
jb check_3
jmp nokill

check_3:
mov ax,y2
cmp bar_y,ax
ja check_4
jmp nokill

check_4:
mov ax,y_bird2
cmp bar_y,ax
jb kill2

jmp nokill
kill2:
mov flag,1
add scoree,10
call UpdateScore
mov bird_color2,0
mov eye_color2,0
inc killcount
jmp enddd
nokill:

enddd:
ret
kill_bird_2_check endp

kill_bird_3_check proc
mov ax,x3
cmp bar_start,ax
ja check2_
jmp nokill3

check2_:
mov ax,x_bird3
cmp bar_end,ax
jb check3_
jmp nokill3

check3_:
mov ax,y3
cmp bar_y,ax
ja check4_
jmp nokill3

check4_:
mov ax,y_bird3
cmp bar_y,ax
jb kill3
jmp nokill3

kill3:
mov flag,1
add scoree,10
call UpdateScore
mov bird_color3,0
mov eye_color3,0
inc killcount
jmp enddd3
nokill3:

enddd3:
ret
kill_bird_3_check endp



make_shooter proc 
	
		mov cx,bar_start
		mov dx,bar_y
		mov si,0
		bar1_mb:
			mov ah,0ch
			mov al,6
			int 10h
			inc cx 
			cmp cx,bar_end
		jne bar1_mb


		mov cx,shoot_Start
		mov dx,bar_y
		mov si,0
		bar1_mm:
			mov ah,0ch
			mov al,6
			int 10h
			inc cx 
			cmp cx,shoot_End
		jne bar1_mm


	mov cx,shoot_Start_left
		mov dx,dx
		mov si,0
		bar1__:
			mov ah,0ch
			mov al,6
			int 10h
			inc cx 
			cmp cx,shoot_End_left
		jne bar1__


		mov cx,bar_start
		mov dx,shoot_start_y
		mov si,0
		bar11:
			mov ah,0ch
			mov al,6
			int 10h
			inc dx 
			cmp dx,shoot_End_y
		jne bar11

		mov cx,bar_start
		mov dx,shoot_start_y_below
		mov si,0
		barr:
			mov ah,0ch
			mov al,6
			int 10h
			inc dx 
			cmp dx,shoot_End_y_below
		jne barr


		ret
	make_shooter endp


	remove_shooter proc 
	

		
		mov cx,bar_start
		mov dx,bar_y
		mov si,0
		bar1_rb:
			mov ah,0ch
			mov al,0
			int 10h
			inc cx 
			cmp cx,bar_end
		jne bar1_rb


		mov cx,shoot_Start
		mov dx,bar_y
		mov si,0
		bar1_m:
			mov ah,0ch
			mov al,0
			int 10h
			inc cx 
			cmp cx,shoot_End
		jne bar1_m


	mov cx,shoot_Start_left
		mov dx,dx
		mov si,0
		bar1_:
			mov ah,0ch
			mov al,0
			int 10h
			inc cx 
			cmp cx,shoot_End_left
		jne bar1_


		mov cx,bar_start
		mov dx,shoot_start_y
		mov si,0
		bar1:
			mov ah,0ch
			mov al,0
			int 10h
			inc dx 
			cmp dx,shoot_End_y
		jne bar1

		mov cx,bar_start
		mov dx,shoot_start_y_below
		mov si,0
		barrr:
			mov ah,0ch
			mov al,0
			int 10h
			inc dx 
			cmp dx,shoot_End_y_below
		jne barrr


		ret
	remove_shooter endp


	move_shooter proc

	
up:
    mov ah, 00h
    int 16h

    cmp ah, 4dh  ; Right arrow
    je right

    cmp ah, 4bh  ; Left arrow
    je left

    cmp ah, 48h  ; Up arrow
    je move_up

	cmp ah, 50h  ; Down arrow (80h in hexadecimal)
	je move_down

	cmp al,20h
	je kill_bird

    cmp al, 70h
    je pauseee

    cmp al, 27
    je REINIT
	

    jmp up

	REINIT:
	call REINITIALIZE
	mov exittt,1
	jmp exit_mb

move_up:
    cmp bar_y, 30  ; Check if shooter is at the top boundary
    ja up_move
    jmp exit_mb

up_move:
    call remove_shooter
    dec bar_y
    dec shoot_start_y
    dec shoot_end_y
    dec shoot_start_y_below
    dec shoot_end_y_below
    call make_shooter
	call remove_shooter
    dec bar_y
    dec shoot_start_y
    dec shoot_end_y
    dec shoot_start_y_below
    dec shoot_end_y_below
    call make_shooter
	call remove_shooter
    dec bar_y
    dec shoot_start_y
    dec shoot_end_y
    dec shoot_start_y_below
    dec shoot_end_y_below
    call make_shooter
    jmp exit_mb

move_down:
    cmp bar_y, 110  ; Check if shooter is at the bottom boundary
    jb down_move
    jmp exit_mb

down_move:
    call remove_shooter
    inc bar_y
    inc shoot_start_y
    inc shoot_end_y
    inc shoot_start_y_below
    inc shoot_end_y_below
    call make_shooter
	call remove_shooter
    inc bar_y
    inc shoot_start_y
    inc shoot_end_y
    inc shoot_start_y_below
    inc shoot_end_y_below
    call make_shooter
	call remove_shooter
    inc bar_y
    inc shoot_start_y
    inc shoot_end_y
    inc shoot_start_y_below
    inc shoot_end_y_below
    call make_shooter
    jmp exit_mb



right:
    cmp bar_end, 316
    ja exit_mb
    call remove_shooter
    inc bar_start
    inc bar_end
    inc shoot_Start
    inc shoot_End
    inc shoot_Start_left
    inc shoot_End_left
    call make_shooter
    call remove_shooter
    inc bar_start
    inc bar_end
    inc shoot_Start
    inc shoot_End
    inc shoot_Start_left
    inc shoot_End_left
    call make_shooter
    call remove_shooter
    inc bar_start
    inc bar_end
    inc shoot_Start
    inc shoot_End
    inc shoot_Start_left
    inc shoot_End_left
    call make_shooter
    jmp exit_mb

left:
    cmp bar_start, 4
    jb exit_mb
    call remove_shooter
    dec bar_start
    dec bar_end
    dec shoot_Start
    dec shoot_End
    dec shoot_Start_left
    dec shoot_End_left
    call make_shooter
    call remove_shooter
    dec bar_start
    dec bar_end
    dec shoot_Start
    dec shoot_End
    dec shoot_Start_left
    dec shoot_End_left
    call make_shooter
    call remove_shooter
    dec bar_start
    dec bar_end
    dec shoot_Start
    dec shoot_End
    dec shoot_Start_left
    dec shoot_End_left
    call make_shooter
    jmp exit_mb


;----------------------kill_bird-----------------------


kill_bird:
call BEEP

call kill_bird_1_check
call kill_bird_2_check
call kill_bird_3_check

cmp flag,1
je exit_mb

dec lives
call RemoveHeart
SUB h1,20
sub h2,20
jmp exit_mb

pauseee:

call PAUSEE

play:
    mov ah, 00h
    int 16h

    mov clr, 0
    mov temp1, 120
    mov bx, temp1
    mov temp, 190
    mov temp2, 110
    mov temp3, 130
    call line
    je exit_mb

    jmp play

exit_mb:
mov flag,0
    ret
move_shooter endp

second_tree proc


	add x_tree_start,180
	add x_tree_end,180
	add x_tree_start_block,180
	add x_tree_end_block,180
	add x_tree_start_block3,180
	add x_tree_end_block3,180
	

	call create_tree	
	call create_tree_block
	call create_tree_block3

	sub x_tree_start,180
	sub x_tree_end,180
	sub x_tree_start_block,180
	sub x_tree_end_block,180
	sub x_tree_start_block3,180
	sub x_tree_end_block3,180



ret 
second_tree endp

level proc
	
	mov ah, 0
	mov al, 13h
	int 10h	

	cmp LEVELS,3
	jne noheart
	;------------------------------------ HEARTS ------------------------------  
	mov ah,02h
	mov bx,0
	mov dh,1
	mov dl,154
	int 10h
	
	mov dl,3
	mov ah,2
	int 21h
	
	mov dl, ' '
    mov ah, 2
    int 21h
	
	mov dl,3
	mov ah,2
	int 21h
	
	mov dl, ' '
    mov ah, 2
    int 21h
	
	mov dl,3
	mov ah,2
	int 21h

	noheart:
	
	;--------------------------- DISPLAYING LINE ---------------------------
	mov clr,11
	mov si,0
	mov temp1,00
	mov bx,temp1
	mov temp,320
	mov temp2,22
	mov temp3,24
	call line
	;===================== SCORE-------------------------
	
	mov ah,02h
	mov bx,0
	mov dh,1
	mov dl,2
	int 10h
	lea dx,score
	mov ah,09h
	int 21h



	call create_tree	
	call create_tree_block
	call create_tree_block3

	call second_tree 




		;------------------------------------ Grass Displayer--------------------------------------
	mov ah, 02h
    mov bx, 0
    mov dh, 0        ; Row position
    mov dl, 170      ; Initial column position
    int 10h

    mov cx, 10100    ; Number of columns for the line

borderleftt:
    mov al, 02       
    mov ah, 0Ch      
    int 10h

    loop borderleftt


	mov ah, 02h
    mov bx, 0
    mov dh, 0        
    mov dl, 180      
    int 10h

    mov cx, 20  


;---------------
	
	;------------------------------------ NAME DISPLAYER--------------------------------------
	mov ah,02h
	mov bx,0
	mov dh,1
	mov dl,16
	int 10h
	
		cmp LEVELS,1
		je call_1
		cmp LEVELS,2
		je call_2
		cmp LEVELS,3
		je call_3
		
		call_1:
		lea dx, easy1
		mov ah,09h
		int 21h
		jmp skip_level
		
		call_2:
		lea dx, MEDIUMM11
		mov ah,09h
		int 21h
		jmp skip_level
		
		call_3:
		lea dx, HARD11
		mov ah,09h
		int 21h

		
		
		
	skip_level:
	ret
level endp
	

UpdateScore proc
	push ax
	push bx
	push cx
	push dx

	mov cx,0
	mov ax,scoree
	lll1:
	mov bx,10
	mov dx,0
	div bx
	push dx
	inc cx
	cmp ax,0
	jne lll1
	
	mov ah,02h
	mov bx,0
	mov dh,1
	mov dl,9
	int 10h
	
	lll2:
	pop dx
	mov ah,2
	add dl,'0'
	int 21h
	loop lll2
	
	pop dx
	pop cx
	pop bx
	pop ax
	ret
UpdateScore endp

BOUNDARY proc

cmp x,305
je right_border_touch

cmp y,25
je top_border_touch

cmp x,0
je left_border_touch

cmp y,100
je bottom_border_touch


cmp direction,1         
je right_border_touch

cmp direction,2
je top_border_touch

cmp direction,3
je left_border_touch

cmp direction,4
je bottom_border_touch




;----------------------------- right border touch ------------------------------------

		right_border_touch:
			
		
			mov angle_vertical,1
			mov direction,1
			
			
			cmp angle_horizontal,1
			je right_bottom_to_top
			
			cmp angle_horizontal,2
			je right_top_to_bottom
			
			jmp DONE_b
			
			right_bottom_to_top:
			call RIGHT_BORDER_BOTTOM_TO_TOP
			JMP DONE_b
			
			right_top_to_bottom:
			call RIGHT_BORDER_TOP_TO_BOTTOM
			JMP DONE_b
		
			
			
			
;----------------------------- top border touch ------------------------------------

		top_border_touch:
			
			
			mov angle_horizontal,2
			mov direction,2
			
			cmp angle_vertical,1
			je top_right_to_left
		
			cmp angle_vertical,2
			je top_left_to_right
			
			top_right_to_left:
			call TOP_BORDER_RIGHT_TO_LEFT
			JMP DONE_b
			
			top_left_to_right:
			call TOP_BORDER_LEFT_TO_RIGHT
			JMP DONE_b
			
			
			jmp DONE_b
			

;----------------------------- left border touch ------------------------------------

		left_border_touch:
		
	
			mov angle_vertical,2
			mov direction,3
			
			cmp angle_horizontal,1
			je left_bottom_to_top
			
			cmp angle_horizontal,2
			je left_top_to_bottom
			
			jmp DONE_b
			
			left_bottom_to_top:
			call LEFT_BORDER_BOTTOM_TO_TOP
			JMP DONE_b
			
			left_top_to_bottom:
			call LEFT_BORDER_TOP_TO_BOTTOM
			JMP DONE_b
			
;----------------------------- bottom border touch ------------------------------------

		bottom_border_touch:
		
		
			
			mov angle_horizontal,2
			mov direction,4
			
			cmp angle_vertical,2
			je bottom_right_to_left
		
			cmp angle_vertical,1
			je bottom_left_to_right
			
			bottom_right_to_left:
			call BOTTOM_BORDER_RIGHT_TO_LEFT
			JMP DONE_b
			
			bottom_left_to_right:
			call BOTTOM_BORDER_LEFT_TO_RIGHT
			JMP DONE_b
			
			
			jmp DONE_b
			;------------------------------------------------------------------------
			


DONE_b:

exit_boundary:

ret
BOUNDARY endp


BOUNDARY2 proc

cmp x2,305
je right_border_touch2

cmp y2,25
je top_border_touch2

cmp x2,0
je left_border_touch2

cmp y2,100
je bottom_border_touch2


cmp direction2,1         
je right_border_touch2

cmp direction2,2
je top_border_touch2

cmp direction2,3
je left_border_touch2

cmp direction2,4
je bottom_border_touch2




;----------------------------- right border touch ------------------------------------

		right_border_touch2:
			
		
			mov angle_vertical2,1
			mov direction2,1
			
			
			cmp angle_horizontal2,1
			je right_bottom_to_top2
			
			cmp angle_horizontal2,2
			je right_top_to_bottom2
			
			jmp DONE_b2
			
			right_bottom_to_top2:
			call RIGHT_BORDER_BOTTOM_TO_TOP2
			JMP DONE_b2
			
			right_top_to_bottom2:
			call RIGHT_BORDER_TOP_TO_BOTTOM2
			JMP DONE_b2
		
			
			
			
;----------------------------- top border touch ------------------------------------

		top_border_touch2:
			
			
			mov angle_horizontal2,2
			mov direction2,2
			
			cmp angle_vertical2,1
			je top_right_to_left2
		
			cmp angle_vertical2,2
			je top_left_to_right2
			
			top_right_to_left2:
			call TOP_BORDER_RIGHT_TO_LEFT2
			JMP DONE_b2
			
			top_left_to_right2:
			call TOP_BORDER_LEFT_TO_RIGHT2
			JMP DONE_b2
			
			
			jmp DONE_b2
			

;----------------------------- left border touch ------------------------------------

		left_border_touch2:
		
	
			mov angle_vertical2,2
			mov direction2,3
			
			cmp angle_horizontal2,1
			je left_bottom_to_top2
			
			cmp angle_horizontal2,2
			je left_top_to_bottom2
			
			jmp DONE_b2
			
			left_bottom_to_top2:
			call LEFT_BORDER_BOTTOM_TO_TOP2
			JMP DONE_b2
			
			left_top_to_bottom2:
			call LEFT_BORDER_TOP_TO_BOTTOM2
			JMP DONE_b2
			
;----------------------------- bottom border touch ------------------------------------

		bottom_border_touch2:
		
		
			
			mov angle_horizontal2,2
			mov direction2,4
			
			cmp angle_vertical2,2
			je bottom_right_to_left2
		
			cmp angle_vertical2,1
			je bottom_left_to_right2
			
			bottom_right_to_left2:
			call BOTTOM_BORDER_RIGHT_TO_LEFT2
			JMP DONE_b2
			
			bottom_left_to_right2:
			call BOTTOM_BORDER_LEFT_TO_RIGHT2
			JMP DONE_b2
			
			
			jmp DONE_b2
			;------------------------------------------------------------------------
			


DONE_b2:

exit_boundary2:

ret
BOUNDARY2 endp


BOUNDARY3 proc

cmp x3,305
je right_border_touch3

cmp y3,25
je top_border_touch3

cmp x3,0
je left_border_touch3

cmp y3,100
je bottom_border_touch3


cmp direction3,1         
je right_border_touch3

cmp direction3,2
je top_border_touch3

cmp direction3,3
je left_border_touch3

cmp direction3,4
je bottom_border_touch3




;----------------------------- right border touch ------------------------------------

		right_border_touch3:
			
		
			mov angle_vertical3,1
			mov direction3,1
			
			
			cmp angle_horizontal3,1
			je right_bottom_to_top3
			
			cmp angle_horizontal3,2
			je right_top_to_bottom3
			
			jmp DONE_b3
			
			right_bottom_to_top3:
			call RIGHT_BORDER_BOTTOM_TO_TOP3
			JMP DONE_b3
			
			right_top_to_bottom3:
			call RIGHT_BORDER_TOP_TO_BOTTOM3
			JMP DONE_b3
		
			
			
			
;----------------------------- top border touch ------------------------------------

		top_border_touch3:
			
			
			mov angle_horizontal3,2
			mov direction3,2
			
			cmp angle_vertical3,1
			je top_right_to_left3
		
			cmp angle_vertical3,2
			je top_left_to_right3
			
			top_right_to_left3:
			call TOP_BORDER_RIGHT_TO_LEFT3
			JMP DONE_b3
			
			top_left_to_right3:
			call TOP_BORDER_LEFT_TO_RIGHT3
			JMP DONE_b3
			
			
			jmp DONE_b3
			

;----------------------------- left border touch ------------------------------------

		left_border_touch3:
		
	
			mov angle_vertical3,2
			mov direction3,3
			
			cmp angle_horizontal3,1
			je left_bottom_to_top3
			
			cmp angle_horizontal3,2
			je left_top_to_bottom3
			
			jmp DONE_b3
			
			left_bottom_to_top3:
			call LEFT_BORDER_BOTTOM_TO_TOP3
			JMP DONE_b3
			
			left_top_to_bottom3:
			call LEFT_BORDER_TOP_TO_BOTTOM3
			JMP DONE_b3
			
;----------------------------- bottom border touch ------------------------------------

		bottom_border_touch3:
		
		
			
			mov angle_horizontal3,2
			mov direction3,4
			
			cmp angle_vertical3,2
			je bottom_right_to_left3
		
			cmp angle_vertical3,1
			je bottom_left_to_right3
			
			bottom_right_to_left3:
			call BOTTOM_BORDER_RIGHT_TO_LEFT3
			JMP DONE_b3
			
			bottom_left_to_right3:
			call BOTTOM_BORDER_LEFT_TO_RIGHT3
			JMP DONE_b3
			
			
			jmp DONE_b3
			;------------------------------------------------------------------------
			


DONE_b3:

exit_boundary3:

ret
BOUNDARY3 endp



create_bird proc

inc counter
mov cx,x
mov dx,y


L1_createball:

MOV CX,x

	LL:


	cmp cx,eyex
	jne noeye

cmp dx,eyey
jne noeye

	MOV AL, eye_color
	MOV AH, 0CH
	INT 10H
	jmp printed

	noeye:
	MOV AL, bird_color
	MOV AH, 0CH
	INT 10H

printed:

	INC CX
	CMP CX,x_bird
	JNE LL

	INC DX

	CMP DX,y_bird
JNE L1_createball
		mov ax,bird_speed
		cmp counter,ax
		jne skip
		call destroy_bird
		mov counter,0
		CALL BOUNDARY
		
		
	skip:
ret

create_bird endp

create_bird2 proc

inc counter2
mov cx,x2
mov dx,y2


L1_createball2:

MOV CX,x2

	LL2b2:

	cmp cx,eyex2
	jne noeye2

cmp dx,eyey2
jne noeye2

	MOV AL, eye_color2
	MOV AH, 0CH
	INT 10H
	jmp printed2

	noeye2:
	MOV AL, bird_color2
	MOV AH, 0CH
	INT 10H

printed2:


	INC CX
	CMP CX,x_bird2
	JNE LL2b2

	INC DX

	CMP DX,y_bird2
JNE L1_createball2
		mov ax,bird_speed
		cmp counter2,ax
		jne skip2
		call destroy_bird2
		mov counter2,0
		CALL BOUNDARY2
		
		
	skip2:
ret

create_bird2 endp

create_bird3 proc

inc counter3
mov cx,x3
mov dx,y3


L1_createball3:

MOV CX,x3

	LL3b3:

cmp cx,eyex3
	jne noeye3

cmp dx,eyey3
jne noeye3

	MOV AL, eye_color3
	MOV AH, 0CH
	INT 10H
	jmp printed3

	noeye3:
	MOV AL, bird_color3
	MOV AH, 0CH
	INT 10H

printed3:


	INC CX
	CMP CX,x_bird3
	JNE LL3b3

	INC DX

	CMP DX,y_bird3
JNE L1_createball3
		mov ax,bird_speed
		cmp counter3,ax
		jne skip3
		call destroy_bird3
		mov counter3,0
		CALL BOUNDARY3
	
	
		call delete_reward

		cmp special_reward_y_end,120
		je skip3
		cmp gain_reward1,1
		je skip3
		inc special_reward_y
		inc special_reward_y_end

		call reward
		call special_reward
		
		
	skip3:
ret

create_bird3 endp

special_reward proc

mov cx,special_reward_x
mov dx,special_reward_y

cmp special_reward_y,110
jae lost
L1sr:

MOV CX,special_reward_x

	L2sr:

	MOV AL, 0dh
	MOV AH, 0CH
	INT 10H

	INC CX
	CMP CX,special_reward_x_end
	JNE L2sr

	INC DX

	CMP DX,special_reward_y_end
	JNE L1sr
jmp done		
lost:
mov sb2,0
done:
ret 
special_reward endp

delete_reward proc

mov cx,special_reward_x
mov dx,special_reward_y

L1dr:

MOV CX,special_reward_x

	L2dr:

	MOV AL, 0
	MOV AH, 0CH
	INT 10H

	INC CX
	CMP CX,special_reward_x_end
	JNE L2dr

	INC DX

	CMP DX,special_reward_y_end
	JNE L1dr
ret
delete_reward endp




destroy_bird proc
	
	mov dx,y
		LL1:
			MOV CX, x
			LL2:
			
			mov ah,0dh
			int 10h
				MOV AL, 0
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,x_bird
			JNE LL2
			
			INC DX
			
			CMP DX,y_bird
		JNE LL1
	ret	
destroy_bird endp

destroy_bird2 proc
	
	mov dx,y2
		LL12:
			MOV CX, x2
			LL22:
			
			mov ah,0dh
			int 10h
				MOV AL, 0
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,x_bird2
			JNE LL22
			
			INC DX
			
			CMP DX,y_bird2
		JNE LL12
	ret	
destroy_bird2 endp

destroy_bird3 proc
	
	mov dx,y3
		LL123:
			MOV CX, x3
			LL223:
			
			mov ah,0dh
			int 10h
				MOV AL, 0
				MOV AH, 0CH
				INT 10H
				
				INC CX
				CMP CX,x_bird3
			JNE LL223
			
			INC DX
			
			CMP DX,y_bird3
		JNE LL123
	ret	
destroy_bird3 endp


Win proc
	mov ah, 0
	mov al, 13h
	int 10h	
	
	mov ah,02h
	mov bx,0
	mov dh,11
	mov dl,12
	int 10h
	lea dx,gamewin  ; string
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,14
	mov dl,14
	int 10h
	lea dx,namee  ; string
	mov ah,09h
	int 21h
	
	mov ah,02h
	mov bx,0
	mov dh,14
	mov dl,22
	int 10h
	
	mov ah,02h
	mov bx,0
	mov dh,14
	mov dl,22
	int 10h
	lea dx,NameStorer
	mov ah,09h
	int 21h
	
	
		cmp LEVELS,1
		je call_1_
		cmp LEVELS,2
		je call_2_
		cmp LEVELS,3
		je call_3_
		
		call_1_:
	mov ah,02h
	mov bx,0
	mov dh,16
	mov dl,9
	int 10h
	lea dx,totScore2  ; string
	mov ah,09h
	int 21h
		mov ah,02h
		mov bx,0
		mov dh,18
		mov dl,14
		int 10h
		lea dx,EASY11 ; string
		mov ah,09h
		int 21h
		jmp DONE
		
		call_2_:
			mov ah,02h
	mov bx,0
	mov dh,16
	mov dl,9
	int 10h
	lea dx,totScorelvl2  ; string
	mov ah,09h
	int 21h
		mov ah,02h
		mov bx,0
		mov dh,18
		mov dl,14
		int 10h
		lea dx,MEDIUMM11  ; string
		mov ah,09h
		int 21h
		jmp DONE
		
		call_3_:

		cmp gain_reward1,1
		je best
			mov ah,02h
	mov bx,0
	mov dh,16
	mov dl,9
	int 10h
	lea dx,totScore  ; string
	mov ah,09h
	int 21h

jmp doneeee
best:

	mov bx,0
	mov dh,16
	mov dl,9
	int 10h
	lea dx,totScorer  ; string
	mov ah,09h
	int 21h
	doneeee:
		mov ah,02h
		mov bx,0
		mov dh,18
		mov dl,14
		int 10h
		lea dx,HARD11  ; string
		mov ah,09h
		int 21h
		jmp DONE
	
	DONE:
	
	ret
Win endp


main proc

mov ah, 0
	mov al, 13h
	int 10h
	
	mov ax,@data
	mov ds,ax
	mov ax,0
	;-------------------------- NAME INPUT PANEL ----------------------------------
	game_start:
	mov cx,0
	mov dx,400
	call FirstScreen
	;------------------------------- MENU ---------------------------------	
	cmp al,13
	je x1
x1:

start:
mov exittt,0
	mov cursor1,82
	mov cursor2,87
	call Cursor

	mov ah,00h
	int 16h

	cmp ah,48h
	je x_3
	cmp al,13
	je dif
	jne x_2
	dif:

lv1:
	mov cursor1,82
	mov cursor2,87
	call Difficulty
	mov ah,00h
	int 16h
	cmp al,13
	
je go_3
	cmp ah,48h
	je lv3

	cmp ah,50h
	je lv2

go_3:
	je newscreen   ; ----- level 1----
	jne lv2
	
	newscreen:
	call level
	
	mov bird_speed,500
	mov LEVELS,1
	

	game_loop_1:

	cmp exittt,1
	je start


	
	cmp scoree,10
	jne continue_1

	call WIN
	jmp exit_main

	continue_1:
	mov ah, 01
	int 16h
	jz no_key_11

	;cmp al, 27
	;jz x1


	call move_shooter
	call create_bird

	
	no_key_11:
	call create_bird
	jmp game_loop_1
	
lv2:
	mov cursor1,100
	mov cursor2,105
	call Difficulty
	
	mov ah,00h
	int 16h
	cmp al,13

je go2
	cmp ah,48h
	je lv1

	cmp ah,50h
	je lv3

go2:
	mov LEVELS,2
	mov bird_speed,300
	mov LEVELS,2
	je mlv2
	jne lv3
	mlv2:
	
	CALL level
	game_loop_2:

		cmp exittt,1
	je start

	cmp scoree,20
	jne continue_2

	call WIN
	jmp exit_main

	continue_2:
	mov ah, 01h
	int 16h
	jz no_key_1

	;cmp al, 27
	;jz x1


	call move_shooter
	call create_bird
	call create_bird2

	
	no_key_1:
	call create_bird
	call create_bird2
	
	jmp game_loop_2



	jmp jump_to_x1
lv3:
	mov cursor1,115
	mov cursor2,120
	call Difficulty
	;---------------------------------------------------------------
	
	mov ah,00h
	int 16h
	cmp al,13

	je go3
	cmp ah,48h
	je lv2

	cmp ah,50h
	je lv1

go3:
	mov LEVELS,3
	mov bird_speed,100
	;mov bar_end,193
	je llv3
	jne dif
	llv3:
	call level
	game_loop_3:

		cmp exittt,1
	je start
	
	cmp killcount,3
	jne continue3

	call WIN
	jmp exit_main

continue3:
cmp lives,0
je exit_main


	mov ah, 01h
	int 16h
	jz no_key_111       

	;cmp al, 27        
	;jz x1   

	call move_shooter
	call create_bird
	call create_bird2
	call create_bird3

	
	no_key_111:
	call create_bird
	call create_bird2
	call create_bird3
	
	jmp game_loop_3
	


jump_to_x1:
	jmp x1

	exit:
	
	;-------------------------------------- LEVEL 01-------------------------------------------------------

	
		
	mov ah,00h
	int 16h
	cmp ah,50h
	je x_2

	cmp ah,48h
	je x_3

	x_2:
	mov cursor1,100
	mov cursor2,105
	call Cursor
	
	mov ah,00h
	int 16h
	cmp ah,48h
	je x1
	
	cmp al,13
	je x4
	
	jne x_3
	x4:
	call Instructions
	
	mov ah,00h
	int 16h
	cmp al,13
	je x1
	
	mov ah,00h
	int 16h
	cmp ah,48h
	je x1
	
	cmp ah,50h
	je x_3
	x_3:
	mov cursor1,115
	mov cursor2,120
	call Cursor
	
	mov ah,00h
	int 16h
	cmp al,13
	je main
	
	cmp ah,48h
	je x_2

	cmp ah,50h
	je x1
	
	cmp al,32
	je exit_main
exit_main:
;call fileopen
call filehandling
main endp
mov ah,4ch
int 21h
end