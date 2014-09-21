.model tiny
.486
.data
Data1	db	134	dup(?), 24h
NumRd1	dw	?
Count	equ	134
Handle	dw	?
File	db	'Task0401.txt', 0
.code
.startup
	mov	ah,	3Dh			;Opening a file
	mov	al,	02
	lea	dx,	File
	int	21h
	mov	Handle,	ax
	mov	ah,	3Fh			;Reading from a file
	mov	bx,	Handle
	mov	cx,	Count
	lea	dx,	Data1
	int	21h
	mov	NumRd1,	ax
	lea	dx,	Data1		;Output to Display
	mov	ah,	09h
	int 21h
	mov	ah,	3Eh			;Closing a file
	mov	bx,	Handle
	int	21h
.exit
end
