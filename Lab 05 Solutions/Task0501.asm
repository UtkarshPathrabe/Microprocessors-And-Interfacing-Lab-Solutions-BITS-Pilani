.model tiny
.486
.data
DesVidMode	db	03h		;Set Display Mode (00h - text mode, 40x25, 16 colours, 8 pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours, 720x400 pixels, 1 page)
RowDisp		db	12		;Set Cursor Position
ColumnDisp	db	39
PageNumDis2	db	00
AttrDisp	db	8Fh		;Write Character at Cursor Position
PageNumDis3	db	00h
CharDisp1	db	'D'
NumberOfTi1	dw	01h
CharDisp2	db	'O'
NumberOfTi2	dw	01h
CharDisp3	db	'L'
NumberOfTi3	dw	02h
.code
.startup
	mov	ah,	00h			;Set Display Mode
	mov	al,	DesVidMode
	int	10h
	mov ah, 02h			;Set Cursor Position
	mov dh, RowDisp
	mov dl,	ColumnDisp
	mov	bh, PageNumDis2
	int	10h
	mov	ah,	09h			;Write Character at Cursor Position
	mov	al,	CharDisp1
	mov	bh,	PageNumDis3
	mov	bl,	AttrDisp
	mov	cx,	NumberOfTi1
	int	10h
	mov ah, 02h			;Set Cursor Position
	mov dh, RowDisp
	mov dl,	ColumnDisp
	add	dl,	1
	mov	bh, PageNumDis2
	int	10h
	mov	ah,	09h			;Write Character at Cursor Position
	mov	al,	CharDisp2
	mov	bh,	PageNumDis3
	mov	bl,	AttrDisp
	mov	cx,	NumberOfTi2
	int	10h
	mov ah, 02h			;Set Cursor Position
	mov dh, RowDisp
	mov dl,	ColumnDisp
	add	dl,	2
	mov	bh, PageNumDis2
	int	10h
	mov	ah,	09h			;Write Character at Cursor Position
	mov	al,	CharDisp3
	mov	bh,	PageNumDis3
	mov	bl,	AttrDisp
	mov	cx,	NumberOfTi3
	int	10h
	mov ah,07h			;Blocking Function
x1:	int 21h
	cmp	al,	'%'
	jnz x1
	mov ah, 02h			;Set Cursor Position
	mov dh, 24
	mov dl,	00
	mov	bh, PageNumDis2
	int	10h
.exit
end
