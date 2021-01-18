.model small
.code
;Setting the counter
mov cl,00h
;Setting to video mode (Editing mode)
mov ah,00h
mov al,03h
int 10h

loop1:
;Setting the position of the cursor
mov bh,00h ;Gives Page number
mov dh,00h ;Gives x co ordinate
mov dl,00h ; Gives y co ordinate
mov ah,02h
int 10h

mov al,cl
add al,00h
aam
add ax,3030h
mov bl,al
mov dl,ah
mov ah,02h
int 21h

mov dl,bl
mov ah,02h
int 21h

call delay
inc cl
xor ax,ax
cmp cl,100D
jne loop1
je final

delay proc near
push ax
push bx
push cx
mov cx,00ffh
outl:mov bx,0ffh
inl:NOP
dec bx
jnz inl
dec cx
jnz outl
pop cx
pop bx
pop ax
ret
delay endp

final:mov ah,4ch
int 21h
end
