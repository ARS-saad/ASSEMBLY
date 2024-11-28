include emu8086.inc      
org 100h

.data

.code 
mov ax, @data
mov ds, ax

mov cl, 5
input:
mov ah, 01h
int 21h
sub al, 48
mov bl, al
push bx
loop input

printn

mov cl, 5
output:
pop dx
add dx, 48
mov ah, 02h
int 21h
loop output