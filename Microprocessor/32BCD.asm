.Model SMALL
.386
.Stack 100h
.data
a db 'Enter the first number: $'
b db 10, 'Enter the second number: $'
c db 10, 'The result is: $'
num1 dd ?
num2 dd ?
res dd ?
.code
.startup

mov ax,@data
mov ds,ax

lea dx,a
mov ah,09h
int 21h

mov cx,8
mov ebx,0

again:
	mov ah,01h
	int 21h
	sub al,30h
	shl ebx,4
	add bl,al
	loop again
	

lea dx,b
mov ah,09h
int 21h

	
mov num1,ebx
mov cx,8
mov ebx,0


again1:
	mov ah,01h
	int 21h
	sub al,30h
	shl ebx,4
	add bl,al
	loop again1
	
mov num2,ebx


mov ax,word ptr num1
mov bx,word ptr num2

add al,bl
daa
mov bl,al

adc ah,bh
mov al,ah
daa
mov bh,al

mov word ptr res,bx


mov ax,word ptr num1+2
mov bx,word ptr num2+2

adc al,bl
daa
mov bl,al

adc ah,bh
mov al,ah
daa
mov bh,al

mov word ptr res+2,bx


lea dx,c
mov ah,09h
int 21h


mov al,0
rcl al,1
mov dl,al
and dl,01h
add dl,30h
mov ah,02h
int 21h


mov ebx,res

mov cx,8

pr:
	rol ebx,4
	mov dl,bl
	and dl,0fh
	add dl,30h
	mov ah,02h
	int 21h
	loop pr
	
.EXIT
END



