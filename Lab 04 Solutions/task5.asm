.model tiny
.data
fil1 db 'c:\drc\ab.txt',0
k1 db 11
k2 db ?
k3 db 11 dup(?)
.code
.startup
mov ah,3dh
mov al,02
lea dx,fil1
int 21h
mov bx,ax
mov ah,42h
mov al,02h
mov cx,0
mov dx,cx
int 21h
mov ah,0ah
lea dx,k1
int 21h
mov ch,00
mov cl,k2
mov ah,40h
lea dx,k3
int 21h
mov ah,3eh
int 21h
.exit
end
