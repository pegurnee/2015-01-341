.orig x3000
	ld	r2, Zero
	ld	r0, M0
	ld	r1, M1
    ;begin multiply
Loop	brz	Done
	add	r2, r2, r0
	add	r1, r1, #-1
	br	Loop
    ;end multiply
Done	st	r2, Result
	HALT
Result	.fill	x0000
Zero	.fill	x0000
M0	.fill	x0007
M1	.fill	x0003
.end
