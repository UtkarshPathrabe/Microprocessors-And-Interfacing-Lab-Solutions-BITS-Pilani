.model tiny
.486
.data
Max1	db	100
Act1	db	?
Inp1	db	103	dup(?),	24h
NumWr1	dw	?
Count	dw	?
Handle	dw	?
File	db	'Task0405.txt', 0
.code
.startup
	mov	ah,	3Ch			;Creating a file
	lea	dx,	File
	mov	cl,	01h
	int	21h
	mov	Handle,	ax
	lea	dx,	Max1		;Taking input from keyboard
	mov	ah, 0Ah
	int	21h
	lea	di,	Inp1		;To place '$' after taking the input
	mov	al,	Act1
	xor	ah,	ah
	add	di,	ax
	mov	byte ptr[di],0Dh
	inc	di
	mov	byte ptr[di],0Ah
	inc	di
	mov	byte ptr[di],24h
	add	ax,	02h			;To initialize Count
	mov	Count,	ax
	mov	ah,	3Dh			;Opening a file
	mov	al,	02
	lea	dx,	File
	int	21h
	mov	Handle,	ax
	mov ah,	40h			;Writing to a file
	mov	bx,	Handle
	mov	cx,	Count
	lea	dx,	Inp1
	int 21h
	mov	NumWr1,	ax
	mov	ah,	3Eh			;Closing a file
	mov	bx,	Handle
	int	21h
.exit
end
