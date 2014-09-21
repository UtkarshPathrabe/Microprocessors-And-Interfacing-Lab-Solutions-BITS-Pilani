.model tiny
.486
.data
CounterRow	dw	?		;Counter for rows
counterCol	dw	?		;Counter for columns 
RectLen1	equ	150		;Length of Rectangle
RectWid1	equ	250		;Width of Rectangle
IniX1		equ	00		;Initial X Co-ordinate
IniY1		equ	00		;Initial Y Co-ordinate
RectLen2	equ	125		;Length of Rectangle
RectWid2	equ	210		;Width of Rectangle
IniX2		equ	12		;Initial X Co-ordinate
IniY2		equ	20		;Initial Y Co-ordinate
RectLen3	equ	100		;Length of Rectangle
RectWid3	equ	168		;Width of Rectangle
IniX3		equ	24		;Initial X Co-ordinate
IniY3		equ	41		;Initial Y Co-ordinate
RectLen4	equ	75		;Length of Rectangle
RectWid4	equ	126		;Width of Rectangle
IniX4		equ	36		;Initial X Co-ordinate
IniY4		equ	62		;Initial Y Co-ordinate
RectLen5	equ	50		;Length of Rectangle
RectWid5	equ	84		;Width of Rectangle
IniX5		equ	48		;Initial X Co-ordinate
IniY5		equ	83		;Initial Y Co-ordinate
RectLen6	equ	25		;Length of Rectangle
RectWid6	equ	42		;Width of Rectangle
IniX6		equ	60		;Initial X Co-ordinate
IniY6		equ	104		;Initial Y Co-ordinate
DesVidMode1	db	12h		;Set Display Mode (00h - text mode, 40x25, 16 colours, 8 pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours, 720x400 pixels, 1 page)
DesVidMode2	db	03h		;Set Display Mode (00h - text mode, 40x25, 16 colours, 8 pages)(03h - text mode, 80x25, 16 colours, 8 pages)(12h - graphical mode, 80x25, 256 colours, 720x400 pixels, 1 page)
RowDisp		db	00		;Set Cursor Position
ColumnDisp	db	00
PageNumDis	db	00
PixelColor1	db	0Ch		;Fill a Pixel
PixelColor2	db	0Ah
PixelRow	dw	00
PixelColumn	dw	00
.code
.startup
	mov	ah,	00h			;Set Display Mode
	mov	al,	DesVidMode1
	int	10h
	mov PixelRow,	IniY1		;To create a red block
	mov	PixelColumn,	IniX1
	mov	CounterRow,	RectWid1
x1:	mov	CounterCol,	RectLen1
	mov	PixelColumn,	IniX1
x2:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor1
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	inc PixelColumn
	dec	CounterCol
	jnz	x2
	inc	PixelRow
	dec	CounterRow
	jnz	x1
	mov PixelRow,	IniY2		;To create a green block
	mov	PixelColumn,	IniX2
	mov	CounterRow,	RectWid2
x3:	mov	CounterCol,	RectLen2
	mov	PixelColumn,	IniX2
x4:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor2
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	inc PixelColumn
	dec	CounterCol
	jnz	x4
	inc	PixelRow
	dec	CounterRow
	jnz	x3
	mov PixelRow,	IniY3		;To create a red block
	mov	PixelColumn,	IniX3
	mov	CounterRow,	RectWid3
x5:	mov	CounterCol,	RectLen3
	mov	PixelColumn,	IniX3
x6:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor1
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	inc PixelColumn
	dec	CounterCol
	jnz	x6
	inc	PixelRow
	dec	CounterRow
	jnz	x5
	mov PixelRow,	IniY4		;To create a green block
	mov	PixelColumn,	IniX4
	mov	CounterRow,	RectWid4
x7:	mov	CounterCol,	RectLen4
	mov	PixelColumn,	IniX4
x8:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor2
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	inc PixelColumn
	dec	CounterCol
	jnz	x8
	inc	PixelRow
	dec	CounterRow
	jnz	x7
	mov PixelRow,	IniY5		;To create a red block
	mov	PixelColumn,	IniX5
	mov	CounterRow,	RectWid5
x9:	mov	CounterCol,	RectLen5
	mov	PixelColumn,	IniX5
x10:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor1
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	inc PixelColumn
	dec	CounterCol
	jnz	x10
	inc	PixelRow
	dec	CounterRow
	jnz	x9
	mov PixelRow,	IniY6		;To create a green block
	mov	PixelColumn,	IniX6
	mov	CounterRow,	RectWid6
x11:	mov	CounterCol,	RectLen6
	mov	PixelColumn,	IniX6
x12:	mov	ah,	0Ch			;Fill a Pixel(Set Pixel)
	mov	al,	PixelColor2
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	inc PixelColumn
	dec	CounterCol
	jnz	x12
	inc	PixelRow
	dec	CounterRow
	jnz	x11
	mov ah,07h			;Blocking Function
x13:	int 21h
	cmp	al,	'%'
	jnz x13
	mov	ah,	00h			;Set Display Mode
	mov	al,	DesVidMode2
	int	10h
	mov ah, 02h			;Set Cursor Position
	mov dh, RowDisp
	mov dl,	ColumnDisp
	mov	bh, PageNumDis
	int	10h
.exit
end
