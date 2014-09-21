.model tiny
.486
.data
File1	db	'Task0402.txt', 0
Handle	dw	?
Attri1	dw	?
Attri2	dw	00
Time	dw	?
Date	dw	?
.code
.startup
	mov	ah,	3Ch			;Creating a file
	lea	dx,	File1
	mov	cl,	01h
	int	21h
	mov	Handle,	ax
	mov	ah,	57h			;Get file's last-written date and time
	mov	al,	00h
	mov	bx,	Handle
	int	21h
	mov	Time,	cx
	mov	Date,	dx
	mov	ah,	43h			;Get file's attribute
	mov	al,	00
	lea	dx,	File1
	int	21h
	mov	Attri1,	cx
	mov	ah,	43h			;Set file's attribute
	mov	al,	01h
	lea	dx,	File1
	mov	cx,	Attri2
	int	21h
	;mov	ah,	41h			;Deleting a file
	;lea	dx,	File1
	;int	21h
.exit
end
