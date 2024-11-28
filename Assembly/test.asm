.model small
.stack 100h

.data
str1 db "Hello world", "$"

.code 
main proc far
    mov ax, @data
    mov ds, ax

    lea dx, str1
    mov ah, 09h
    int 21h

    mov ah,02h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    mov ah, 01h
    int 21h
    mov bl, al

    mov ah, 02h  ;for new line
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h

    mov ah, 02h
    mov dl, bl
    int 21h

main endp
end main
