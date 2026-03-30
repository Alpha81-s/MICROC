.data

a: .word 0
b: .word 0

.text
.global main

main:
ADDI r1, r0, 0
ADDI r2, r0, 0

read:
LA t0, 0x10000000
PUTS t0
GETI r1
BLT r1, r0, read

loop:
ADDI r9, r0, 1
MUL r9, r9, r1
PUTI r1
LA t0, 0x10000004
PUTS t0
ADDI r4, r0, 2
DIV r5, r1, r4
MUL r6, r5, r4
SUB r7, r1, r6
BEQ r7, r0, even

odd:
ADD r8, r1 ,r1
ADD r8, r8, r1
ADDI r1, r8, 1
J update

even:
ADD r1, r5, r0

update:
ADDI r2, r2, 1
J loop
stop:
PUTI r1
LA t0, 0x10000004
PUTS t0
PUTI r2
LA t0, 0x10000004
PUTS t0
HALT

.section .strings
0x10000000 "Enter a positive integer n: "
0x10000004 "\n"