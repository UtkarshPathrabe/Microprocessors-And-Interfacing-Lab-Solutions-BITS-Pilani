.model	tiny
.486
.data
dat1	db		45h, 67h, 38h, 92h, 41h, 20h, 21h, 30h, 41h, 00h, 90h, 10h,3ah, 41h,51h, 00h
dat2  	db		45h, 67h, 38h, 92h, 41h, 20h, 21h, 30h, 41h, 00h, 90h, 10h,3ah, 41h,51h, 00h
dat3	dw		8 dup(?)
car		db		0
.code
.startup
		lea		si,dat1
		lea		di,dat3
		lea		bx,dat2
		mov		cx,8
		lodsw
		clc
x1:		adc		ax,[bx]
		stosw
		add		bx,4
		loop	x1
		jnc		x2
		inc		car
x2:
.exit
end	