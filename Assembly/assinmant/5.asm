include emu8086.inc
org 100h

.data
inputs db 50 dup(?)
iterator dw 0

.code
mov ax, @data
mov ds, ax

main proc

    lea si, inputs
    mov si, 0
    mov cx, 0
    print "Give some string: "
    
    input:
    mov ah, 01h
    int 21h
    cmp al, 13
    je next
    mov inputs[si], al
    inc si
    inc cx
    jmp input
        
    next: 
    mov iterator, cx
     
    printn
    print "For upper case : 1"
    printn 
    print "For lower case : 2"
    printn
    print "Chose one : " 
    mov ah, 01h
    int 21h   
    sub al, 48
    cmp al, 1
    je upp
    cmp al, 2
    je low                    
    printn
    print "This is not define"
    printn
    jmp next
            
    upp:
    mov si, 0
    mov cx, iterator
    update1:
    cmp inputs[si], 60h
    jl skp
    sub inputs[si], 20h
    skp:     
    inc si
    loop update1
    jmp ending
    
    low:       
    mov si, 0
    mov cx, iterator
    update2:
    cmp inputs[si], 60h
    jg skp1
    add inputs[si], 20h
    skp1:           
    inc si
    loop update2
    
    ending:
    printn
    mov si, 0
    mov cx, iterator
    dis:
    mov dl, inputs[si]
    mov ah, 02h 
    int 21h  
    inc si
    loop dis

endp main    