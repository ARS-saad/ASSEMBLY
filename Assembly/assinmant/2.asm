.model small
.stack 100h

.data

str1 db "* $"
str2 db 10, 13, "$"

.code
main proc far

    mov ax, @data
    mov ds, ax

    mov cx, 5

    l1:
        mov bx, cx
        l2:
            lea dx, str1
            mov ah, 09h
            int 21h
            dec bx
            cmp bx, 0
            jge l2
        lea dx, str2
        mov ah, 09h
        int 21h
        dec cx
        cmp cx, 0
        jge l1

main endp
end main
