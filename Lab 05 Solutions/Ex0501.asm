.model tiny
.486
.data
VideoMode	db	?		;Get Display Mode
CharColumn	db	?
PageNumDis1	db	?
DesVidMode	db	03h		;Set Display Mode (00h - text mode, 40x25, 16 colours, 8 pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours, 720x400 pixels, 1 page)
Row			db	?		;Get Cursor Position and Size
Column		db	?
CurStartLi	db	?
CurBottomLi	db	?
PageNumber1	db	00h
RowDisp		db	07h		;Set Cursor Position
ColumnDisp	db	20
PageNumDis2	db	00
CurStaLiDis	db	1dh		;Set Cursor Size
CurBotLiDis	db	0dh
Attribute	db	?		;Read Character at Cursor Position
Character	db	?
PageNumber2	db	00h
AttrDisp	db	4Eh		;Write Character at Cursor Position
CharDisp	db	50h
PageNumDis3	db	00h
NumberOfTim	dw	04h
DesVidMod2	db	12h		;Fill a Pixel
PixelColor	db	0Ch
PixelRow	dw	20
PixelColumn	dw	10
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
	mov	ah,	03h			;Get Cursor Position And Size
	mov	bh,	PageNumber1
	int	10h
	mov	Row,		dh
	mov	Column,		dl
	mov	CurStartLi,	ch
	mov	CurBottomLi,cl
	mov ah, 02h			;Set Cursor Position
	mov dh, RowDisp
	mov dl,	ColumnDisp
	mov	bh, PageNumDis2
	int	10h
	mov	ah,	01h			;Set Cursor Size
	mov	ch,	CurStaLiDis
	mov	cl,	CurBotLiDis
	int	10h
	mov	ah,	08h			;Read Character at Cursor Position
	mov	bh,	PageNumber2
	int	10h
	mov	Attribute,	ah
	mov	Character,	al
	mov	ah,	09h			;Write Character at Cursor Position
	mov	al,	CharDisp
	mov	bh,	PageNumDis3
	mov	bl,	AttrDisp
	mov	cx,	NumberOfTim
	int	10h
	mov	ah,	00h			;Fill a Pixel(Set Graphics Video Mode)
	mov	al,	DesVidMod2
	int	10h
	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	mov	ah,	00h			;Set Display Mode
	mov	al,	DesVidMode
	int	10h
.exit
end
