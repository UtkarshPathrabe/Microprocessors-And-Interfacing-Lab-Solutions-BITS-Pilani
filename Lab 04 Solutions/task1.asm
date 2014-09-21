.model tiny
.data
fil1    db      'a1.txt',0
dat1    db      'anupama'
dat2    db      0dh,0ah
dat3    db      'microprocessor'
.code
.startup
        mov     cx,20h
        mov     ah,3ch
        lea     dx,fil1
        int     21h
        mov     al,02h
        lea     dx,fil1
        mov     ah,3dh
        int     21h
        mov     bx,ax
        lea     dx,dat1
        mov     cx,23
        mov     ah,40h
        int     21h
        mov     ah,3eh
        int     21h
.exit
end
