; Michał Romaszewski, 2k212, 7 mar 2024	9.45
DATA1 segment
DATA1 ends

CODE1 segment
    ASSUME cs:CODE1, ds:DATA1, ss:STOS1
START:

    mov ax, seg STOS1
    mov ss, ax
    mov sp, offset top

    mov ax, seg DATA1
    mov ds, ax

    mov ah, 01h
    int 21h

    mov dl, al
    mov ah, 02h
    int 21h 

    mov ax, 4c00h
    int 21h

CODE1 ends

STOS1 segment STACK
    dw  256 dup(?)
top dw ? 
STOS1 ends

END START
