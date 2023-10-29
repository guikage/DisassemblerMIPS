.text

ori $a0, $a0, 0x0000ffff

neg16bits:
    # prologo:
    addi $sp, $sp, -8
    sw $a0, 0($sp)
    sw $ra, 4($sp)

    # corpo
    lw $t0, 0($sp)
    ori $t1, $zero, 0x0000f000
    slt $t1, $t0, $t1
    bne $t1, $zero, neg16bits_fim
    
    lui $t1, 0x0000ffff
    or $t0, $t1, $t0
    sw $t0, 0($sp)

neg16bits_fim:
    lw $v0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    #jr $ra
    
