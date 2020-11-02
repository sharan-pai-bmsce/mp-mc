.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
msg1 db 0dh,0ah,"Enter the string $"
msg2 db 0dh,0ah,"Reverse String $"
msg3  db 0dh,0ah,"Given string is a palindrome $"
msg4 db 0dh,0ah,"Given string is not a palindrome $"
str db 80h dup(?)
rstr db 80h dup(?)

.code
start:    mov ax,@data
    mov ds,ax
    xor ax,ax
    display msg1
    lea si,str
    xor cl,cl
    l1:mov ah,01h
       int 21h
       cmp al,0dh
       je next
       mov [si],al
       inc si
       inc cl
       jmp l1
    next:mov [si],byte ptr '$'
         dec si
         mov ch,cl
         lea di,rstr
    back:mov al,[si]
         mov [di],al
         dec si
         inc di
         dec ch
         jnz back
         mov [di],byte ptr '$'
         display msg2
         display rstr
         lea si,str
         lea di,rstr
    ag: mov al,[si]
        cmp al,[di]
        jne fail
        inc si
        inc di
        loop ag
        jmp success
    
    fail:display msg4
         jmp final
    
    success:display msg3
    
    final:mov ah,4ch
          int 21h
end start