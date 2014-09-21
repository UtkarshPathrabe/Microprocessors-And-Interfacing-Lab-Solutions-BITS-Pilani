.model	tiny
.486
.data
array1	db		03H,78H,45H,0AH,10H,30H,0AH,21h,87h,96h

.code
.startup
		lea		si,array1
		mov		bl,'E'
		mov		cx,10
		mov		al,0ah
x1:		cmp		[si],al
		jne		x2
		mov		[si],bl
x2:		inc		si
		loop	x1
		
.exit
end		