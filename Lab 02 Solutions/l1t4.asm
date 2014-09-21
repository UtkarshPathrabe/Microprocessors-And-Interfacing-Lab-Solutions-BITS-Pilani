.model	tiny
.486
.data
array1	dw		0312H,7810H,4534H,900AH,0A110H,0010H,0A100H,2145h,8700h,0096h
count	dw		10
neg1	dw		?
.code
.startup
		lea		si,array1
		mov		cx,count
x1:		lodsw
		bt		ax,15
		jnc		x2
		inc		neg1
x2:		loop	x1
		
.exit
end		