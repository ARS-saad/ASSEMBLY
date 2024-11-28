include emu8086.inc
org 100h

.data

.code
mov ax, @data
mov ds, ax

; get a input
print "Give a number: "
mov bl, 10

mov ah, 01h
int 21h
mul bl
mov cl, al
mov ah, 01h
int 21h
add al, cl

mov bl, 2
mov ah, 0
div bl   
cmp ah, 0  
jne odd
                                      
printn
print "It's a EVENT number"
jmp stp

odd:                      
printn
print "It's a ODD number"

stp: