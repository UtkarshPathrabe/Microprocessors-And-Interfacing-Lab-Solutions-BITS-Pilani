.model tiny
.486
.data
VideoMode	db	?		;Get Display Mode
CharColumn	db	?
PageNumDis1	db	?
DesVidMode	db	03h		;Set Display Mode (00h - text mode, 40x25, 16 colours, 8 pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours, 720x400 pixels, 1 page)
Character	db	?		;Stores the Current Position
RowDisp1	db	01		;Set Cursor Position 1
ColumnDisp1	db	00
RowDisp2	db	10		;Set Cursor Position 2
ColumnDisp2	db	00
RowDisp3	db	20		;Set Cursor Position 3
ColumnDisp3	db	00
AttrDisp1	db	1Eh		;Write Character at Cursor Position 1
AttrDisp2	db	7Ah		;Write Character at Cursor Position 2
.code
.startup
	mov	ah,	0Fh			;Get Display Mode
	int	10h
	mov	VideoMode,	al
	mov	CharColumn,	ah
	mov	PageNumDis1,bh
	mov	ah,	00h			;Set Display Mode
	mov	al,	DesVidMode
	int	10h
x1:	mov ah, 02h			;Set Cursor Position 3
	mov dh, RowDisp3
	mov dl,	ColumnDisp3
	inc	ColumnDisp3
	mov	bh, PageNumDis1
	int	10h
	mov	ah,	01h			;Take Input
	int	21h
	cmp	al,	'$'
	je	x2
	mov	Character,	al
	mov ah, 02h			;Set Cursor Position 1
	mov dh, RowDisp1
	mov dl,	ColumnDisp1
	inc	ColumnDisp1
	mov	bh, PageNumDis1
	int	10h
	mov	ah,	09h			;Write Character at Cursor Position 1
	mov	al,	Character
	mov	bh,	PageNumDis1
	mov	bl,	AttrDisp1
	mov	cx,	01
	int	10h
	mov ah, 02h			;Set Cursor Position 2
	mov dh, RowDisp2
	mov dl,	ColumnDisp2
	inc	ColumnDisp2
	mov	bh, PageNumDis1
	int	10h
	mov	ah,	09h			;Write Character at Cursor Position 2
	mov	al,	Character
	mov	bh,	PageNumDis1
	mov	bl,	AttrDisp2
	mov	cx,	01
	int	10h
	jmp	x1
x2:	mov	ah,	00h			;Set Display Mode
	mov	al,	VideoMode
	int	10h
.exit
end
