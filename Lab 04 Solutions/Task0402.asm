.model tiny
.486
.data
Data1	db	'Hostel: Gandhi Bhawan', 0Dh, 0Ah, 'Room No.: 260', 0Dh, 0Ah, 24h
NumWr1	dw	?
Count	equ	38
Handle	dw	?
File	db	'Task0401.txt', 0
.code
.startup
	mov	ah,	3Dh			;Opening a file
	mov	al,	02
	lea	dx,	File
	int	21h
	mov	Handle,	ax
	mov ah,	42h			;Moving the file pointer to the end of the file 
	mov	al,	02h
	mov	bx,	Handle
	mov	cx,	0000h
	mov	dx,	0000h
	int	21h
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
