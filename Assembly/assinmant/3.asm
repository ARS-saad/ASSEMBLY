include emu8086.inc
org 100h

.data
coll db 50 dup(?)

.code
mov ax, @data
mov ds, ax

lea si, coll
mov si, 0
mov cl, 0

input:
mov ah, 01h
int 21h
cmp al, 13
je next_stp
sub al, 48
mov coll[si], al
inc si
inc cl
jmp input

next_stp:
printn
print "Enter to find a value: "
mov ah, 01h
int 21h
sub al, 48

mov si, 0

finding:
cmp coll[si], al
je finded
inc si
loop finding

printn
print "Not founded"
jmp stp

finded:
printn
print "founded"
    
stp:
