; Michał Romaszewski, 2k212, 7 mar 2024	9.45
DATA1 segment
tekst1 db  "    0000", 10, 13, '$'  
tekst2 db  "1111", 10, 13, '$'    
DATA1 ends

CODE1 segment
    ASSUME cs:CODE1, ds:DATA1, ss:STOS1
START:

    mov ax, seg STOS1
    mov ss, ax
    mov sp, offset top

    mov ax, seg DATA1
    mov ds, ax

    mov cx, 3 
    
outer_loop:
    mov bx, 3 
    
inner_loop:
    mov dx, offset tekst1
    call wypisz
    dec bx
    jnz inner_loop

    mov dx, offset tekst2
    call wypisz

    mov dx, offset tekst1
    call wypisz

    loop outer_loop

    mov ax, 4c00h
    int 21h

wypisz:
    mov ah, 9
    int 21h
    ret

CODE1 ends

STOS1 segment STACK
    dw  256 dup(?)
top dw ? 
STOS1 ends

END START
