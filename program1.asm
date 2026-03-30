.data

a: .word 0
b: .word 0

.text
.global main


main:
GETI r1
LA r10, a
SW r1, 0(r10)
GETI r2
LA r11, b
SW r2, 0(r11)
BLT r1, r2, print_lower
BEQ r1, r2, print_equal
J print_higher

print_lower:
LA t0, 0x10000000
PUTS t0
J stop

print_equal:
LA t0, 0x10000004
PUTS t0
J stop

print_higher:
LA t0, 0x10000008
PUTS t0
J stop

stop:
PUTS r3
HALT 


.section .strings
0x10000000 "a is less than b\n"
0x10000004 "a is equal to b\n"
0x10000008 "a is greater than b\n"
