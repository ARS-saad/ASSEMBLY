
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
.model small
.stack 100h

; add your code here
.data
res db ?
rem db ?

.code
main proc far
    mov ax, @data
    mov ds, ax

    mov ah, 01h
    int 21h
    sub al, 48
    mov cl, 10
    mul cl
    mov bl, al

    mov ah, 01h
    int 21h
    sub al, 48
    add al, bl

    mov ah, 0
    mov cl, 2
    div cl

    mov res, al
    mov rem, ah

    mov dl, res
    add dl, 48
    mov ah, 02h
    int 21h

    mov dl, rem
    add dl, 48
    mov ah, 02h
    int 21h
main endp
end main


