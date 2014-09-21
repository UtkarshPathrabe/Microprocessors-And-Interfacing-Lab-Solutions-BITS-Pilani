.model  tiny
.data
dis1    db      "Enter user name", 0ah,0dh,'$'
dis2    db      0ah,0dh,"Enter Password", 0ah,0dh, '$'
dis4    db      0ah,0dh,"hello "
dat3    db      12 dup('$')
dat31   db      10 dup('$')
str1    db      "anupama123"
str2    db      "12345678"
dis3    db      '*'
dat4    db      0ah, 0dh, '$'
.code
.startup
        lea     dx,dis1
        mov     ah,09h
        int     21h
        cld
        lea     di,dat3
        mov     cx,0ah
x1:     mov     ah,01h
        int     21h
        stosb
        loop    x1
        mov     cx,0ah
        lea     si,dat3
        lea     di,str1
   repe cmpsb
        cmp     cx,00
        jnz     xn
        lea     dx,dis2
        mov     ah,09h
        int     21h
        lea     di,dat31
        mov     cx,08
x2:     mov     ah,08h
        int     21h
        stosb
        mov     dl,dis3
        mov     ah,02h
        int     21h
        loop    x2
        lea     si,dat31
        lea     di,str2
        mov     cx,8
   repe cmpsb
        cmp     cx,00
        jne     xn
        lea     dx,dis4
        mov     ah,09h
        int     21h
xn:
.exit
end

