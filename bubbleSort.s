EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
EXIT_CODE_SUCCESS = 0
n_loop = 1000

.section .data
filename:   .asciz "inSort1Kx96b.bin"
buf:        .space 12000                  # miejsce na 96-bit (12 bajtów)
i_inc: .space 8
j_inc: .space 8

l1_1: .space 12
l1_2: .space 12
l1_3: .space 12
l2_1: .space 12
l2_2: .space 12
l2_3: .space 12


.section .text
.global _start

_start: 

mov $0,%eax
mov %eax, i_inc

mov $5, %eax
mov $filename, %ebx
mov $0, %ecx
int $0x80

mov %eax,%ebx

mov $3, %eax
mov $buf, %ecx
mov $12000, %edx
int $0x80



loop_i:#...........................................................
mov $buf,%esi
mov $0,%eax
mov %eax,j_inc

loop_j:
mov $buf,%esi
mov j_inc, %eax
mov $12,%ebx

imul %ebx

add %eax,%esi

mov (%esi),%eax
mov 4(%esi),%ebx
mov 8(%esi),%ecx

mov %esi,%edi
add $12,%edi

mov (%edi),%edx #liczba2
mov 4(%edi),%esp
mov 8(%edi),%ebp

befswp:

cmp %eax,%edx
ja swp
cmp %ebx,%esp
ja swp
cmp %ecx,%ebp
ja swp
swap:

continue:
mov (j_inc),%eax
inc %eax
mov %eax,j_inc

mov $999,%esp
sub i_inc,%esp
mov j_inc,%edx
cmp %esp,%edx
#...............................
jnz loop_j
loopEnd:
mov $0, %eax
mov %eax, j_inc
mov i_inc,%eax
inc %eax
mov %eax,i_inc

cmp $999,%eax #do 999 jmp if 999
jnz loop_i

mov $4, %eax          # sys_write
mov $1, %ebx          # stdout = 1
mov $buf, %ecx        # bufor do wypisania
mov $12000, %edx         # 12 bajtów
int $0x80


exit:
mov $EXIT_NR          , %eax
mov $EXIT_CODE_SUCCESS, %ebx
int $0x80

swp:

mov %edx,8(%esi)
mov %esp,4(%esi)
mov %ebp,(%esi)

mov %eax,8(%edi)
mov %ebx,4(%edi)
mov %ecx,(%edi)
jmp continue
