include emu8086.inc
org 100h

.data
number db ?

.code
mov ax, @data
mov ds, ax

mov bl, 10

print "Enter a number: "
mov ah, 01h
int 21h
sub al, 48
mul bl
mov cl, al

mov ah, 01h
int 21h
sub al, 48
add al, cl

mov number, al
mov bl, 2

prime:
mov ah, 00
mov al, number
div bl
cmp ah, 00
je not_prime
inc bl
cmp bl, number
jl prime
printn
print "This is a prime number"
jmp stop

not_prime:
printn
print "This is not a prime number"

stop: