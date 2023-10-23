.text

#decode(int buffer, int shift, int masc) -> int decod
#       $a0 4(sp)   $a1 8(sp)  $a2 12(sp)   $v0 0(sp)
decode:
    # prologo:
    addi $sp, $sp, -16   # ajustando a pilha
    sw $a0, 4($sp)       # 4($sp) = buffer
    sw $a0, 8($sp)       # 8($sp) = shift
    sw $a0, 12($sp)      # 12($sp) = masc

    # corpo
    lw $t0, 4($sp)       # t0 = buffer
    lw $t1, 8($sp)       # t1 = shift
    lw $t2, 12($sp)      # t2 = masc
    srlv $t0, $t0, $t1   # t0 = t0 >> t1
    and $t0, $t0, $t2    # t0 = t0 && t2
    sw $t0, 0($sp)       # decod = t0

    # epilogo
    lw $v0, 0($sp)       # v0 = decod
    addi $sp, $sp, 16    # reajustando a pilha
    jr $ra               # return decod
