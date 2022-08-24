   ; NASM x86-64 assembly written for my Mac OSX 10.13 machine
   
   ; compile with: nasm -f macho64 -o 6.o 6.asm
   ; link with: ld 6.o -o 6 -lSystem -macosx_version_min 10.13 -no_pie -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
   ; run: ./6
   
    global  _main
    extern _printf
    default rel
    
    section     .text

_main:
    push   rbx                     ; align the stack

    mov    rdi, 100
    push   rdi
    call   sum_of_squares
    mov    r9, rax
    pop    rdi
    call   square_of_sum
    sub    rax, r9
    
    ; printf
    lea     rdi, [rel format]
    mov     rsi, rax                ; rsi is the register needed for printf
    call    _printf

    pop     rbx                     ; undo stack align

    ; exit program
    mov     rax, 0x02000001         ; system call for exit
    xor     rdi, rdi                ; exit code 0
    syscall                         ; invoke operating system to exit

square_of_sum:
    mov    rax, rdi      
    add    rdi, 1
    imul   rdi
    mov    rcx, 2
    idiv   rcx
    imul   rax
    ret

sum_of_squares:
    mov    rax, rdi
    push   rax
    add    rdi, 1
    mov    rcx, 2
    imul   rdi
    mov    r10, rax
    pop    rax
    imul   rcx
    add    rax, 1
    imul   r10
    mov    rcx, 6
    idiv   rcx
    ret


    section     .data
format:
    db  "%d", 0x0a, 0               ; printf format arguments
