.model small
disp macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
msg1 db 0dh,0ah,"Enter the string-1 $"
msg2 db 0dh,0ah,"Enter the string-2 $"
msg3 db 0dh,0ah,"equal $"
msg4 db 0dh,0ah,"not equal $"
msg5 db 0dh,0ah,"length of str-1: $"
msg6 db 0dh,0ah,"length of str-2: $"
strl1 db 03h dup(?)
strl2 db 03h dup(?)
str db 80h dup(?)
rstr db 80h dup(?)

.code
mov ax,@data
mov ds,ax
mov es,ax
xor ax,ax
lea si,str
xor cl,cl
disp msg1
l1:mov ah,01h
int 21h
cmp al,0dh
je next1
mov [si],al
inc si
inc cl
jmp l1
next1:mov [si],byte ptr '$'
lea si,rstr
xor ch,ch
disp msg2
l2:mov ah,01h
int 21h
cmp al,0dh
je next2
mov [si],al
inc si
inc ch
jmp l2
next2:mov [si],byte ptr '$'
mov bh,ch
mov bl,cl
cmp cl,ch
jnz fail
lea si,str
lea di,rstr
xor ch,ch
repe cmpsb
jnz fail
disp msg3
jmp final
fail:disp msg4
final:mov al,bl
aam
add ax,3030h
mov strl1,ah
mov strl1+1,al
mov strl1+2,byte ptr '$'
mov al,bh
aam
add ax,3030h
mov strl2,ah
mov strl2+1,al
mov strl2+2,byte ptr '$'

disp msg5
disp strl1
disp msg6
disp strl2
mov ah,4ch
int 21h


end

