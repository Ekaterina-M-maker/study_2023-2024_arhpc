%include 'in_out.asm'
section .data
    msg1 db "Наименьшее число: ",0h
    a dd 33
    b dd 40
    c dd 52
section .bss
    min resb 10
section .text
global _start
_start:
    mov ecx, [a]
    mov [min], ecx ; 'min = A'
    ; ---------- Сравниваем 'A' и 'С' (как числа)
    cmp ecx, [c] ; Сравниваем 'A' и 'С'
    jl check_B ; если 'A<C', то переход на метку 'check_B',
    mov ecx, [c] ; иначе 'ecx = C'
    mov [min], ecx ; 'min = C'
; ---------- Преобразование 'min(A,C)' из символа в число
check_B:
    ; ---------- Сравниваем 'min(A,C)' и 'B' (как числа)
    mov ecx, [min]
    cmp ecx, [b] ; Сравниваем 'min(A,C)' и 'B'
    jl fin ; если 'min(A,C)>B', то переход на 'fin',
    mov ecx, [b] ; иначе 'ecx = B'
    mov [min], ecx
; ---------- Вывод результата
fin:
    mov eax, msg1
    call sprint
    mov eax,[min]
    call iprintLF ; Вывод 'min(A,B,C)'
    call quit ; Выход
