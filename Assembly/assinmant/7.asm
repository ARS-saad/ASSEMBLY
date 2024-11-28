
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include emu8086.inc
org 100h

; add your code here
.data
user db "cse$"
pass db "123"
user1 db 50 dup(?) 
pass1 db 50 dup(?)

.code
mov ax, @data
mov ds, ax

lea si, user1
mov si, 0

print "Enter a user name: "
input:
mov ah, 01h
int 21h
mov user1[si], al
inc si
cmp si, 3
jl input

mov cx, 3
lea si, user
lea di, user1

repe cmpsb
jne not_match

lea si, pass1
mov si, 0
printn
print "Enter a password: "
 
input1:
mov ah, 01h
int 21h
mov pass1[si], al
inc si
cmp si, 3
jl input1

mov cx, 3
lea si, pass
lea di, pass1

repe cmpsb
jne not_match

printn
print "Match"
jmp stp   
    
not_match:
printn
print "Not match"
    
stp:

ret




