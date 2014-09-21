.model tiny
.data
fil1    db      'a1.txt',0
dat2    db      0dh,0ah
dat3    db      'D-67'
dat4    db      0dh,0ah
dat5    db      'staff qtrs'
.code
.startup
        mov     al,02h
        lea     dx,fil1
        mov     ah,3dh
        int     21h
        mov     bx,ax
        mov     al,00
        mov     cx,0
        mov     dx,23
        mov     ah,42h
        int     21h
        lea     dx,dat2
        mov     cx,18
        mov     ah,40h
        int     21h
        mov     ah,3eh
        int     21h
.exit
end
