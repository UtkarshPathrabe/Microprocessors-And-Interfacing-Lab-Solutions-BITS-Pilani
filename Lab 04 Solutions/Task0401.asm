.model tiny
.486
.data
Data1	db	'Name: Utkarsh A Pathrabe  ID No.: 2012A7PS034P', 0Dh, 0Ah, 'Name: Utkarsh A Pathrabe  ID No.: 2012A7PS034P', 0Dh, 0Ah, 24h
Count	equ	96
NumWr1	dw	?
Handle	dw	?
File	db	'Task0401.txt', 0
.code
.startup
	mov	ah,	3Ch			;Creating a file
	lea	dx,	File
	mov	cl,	01h
	int	21h
	mov	Handle,	ax
	mov	ah,	3Dh			;Opening a file
	mov	al,	02
	lea	dx,	File
	int	21h
	mov	Handle,	ax
	mov ah,	40h			;Writing to a file
	mov	bx,	Handle
	mov	cx,	Count
	lea	dx,	Data1
	int 21h
	mov	NumWr1,	ax
	mov	ah,	3Eh			;Closing a file
	mov	bx,	Handle
	int	21h
.exit
end
