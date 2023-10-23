.data
    filein: .asciiz "./teste.bin"
    fileout: .asciiz "./teste.txt"
    descrin: .word 0
    descrout: .word 0
    buffer: .space 4
    opcode: .word 0
    func: .word 0
    rs: .word 0
    rt: .word 0
    rd: .word 0
    shamt: .word 0
    imm: .word 0

.text

init:
    j main

fini:
    addiu $v0, $zero, 17
    syscall

# decodifica_campo(int buffer, int shift, int masc) -> int decod
#                  $a0 4(sp)   $a1 8(sp)  $a2 12(sp)   $v0 0(sp)
decodifica_campo:
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


# decodifica(void) -> void
decodifica:
    # prologo:
    addi $sp, $sp, -4    # ajustando pilha
    sw $ra, 0($sp)       # 0($sp) = $ra

    # mapa de memoria:
    la $s0, buffer
    la $s1, opcode
    la $s2, func
    la $s3, rs
    la $s4, rt
    la $s5, rd
    la $s6, shamt
    la $s7, imm

    # decodifica opcode
    # opcode = decodifica_campo(buffer, 26, 0x003f)
    lw $a0, 0($s0)
    addi $a1, $zero, 26
    addi $a2, $zero, 0x003f
    jal decodifica_campo
    sw $v0, 0($s1)

    # if(opcode == 0): decodifica_r
    beq $v0, $zero, decodifica_r

    # if(opcode < 4): decodifica_j
    slti $t0, $t0, 4
    bne $t0, $zero, decodifica_j

    # decodifica_i
    j decodifica_i

decodifica_r:
    # decodifica func
    # func = decodifica_campo(buffer, 0, 0x003f)
    lw $a0, 0($s0)
    addi $a1, $zero, 0
    addi $a2, $zero, 0x003f
    jal decodifica_campo
    sw $v0, 0($s2)

    # decodifica rs
    # rs = decodifica_campo(buffer, 21, 0x001f)
    lw $a0, 0($s0)
    addi $a1, $zero, 21
    addi $a2, $zero, 0x001f
    jal decodifica_campo
    sw $v0, 0($s3)
    
    # decodifica rt
    # rt = decodifica_campo(buffer, 16, 0x001f)
    lw $a0, 0($s0)
    addi $a1, $zero, 16
    addi $a2, $zero, 0x001f
    jal decodifica_campo
    sw $v0, 0($s4)
    
    # decodifica rd
    # rd = decodifica_campo(buffer, 11, 0x001f)
    lw $a0, 0($s0)
    addi $a1, $zero, 11
    addi $a2, $zero, 0x001f
    jal decodifica_campo
    sw $v0, 0($s5)

    # decodifica shamt
    # shamt = decodifica_campo(buffer, 6, 0x001f)
    lw $a0, 0($s0)
    addi $a1, $zero, 6
    addi $a2, $zero, 0x001f
    jal decodifica_campo
    sw $v0, 0($s6)
    
    # pula pro fim
    j decodifica_fim

decodifica_j:
    # decodifica imm
    # imm = decodifica_campo(buffer, 0, 0x03FFFFFF)
    lw $a0, 0($s0)
    addi $a1, $zero, 0
    lui $a2, 0x003f
    ori $a2, 0xffff
    jal decodifica_campo
    sw $v0, 0($s7)
    
    # pula pro fim
    j decodifica_fim

decodifica_i:
    # decodifica rs
    # rs = decodifica_campo(buffer, 21, 0x001f)
    lw $a0, 0($s0)
    addi $a1, $zero, 21
    addi $a2, $zero, 0x001f
    jal decodifica_campo
    sw $v0, 0($s3)
    
    # decodifica rt
    # rt = decodifica_campo(buffer, 16, 0x001f)
    lw $a0, 0($s0)
    addi $a1, $zero, 16
    addi $a2, $zero, 0x001f
    jal decodifica_campo
    sw $v0, 0($s4)

    # decodifica imm
    # imm = decodifica_campo(buffer, 0, 0xffff)
    lw $a0, 0($s0)
    addi $a1, $zero, 16
    addi $a2, $zero, 0xffff
    jal decodifica_campo
    sw $v0, 0($s7)
    
decodifica_fim:
    # epilogo:
    lw $ra, 0($sp)   # reajusta o endereco de retorno
    addi $sp, $sp, 4 # reajusta a pilha
    jr $ra           # volta pro procedimento chamador
