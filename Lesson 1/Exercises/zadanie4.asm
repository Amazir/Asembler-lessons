; Michał Romaszewski, 2k212, 7 mar 2024	9.45
DATA1 segment
cyfra  db  "Cyfra ", 0, '$'  
DATA1 ends

CODE1 segment
    ASSUME cs:CODE1, ds:DATA1, ss:STOS1
START:

    mov ax, seg STOS1
    mov ss, ax
    mov sp, offset top

    mov ax, seg DATA1
    mov ds, ax

    mov al, 3
    call wypisz_cyfre

    mov ax, 4c00h
    int 21h

wypisz_cyfre:
    mov dx, offset cyfra
    mov ah, 9
    int 21h

    add al, '0'       
    mov dl, al
    mov ah, 2
    int 21h

    mov dl, '.'
    int 21h

    mov dl, 13
    int 21h
    mov dl, 10
    int 21h
    ret

CODE1 ends

STOS1 segment STACK
    dw  256 dup(?)
top dw ? 
STOS1 ends

END START
