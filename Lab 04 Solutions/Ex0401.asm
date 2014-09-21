.model tiny
.486
.data
FName	db	'abc.txt',0
Handle	dw	?
Data1	db	'Utkarsh A Pathrabe',	0dh,	0ah,	24h
NumWr1	dw	?
.code
.startup
	mov	ah,	3Ch			;Creating a file
	lea	dx,	FName
	mov	cl,	1
	int	21h
	mov	Handle,	ax
	mov	ah,	3Dh			;Opening a file
	mov	al,	02
	lea	dx,	FName
	int	21h
	mov	Handle,	ax
	mov	ah,	40h			;Writing to a file
	mov	bx,	Handle
	mov	cx,	18
	lea	dx,	Data1
	int	21h
	mov	NumWr1,	ax
	mov	ah,	3Eh			;Closing a file
	mov	bx,	Handle
	int	21h
.exit
end