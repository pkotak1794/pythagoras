; ========1========2========3========4========5========6========7========8========9
;
; Author Information
    ; Name: Priyanka Lee
    ; Email: priyankaaax3@csu.fullerton.edu
;
; Program Information
    ; Program Name: Pythagoras 
    ; Programming Languages: One module in x86 and one module in C++
    ; Date Last Updated: 02/02/2023
;
; ========Begin Code Area===========================================================

extern printf
extern scanf
max equ 20

global hypotenuse

; declaration of initialized data
segment .data

prompt1 db "Enter the length of the first side of the triangle: ", 10, 0
prompt2 db "Enter the length of the second side of the triangle: ", 10, 0

; user input declarations
double_float db "%lf", 0
confirm db "You entered %1.6lf and %1.6lf", 10, 0
output_hypot db "The hypotenuse is %1.6lf", 10, 0

segment .bss
; empty

segment .text

hypotenuse:

; backup of general purpose registers 
push rbp
mov rbp, rsp
push rdi                                ; backup rdi
push rsi                                ; backup rsi
push rdx                                ; backup rdx
push rcx                                ; backup rcx
push r8                                 ; backup r8
push r9                                 ; backup r9
push r10                                ; backup r10
push r11                                ; backup r11
push r12                                ; backup r12
push r13                                ; backup r13
push r14                                ; backup r14
push r15                                ; backup r15
push rbx                                ; backup rbx
pushf                                   ; backup rflags 

push qword 99                           ; registers rax, rip, and rsp are not backed up

; output instructions for user
push qword 99
mov rax, 0                              ; 0 is copied into rax because no xmm registers are used
mov rdi, prompt1                        ; displays request for 1st side of triangle
call printf
pop rax

; input first side of triangle
push qword 99
mov rax, 0
mov rdi, double_float                   ; format of user input 
mov rsi, rsp
call scanf
movsd xmm12, [rsp]                      ; dereferences pointer
pop rax                                 ; balances pushed qword from above

; output instructions for user
push qword 99
mov rax, 0
mov rdi, prompt2                        ; displays request for 2nd side of triangle
call printf
pop rax

; input second side of triangle
push qword 99
mov rax, 0
mov rdi, double_float
mov rsi, rsp
call scanf
movsd xmm13, [rsp]
pop rax

; block to confirm 2 recent inputs
push qword 99
mov rax, 2                                 ; two inputs in xmm registers
mov rdi, confirm
movsd xmm0, xmm12                          ; copy 1st number into xmm0
movsd xmm1, xmm13                          ; copy 2nd  number into xmm1
call printf
pop rax

; calculate hypotenuse c = sqrt(a^2 + b^2)
; a = xmm12, b = xmm13

; a^2, b^2
mulsd xmm12, xmm12                          ; 2*a
mulsd xmm13, xmm13                          ; 2*b

; a^2 + b^2
addsd xmm13, xmm12                          ; xmm13 = a^2 + b^2

; sqrt(a^2+b^2)
sqrtsd xmm15, xmm13                         ; xmm15 = sqrt(xmm13) = c 

; output hypotenuse calculation
push qword 99
mov rax, 1
mov rdi, output_hypot
movsd xmm0, xmm15
call printf
pop rax

movsd xmm0, xmm15                           ; save hypotenuse in xmm0 

pop rax

; restore r registers
popf                                        ; restore rflags
pop rbx                                     ; restore rbx
pop r15                                     ; restore r15
pop r14                                     ; restore r14
pop r13                                     ; restore r13
pop r12                                     ; restore r12
pop r11                                     ; restore r11
pop r10                                     ; restore r10
pop r9                                      ; restore r9
pop r8                                      ; restore r8
pop rcx                                     ; restore rcx
pop rdx                                     ; restore rdx
pop rsi                                     ; restore rsi
pop rdi                                     ; restore rdi
pop rbp                                     ; restore rbp

ret                                         ; return
