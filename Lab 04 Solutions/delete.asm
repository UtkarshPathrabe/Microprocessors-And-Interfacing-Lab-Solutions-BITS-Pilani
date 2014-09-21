.model tiny
.data
fil1 db 'c:\drc\b.txt',0
.code
.startup
mov ah,41h
lea dx,fil1
int 21h
.exit
end
