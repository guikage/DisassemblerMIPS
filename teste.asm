addiu $sp, $sp, 0xfffffff8
addiu $t0, $zero, 0x00000005
sw $t0, 0x00000004($sp)
add $t0, $zero, $t0
jal 0x0040003c
lw $t0, 0x00000004($sp)
addu $v0, $zero, $v0
sw $v0, 0x00000000($sp)
addu $t0, $zero, $t0
addu $t1, $zero, $t1
jal 0x00400070
addiu $sp, $sp, 0x00000008
addiu $v0, $zero, 0x00000011
addiu $a0, $zero, 0x00000000
syscall
addiu $sp, $sp, 0xfffffff8
sw $ra, 0x00000004($sp)
sw $a0, 0x00000000($sp)
bne $zero, $a0, 0x00000002
addi $v0, $zero, 0x00000001
j 0x00400068
addi $a0, $a0, 0xffffffff
jal 0x0040003c
lw $a0, 0x00000000($sp)
mul $v0, $a0, $v0
lw $ra, 0x00000004($sp)
addi $sp, $sp, 0x00000008
jr $ra
addiu $sp, $sp, 0xfffffffc
sw $a0, 0x00000000($sp)
addiu $v0, $zero, 0x00000004
lui $at, 0x00001001
ori $a0, $at, 0x00000000
syscall
lw $a0, 0x00000000($sp)
addiu $v0, $zero, 0x00000001
syscall
lui $at, 0x00001001
ori $a0, $at, 0x0000000f
addiu $v0, $zero, 0x00000004
syscall
addu $a1, $zero, $a1
addiu $v0, $zero, 0x00000001
syscall
addiu $a0, $zero, 0x0000000a
addiu $v0, $zero, 0x0000000b
syscall
addiu $sp, $sp, 0x00000004
jr $ra
