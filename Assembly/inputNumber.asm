.model small    

include emu8086.inc
org 100h

.data

res db ?
rem db ?

.code

main proc far

    mov ax, @data
    mov ds, ax

    mov ah, 00
    mov bl, 10

    mov ah, 01h
    int 21h
    sub al, 48
    mul bl
    mov cl, al

    mov ah, 01h
    int 21h
    sub al, 48
    add al, cl

    mov ah, 00
    mov bl, 10
    div bl
    mov res, al
    mov rem, ah  
    
    printn

    mov dl, res
    add dl, 48
    mov ah, 02h
    int 21h       
    
    printn

    mov dl, rem
    add dl, 48
    mov ah, 02h
    int 21h

main endp
end main