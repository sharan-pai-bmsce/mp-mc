.model small
.data
a db 20
b db 12
c db ?

.code

     mov ax,@data
     mov ds,ax
     mov al,a
     add al,b
     mov c,al
     mov ah,4ch
     int 21h
     end


