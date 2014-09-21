.model tiny
.data
fil1    db      'a.txt',0
dat1    db      100 dup('$')
.code
.startup
        mov     al,02h
        lea     dx,fil1
        mov     ah,3dh
        int     21h
        mov     bx,ax
        lea     dx,dat1
        mov     cx,27
        mov     ah,3fh
        int     21h
        mov     ah,09h
        lea     dx,dat1
        int     21h
        mov     ah,3eh
        int     21h
.exit
end
