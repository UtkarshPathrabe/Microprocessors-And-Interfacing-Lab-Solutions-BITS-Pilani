.model tiny
.486
.data
str1	db	'Enter 10 Numbers:',	0Dh,	0Ah,	24h
max1	db	11
act1	db	?
inp1	db	10	dup(0)
str2	db	0dh, 0ah, 'The minimum 2-digit number is:',	24h
str3	db	2	dup(0),	0Dh, 0Ah, 24h
.code
.startup
	lea	dx,	str1
	mov	ah,	09h
	int 21h
	lea	dx,	max1
	mov	ah,	0Ah
	int 21h
	lea	si,	inp1
	mov	cx,	5
	mov	ax,	[si]
	dec	cx
x1:	inc	si
	inc	si
	cmp	ax,	[si]
	jle	x2
	mov	ax,	[si]
x2:	loop	x1
	lea	di,	str3
	stosw
	lea	dx,	str2
	mov	ah,	09h
	int 21h
	lea	dx,	str3
	mov	ah,	09h
	int 21h
.exit
end