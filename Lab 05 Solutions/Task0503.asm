.model tiny
.486
.data
RectLen		equ	100		;Length of Rectangle
RectWid		equ	80		;Width of Rectangle
IniX		equ	80		;Initial X Co-ordinate
IniY		equ	70		;Initial Y Co-ordinate
DesVidMode1	db	12h		;Set Display Mode (00h - text mode, 40x25, 16 colours, 8 pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours, 720x400 pixels, 1 page)
DesVidMode2	db	03h		;Set Display Mode (00h - text mode, 40x25, 16 colours, 8 pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours, 720x400 pixels, 1 page)
RowDisp		db	00		;Set Cursor Position
ColumnDisp	db	00
PageNumDis1	db	00
PixelColor	db	0Ch		;Fill a Pixel
PixelRow	dw	70
PixelColumn	dw	80
.code
.startup
	mov	ah,	00h			;Set Display Mode
	mov	al,	DesVidMode1
	int	10h
	mov	bx,	RectLen		;Drawing the length
x1:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	inc PixelColumn
	mov	dx,	PixelRow
	int	10h
	dec	bx
	jnz	x1
	mov	bx,	RectWid		;Drawing The Width
x2:	inc	PixelRow
	mov	PixelColumn,IniX
	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	add PixelColumn,RectLen
	mov	dx,	PixelRow
	int	10h
	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	dec	bx
	jnz	x2
	mov	bx,	RectLen		;Drawing the length
	inc PixelRow
	mov	PixelColumn,IniX
x3:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	inc PixelColumn
	mov	dx,	PixelRow
	int	10h
	dec	bx
	jnz	x3
	mov ah,07h			;Blocking Function
x4:	int 21h
	cmp	al,	'%'
	jnz x4
	mov	ah,	00h			;Set Display Mode
	mov	al,	DesVidMode2
	int	10h
	mov ah, 02h			;Set Cursor Position
	mov dh, RowDisp
	mov dl,	ColumnDisp
	mov	bh, PageNumDis1
	int	10h
.exit
end
