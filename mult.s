#Program Name: mult.s
#Author: Johnnie Massart
#Date: 11/6/2023
#Purpose: multiplication using sucessive addition with recursion
.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp]

	#user prompt1
	LDR r0, =prompt1
	BL printf

	#scan user input1
	LDR r0, =formatInput1
	LDR r1, =input1
	BL scanf

	#store user input1 value
	LDR r5, =input1
	LDR r5, [r5]

	#user prompt2
	LDR r0, =prompt2
	BL printf

	#scan user input2
	LDR r0, =formatInput2
	LDR r1, =input2
	BL scanf

	#store user input2 value
	LDR r0, =input2
	LDR r0, [r0]

	#move occurrences into r1
	MOV r1, r5

	#call function
	BL mul

	#output
	MOV r1, r0
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt1: .asciz "Enter occurrences: "
	formatInput1: .asciz "%d"
	input1: .word 0
	prompt2: .asciz "Enter value: "
	formatInput2: .asciz "%d"
	input2: .word 0
	output: .asciz "The recursively added value is: %d\n"


#end main

.text
mul:
	#push the stack
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]

	#value - r4, occurrences - r5
	MOV r4, r0
	MOV r5, r1

	#if (occurrences == 1) return r4 (value)
	CMP r5, #1
	BNE Else
		#occurrences equal to 1
		MOV r0, r4
		B Return
	Else:
		#occurences not equal to 1
		SUB r1, r5, #1
		BL mul
		ADD r0, r4, r0
		B Return

	EndIf:


	#pop the stack
	Return:
	LDR lr, [sp]
	LDR r4, [sp, #4]
	ADD sp, sp, #8
	MOV pc, lr
.data

