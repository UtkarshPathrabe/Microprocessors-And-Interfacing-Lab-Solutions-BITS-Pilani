.model tiny
.data
fil1 db 'c:\drc\a.txt',0
fil2 db 'c:\drc\bb.txt',0
.code
.startup
mov ah,56h
lea dx,fil1
lea di,fil2
int 21h
.exit
end
