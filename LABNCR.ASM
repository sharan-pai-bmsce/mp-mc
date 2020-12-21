.model small
.data
n dw 07h
r dw 03h
ncr dw ?

.code
mov ax,@data
mov ds,ax
xor ax,ax
mov ax,n
mov bx,r
call ncrproc
mov ax,ncr
add al,00h
aam
cmp ah,0ah
jc next1
sub ah,0ah
next1:add ah,30h
cmp al,0ah
jc next2
sub al,0ah
next2:add al,30h
mov bl,al
mov dl,ah
mov ah,02h
int 21h
mov dl,bl
mov ah,02h
int 21h
mov ah,4ch
int 21h

ncrproc proc near
cmp ax,bx
je res1
cmp bx,00h
je res1
cmp bx,01h
je resn
dec ax
cmp ax,bx
je incr
push ax
push bx
call ncrproc
pop bx
pop ax
dec bx
push ax
push bx
call ncrproc
pop bx
pop ax
ret
res1:inc ncr
ret
incr:inc ncr
resn:add ncr,ax
ret
ncrproc endp

end