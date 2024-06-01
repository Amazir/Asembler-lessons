; Michał Romaszewski, 2k212, 7 mar 2024	9.45
DATA1 segment
txt1 db "To jest napis! :)", 10, 13, '$'  ;deklaracja pierwszego napisu
txt2 db "To jest drugi napis", 10, 13, '$' ;deklaracja drugiego napisu
DATA1 ends

CODE1     segment
    ASSUME cs:CODE1, ds:DATA1, ss:STOS1
START:

    ;inicjalizacja stosu
    mov ax, seg STOS1
    mov ss,ax
    mov sp,offset top
    
    ;inicjalizacja segmentu danych
    mov ax, seg DATA1
    mov ds, ax
    
    ;inicjalizacja przełącznika
    mov bx, 0

    mov cx, 10 ;licznik pętli
    
petla: push cx
    call napis
    pop cx
    loop petla
    
    mov ax,4c00h
    int 21h
    
    ;wypisanie komunikatu na ekranie komunikatu
napis:
    cmp bx, 0
    je wypisz_txt1
    cmp bx, 1
    je wypisz_txt2
    jmp koniec_napis
    
wypisz_txt1:
    mov dx, offset txt1
    jmp wypisz_koniec
    
wypisz_txt2:
    mov dx, offset txt2
    
wypisz_koniec:
    mov ah, 9
    int 21h
    
    ;zmiana stanu przełącznika
    xor bx, 1

koniec_napis:
    ret
    
CODE1    ends

STOS1    segment STACK
    dw  256 dup(?)
top dw ? ;wierzchołek stosu
STOS1    ends

END START
