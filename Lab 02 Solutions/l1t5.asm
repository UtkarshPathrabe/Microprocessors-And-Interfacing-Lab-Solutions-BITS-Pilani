.model	tiny
.486
.data
array1	dd		45678902h,78076788h,9008123ah,345678abh,12345678h,95678902h,71076788h,0B008123ah,945678abh,82345678h
array2	dd		20 dup(?)
.code
.startup
		lea		si,array1
		lea		si,array2
		mov		cx,10
		std
rep		movsd	
.exit
end		