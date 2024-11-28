.model small
.stack 100h

.data

inv db "Invalid message !!!$"
pas db "You pass this exam !!$"
fai db "You fail this exam !!$"

.code
main proc far
    mov ax, @data
    mov ds, ax

    mov ax, 457

    cmp ax, 0
    jl invalid

    cmp ax, 100
    jg invalid

    cmp ax, 40
    jge pass
    jl fail

    invalid:
    lea dx, inv
    mov ah, 09h
    int 21h
    jmp stop

    pass:
    lea dx, pas
    mov ah, 09h
    int 21h
    jmp stop

    fail:
    lea dx, fai
    mov ah, 09h
    int 21h

    stop:
    ret
main endp
end main
