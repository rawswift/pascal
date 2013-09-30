.model tpascal
.code

public hell_yeah

hell_yeah proc far

 push ds

 mov ax,@code
 mov ds,ax

 mov ah,40h
 mov bx,0001h
 mov cx,14
 lea dx,msg
 int 21h

 pop ds

 ret

hell_yeah endp

  msg db '...hell yeah',0dh,0ah

   end
