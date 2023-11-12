#Program Name: fibonacci.s
#Author: Johnnie Massart
#Date: 11/6/2023
#Purpose: fibonacci recursion
.text
.global main
main:
	#push the stack
	SUB sp, sp, #4
	STR lr, [sp]

	#user prompt
	LDR r0, =prompt
	BL printf

	#scan user input
	LDR r0, =formatInput
	LDR r1, =input
	BL scanf

	#store user input value
	LDR r0, =input
	LDR r0, [r0]

	#call function
	BL fibo

	#output message
	MOV r1, r0
	LDR r0, =output
	BL printf

	#pop the stack
	LDR lr, [sp]
	ADD sp, sp, #4
	MOV pc, lr
.data
	prompt: .asciz "Enter fibonacci sequence value: "
	formatInput: .asciz "%d"
	input: .word 0
	output: .asciz "The fibonacci value is: %d\n"

#end main

.text
fibo:
	#push the stack
	SUB sp, sp, #8
	STR lr, [sp]
	STR r4, [sp, #4]	

	#move user input
	MOV r4, r0

	CMP r4, #0
	BGE elsif_1
		MOV r0, #0
		MOV r1, #1
		B Return
		
	elsif_1:
		SUB r0, r4, #2
		SUB r1, r4, #1
		BL fibo
		ADD r0, r4, r0
		ADD r1, r4, r1
		ADD r0, r0, r1
		B Return
	EndIf:


	#pop the stack
	Return:
	LDR lr, [sp]
	LDR r4, [sp, #4]
	ADD sp, sp, #8
	MOV pc, lr
.data
	
