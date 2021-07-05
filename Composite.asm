;TITLE Composite.asm     (Composite.asm)

; Author: Jawad Alamgir
; Last Modified: 07/27/2020
; OSU email address: alamgirj@oregonstate.edu
; Course number/section: (CS_271_X400_U2020)
; Assignment Number: Program 3                Due Date: 07/26/2020
; Description: This program takes integer input from the user in the range 1-400. The program then calculates
;			   and displays all of the composite numbers up to and including the nth composite. The numbers
;			   displayed are 10 per line.

INCLUDE Irvine32.inc

RANGE_MAX equ 400
RANGE_MIN equ 1

.data

;intro
intro			BYTE "Hi my name is Jawad Alamgir welcome to Composite.asm",0 ;	introduction for the program
spaces			BYTE "     ", 0

;outro
outro_prompt	BYTE "Thank you for using my program, I hope you have a great day", 0

;user_input
input_prompt	BYTE "Please enter a number in the range of 1-400 and I will display all composite numbers till your number", 0
user_num		DWORD ?

;range check
test_prompt		BYTE "The program reached start of check range function", 0
greater_prompt	BYTE "The number you have entered is greater than our range's upper limit(400).", 0
lesser_prompt	BYTE "The number you have entered is lesser than our range's lower limit(1).", 0

;composite calculations
current			DWORD 1
div_num			DWORD 0
.code

;Provide the user with instructions
introduction PROC
	mov edx, OFFSET intro
	call WriteString
	call Crlf
	ret
introduction ENDP

;Take input from user and call the validation function
get_user_data PROC
	mov edx, OFFSET input_prompt
	call WriteString
	call Crlf
	mov edx, OFFSET user_num
	call ReadInt
	mov user_num, eax
	call Crlf
	call check_range
	ret
get_user_data ENDP

;Assisting function for user input, validates that the input is in range
check_range PROC
	cmp eax, RANGE_MAX
	jg greater_than_range
	cmp eax, RANGE_MIN
	jl less_than_range
	jmp past_checks

greater_than_range:
	mov edx, OFFSET greater_prompt
	call WriteString
	call Crlf
	call get_user_data
	jmp past_checks

less_than_range:
	mov edx, OFFSET lesser_prompt
	call WriteString
	call Crlf
	call get_user_data

past_checks:
	ret
check_range ENDP

;Calculates and displays the sequence of composite number till user input
composite_calculate PROC
	;initialization
	mov eax, 0
	mov ebx, RANGE_MIN
	mov ecx, user_num
	mov esi, 10

composite_check:
	mov eax, current
	mov edx, 0
	div ebx
	cmp edx, 0
	je div_num_inc
	jmp current_inc
	ret

div_num_inc:
	inc div_num
	jmp current_inc

current_inc:
	dec ebx
	mov eax, ebx
	cmp eax, 0
	je check
	jmp composite_check

check:
	mov eax, div_num
	cmp eax, 2
	jg display_composite
	jmp next

next:
	mov div_num, 0
	inc current
	mov eax, current
	mov ebx, eax
	jmp composite_check

display_composite:
	mov div_num, 0
	mov eax, current
	inc current
	mov ebx, current
	call WriteDec
	dec esi
	jnz space
	cmp ecx, 1
	je last
	jmp new_line

loop_helper:
	loop composite_check

new_line:
	call Crlf
	mov esi, 10
	cmp ecx, 1
	je last
	jmp loop_helper

space:
	cmp ecx, 1
	je new_line
	mov edx, OFFSET spaces
	call WriteString
	mov eax, current
	mov ebx, eax
	dec ecx
	jmp composite_check

last:
	call Crlf
	call Crlf
	ret
composite_calculate ENDP

outro PROC
	mov edx, OFFSET outro_prompt
	call WriteString
	call Crlf
	ret
outro ENDP

main PROC

	call introduction
	call get_user_data
	call composite_calculate
	call outro

exit ;exit to operating system
main ENDP

END main
