.386

.model flat, stdcall

.stack 4096

ExitProcess proto, dwExitCode:word

.data

array DWORD 1, 2, 3

 

.code

main proc

mov eax, [array]; copy the first value into EAX

xchg eax, [array+1]; exchange EAX with the value in the second position

xchg eax, [array+2]; exchange EAX with the value in the third position

mov [array], eax; copy the value in EAX to the first position of the array

invoke ExitProcess,0

main endp

end main