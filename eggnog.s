    .global	main
main:
    // pre-increment the stack point to create space for two 8-byte registers
    // link register (x30), and frame pointer (x29), and store them.
	stp	x29, x30, [sp, -16]!

    // Load the argument and perform the call. Like 'printf("...")' in C.
	ldr	x0, =message
	bl	printf
        ldr   x0, =message2
        bl printf
        ldr   x0, =message3
        bl printf

    // initialize the return value in the return register
	mov	x0, 0

    // restore the registers and post-decrement 
    // the stack pointer for consistency
	ldp	x29, x30, [sp], 16

    // return from the call
	ret

message:
	.asciz "Eggnog, holiday\n"

message2:
        .asciz "Cozy by the fireplace,\n"

message3:
        .asciz "Better with some rum.\n"
