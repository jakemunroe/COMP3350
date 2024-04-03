; Author: Jacob Munroe
; Last Modified: 10/14/2022
;
; This program takes elements from an input array and outputs them
; to a shifted array of some specified amount.

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.data
    shift dword 2
    input byte 1,3,5,7,9,11,12
    output byte lengthof input dup(?)	
.code
    main proc
			mov ecx, lengthof input ;This loop will iterate length - shift times
			sub ecx, shift ;This loop will place the 'non-wrapped' values
			mov edi, shift ;Start writing from input at shift
			mov esi, 0 ;Start reading at 0
    l1:	
				mov al, input[esi] ;Move the value from input into al
				mov output[edi], al	;Move the value from al into output
				inc esi	;Increment the input index
				inc edi	;Increment the output index
    	loop l1

			mov ecx, shift ;This loop will iterate shift times
			mov esi, lengthof input ;Start reading at index length - shift
			mov edi, 0 ;Start writing at index 0  
			sub esi, shift ;This loop will place the 'wrapped' values
    l2:	
				mov al, input[esi] ;Move the value from input into al
				mov output[edi], al	;Move the value from al into output
				inc esi	;Increment the input index
				inc edi	;Increment the output index
	loop l2

INVOKE ExitProcess,0
main ENDP
END main

