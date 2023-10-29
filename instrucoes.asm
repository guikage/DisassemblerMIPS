.data
str_unk: .asciiz "unknown"

# instrucoes por opcode
str_op_02: .asciiz "j %"
str_op_03: .asciiz "jal %"
str_op_04: .asciiz "beq %, %, %"
str_op_05: .asciiz "bne %, %, %"
str_op_06: .asciiz "blez %, %"
str_op_07: .asciiz "bgtz %, %"
str_op_08: .asciiz "addi %, %, %"
str_op_09: .asciiz "addiu %, %, %"
str_op_10: .asciiz "slti %, %, %"
str_op_11: .asciiz "sltiu %, %, %"
str_op_12: .asciiz "andi %, %, %"
str_op_13: .asciiz "ori %, %, %"
str_op_14: .asciiz "xori %, %, %"
str_op_15: .asciiz "lui %, %"
str_op_32: .asciiz "lb %, %(%)"
str_op_33: .asciiz "lh %, %(%)"
str_op_34: .asciiz "lw %, %(%)"
str_op_36: .asciiz "lbu %, %(%)"
str_op_37: .asciiz "lhu %, %(%)"
str_op_40: .asciiz "sb %, %(%)"
str_op_41: .asciiz "sh %, %(%)"
str_op_43: .asciiz "sw %, %(%)"

str_op_vet:
.word str_unk
.word str_unk
.word str_op_02
.word str_op_03
.word str_op_04
.word str_op_05
.word str_op_06
.word str_op_07
.word str_op_08
.word str_op_09
.word str_op_10
.word str_op_11
.word str_op_12
.word str_op_13
.word str_op_14
.word str_op_15
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_op_32
.word str_op_33
.word str_op_34
.word str_unk
.word str_op_36
.word str_op_37
.word str_unk
.word str_unk
.word str_op_40
.word str_op_41
.word str_unk
.word str_op_43

#instrucoes por func
str_func_00: .asciiz "sll %, %, %"
str_func_02: .asciiz "srl %, %, %"
str_func_03: .asciiz "sra %, %, %"
str_func_04: .asciiz "sllv %, %, %"
str_func_06: .asciiz "srlv %, %, %"
str_func_07: .asciiz "srav %, %, %"
str_func_08: .asciiz "jr %"
str_func_09: .asciiz "jalr %, %"
str_func_12: .asciiz "syscall"
str_func_16: .asciiz "mfhi %"
str_func_17: .asciiz "mthi %"
str_func_18: .asciiz "mflo %"
str_func_19: .asciiz "mtlo %"
str_func_24: .asciiz "mult %, %"
str_func_25: .asciiz "multu %, %"
str_func_26: .asciiz "div %, %"
str_func_27: .asciiz "divu %, %"
str_func_32: .asciiz "add %, %, %"
str_func_33: .asciiz "addu %, %, %"
str_func_34: .asciiz "sub %, %, %"
str_func_35: .asciiz "subu %, %, %"
str_func_36: .asciiz "and %, %, %"
str_func_37: .asciiz "or %, %, %"
str_func_38: .asciiz "xor %, %, %"
str_func_39: .asciiz "nor %, %, %"
str_func_42: .asciiz "slt %, %, %"
str_func_43: .asciiz "sltu %, %, %"

str_func_vet:
.word str_func_00
.word str_unk
.word str_func_02
.word str_func_03
.word str_func_04
.word str_unk
.word str_func_06
.word str_func_07
.word str_func_08
.word str_func_09
.word str_unk
.word str_unk
.word str_func_12
.word str_unk
.word str_unk
.word str_unk
.word str_func_16
.word str_func_17
.word str_func_18
.word str_func_19
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_func_24
.word str_func_25
.word str_func_26
.word str_func_27
.word str_unk
.word str_unk
.word str_unk
.word str_unk
.word str_func_32
.word str_func_33
.word str_func_34
.word str_func_35
.word str_func_36
.word str_func_37
.word str_func_38
.word str_func_39
.word str_unk
.word str_unk
.word str_func_42
.word str_func_43

#registradores
str_reg_00: .asciiz "$zero"
str_reg_01: .asciiz "$at"
str_reg_02: .asciiz "$v0"
str_reg_03: .asciiz "$v1"
str_reg_04: .asciiz "$a0"
str_reg_05: .asciiz "$a1"
str_reg_06: .asciiz "$a2"
str_reg_07: .asciiz "$a3"
str_reg_08: .asciiz "$t0"
str_reg_09: .asciiz "$t1"
str_reg_10: .asciiz "$t2"
str_reg_11: .asciiz "$t3"
str_reg_12: .asciiz "$t4"
str_reg_13: .asciiz "$t5"
str_reg_14: .asciiz "$t6"
str_reg_15: .asciiz "$t7"
str_reg_16: .asciiz "$s0"
str_reg_17: .asciiz "$s1"
str_reg_18: .asciiz "$s2"
str_reg_19: .asciiz "$s3"
str_reg_20: .asciiz "$s4"
str_reg_21: .asciiz "$s5"
str_reg_22: .asciiz "$s6"
str_reg_23: .asciiz "$s7"
str_reg_24: .asciiz "$t8"
str_reg_25: .asciiz "$t9"
str_reg_26: .asciiz "$k0"
str_reg_27: .asciiz "$k1"
str_reg_28: .asciiz "$gp"
str_reg_29: .asciiz "$sp"
str_reg_30: .asciiz "$fp"
str_reg_31: .asciiz "$ra"

str_reg_vet:
.word str_reg_00
.word str_reg_01
.word str_reg_02
.word str_reg_03
.word str_reg_04
.word str_reg_05
.word str_reg_06
.word str_reg_07
.word str_reg_08
.word str_reg_09
.word str_reg_10
.word str_reg_11
.word str_reg_12
.word str_reg_13
.word str_reg_14
.word str_reg_15
.word str_reg_16
.word str_reg_17
.word str_reg_18
.word str_reg_19
.word str_reg_20
.word str_reg_21
.word str_reg_22
.word str_reg_23
.word str_reg_24
.word str_reg_25
.word str_reg_26
.word str_reg_27
.word str_reg_28
.word str_reg_29
.word str_reg_30
.word str_reg_31
