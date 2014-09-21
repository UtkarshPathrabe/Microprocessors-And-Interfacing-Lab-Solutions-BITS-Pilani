.MODEL TINY
.486
.data
File1	db	'Task0402.txt', 0
File2	db	'Task0403.txt',	0
.code
.startup
	mov	ah,	56h			;Renaming a file
	mov	cl,	01h
	lea	dx,	File1
	lea	di,	File2
	int	21h
.exit
end