.model tiny
.486
.data
Data1	db	150	dup(?), 24h
Count	equ	1
Handle	dw	?
File	db	'Task0401.txt', 0
.code
.startup
	mov	ah,	3Dh			;Opening a file
	mov	al,	02
	lea	dx,	File
	int	21h
	mov	Handle,	ax
	lea	di,	Data1		;Reading from a file one byte at a time
x1:	mov	ah,	3Fh	
	mov	bx,	Handle
	mov	cx,	Count
	mov	dx,	di
	int	21h
	inc	di
	cmp	ax,	0000h
	jne	x1
	mov	byte ptr[di],0Dh	;To place '$' after the transfer
	inc	di
	mov	byte ptr[di],0Ah
	inc	di
	mov	byte ptr[di],24h
	lea	dx,	Data1		;Output to Display
	mov	ah,	09h
	int 21h
	mov	ah,	3Eh			;Closing a file
	mov	bx,	Handle
	int	21h
.exit
end
