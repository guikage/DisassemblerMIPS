.data
    filein: .asciiz "./teste.bin"
    fileout: .asciiz "./teste.asm"
    descrin: .word 0
    descrout: .word 0
    buffer: .space 4
    erro_manipulacao: .ascizz "ERRO AO MANIPULAR O ARQUIVO!!"
    opcode: .word 0
    func: .word 0
    rs: .word 0
    rt: .word 0
    rd: .word 0
    shamt_imm: .word 0
    str_shamt_imm: .space 12
    str_inst: .space 60
    str_final: .space 120
    pcounter: .word 0x00400000
    str_pcounter: .space 12
    str_buffer: .space 12


str_montagem_final: .asciiz "& #$\n"
str_unk: .asciiz "inst. desconhecida"

# caracteres:
# #: str_1 rs/shamt
# $: str_2 rt
# %: str_3 rd/imm

# instrucoes por opcode
str_op_02: .asciiz "j %"
str_op_03: .asciiz "jal %"
str_op_04: .asciiz "beq #, $, %"
str_op_05: .asciiz "bne #, $, %"
str_op_06: .asciiz "blez #, %"
str_op_07: .asciiz "bgtz #, %"
str_op_08: .asciiz "addi $, #, %"
str_op_09: .asciiz "addiu $, #, %"
str_op_10: .asciiz "slti $, #, %"
str_op_11: .asciiz "sltiu $, #, %"
str_op_12: .asciiz "andi $, #, %"
str_op_13: .asciiz "ori $, #, %"
str_op_14: .asciiz "xori $, #, %"
str_op_15: .asciiz "lui $, %"
str_op_28: .asciiz "mul %, #, $"
str_op_29: .asciiz "mulu %, #, $"
str_op_32: .asciiz "lb $, %(#)"
str_op_33: .asciiz "lh $, %(#)"
str_op_34: .asciiz "lw $, %(#)"
str_op_36: .asciiz "lbu $, %(#)"
str_op_37: .asciiz "lhu $, %(#)"
str_op_40: .asciiz "sb $, %(#)"
str_op_41: .asciiz "sh $, %(#)"
str_op_43: .asciiz "sw $, %(#)"

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
.word str_op_28
.word str_op_29
.word str_unk
.word str_unk
.word str_op_32
.word str_op_33
.word str_op_34
.word str_op_34
.word str_op_36
.word str_op_37
.word str_unk
.word str_unk
.word str_op_40
.word str_op_41
.word str_unk
.word str_op_43

#instrucoes por func
str_func_00: .asciiz "sll %, $, #"
str_func_02: .asciiz "srl %, $, #"
str_func_03: .asciiz "sra %, $, #"
str_func_04: .asciiz "sllv %, $, #"
str_func_06: .asciiz "srlv %, $, #"
str_func_07: .asciiz "srav %, $, #"
str_func_08: .asciiz "jr #"
str_func_09: .asciiz "jalr %, #"
str_func_12: .asciiz "syscall"
str_func_16: .asciiz "mfhi %"
str_func_17: .asciiz "mthi #"
str_func_18: .asciiz "mflo %"
str_func_19: .asciiz "mtlo #"
str_func_24: .asciiz "mult #, $"
str_func_25: .asciiz "multu #, $"
str_func_26: .asciiz "div #, $"
str_func_27: .asciiz "divu #, $"
str_func_32: .asciiz "add %, #, $"
str_func_33: .asciiz "addu %, #, $"
str_func_34: .asciiz "sub %, #, $"
str_func_35: .asciiz "subu %, #, $"
str_func_36: .asciiz "and %, #, $"
str_func_37: .asciiz "or %, #, $"
str_func_38: .asciiz "xor %, #, $"
str_func_39: .asciiz "nor %, #, $"
str_func_42: .asciiz "slt %, #, $"
str_func_43: .asciiz "sltu %, #, $"

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
    
.text
    
init:
    j main

fini:
    addi $v0, $zero, 17     # SERVICO 17, ENCERRAR PROGRAMA
    addi $a0, $zero, 0         # O VALOR DE RETORNO DO PROGRAMA = 0
    syscall


# LEITURA!!
abre_leitura:
    addi $v0, $zero, 13         # INSTRUCAO PARA ABERTURA DE ARQ
    la $a0, filein             # a0 = CAMINHO DO ARQ
    move $a1, $zero         # a1 = 0 (LEITURA)
    syscall
    
    sw $v0, descrin            # descrin = $v0
    jr $ra                # RETURN

#le_in(void) -> bytes_lidos
le_in:
    addi $v0, $zero, 14     # INSTRUCAO PARA LEITURA
    lw $a0, descrin         # a0 = CABECALHO
    la $a1, buffer             # a1 = ENDERECO DO BUFFER
    addi $a2, $zero, 4         # a2 = 4 (TAMANHO DO BUFFER)
    syscall
    jr $ra                # RETURN
        
fecha_leitura:
    addi $v0, $zero, 16        # INSTRUCAO PARA FECHAMENTO DE ARQ
    lw $a0, descrin            # a0 = descrin
    syscall
    beq $v0, $zero, erro_arquivo      # VERIFICA SE O FECHAMENTO FOI BEM SUCEDIDO 
    jr $ra                # RETURN

# ESCRITA!              
abre_escrita:
    addi $v0, $zero, 13         # INSTRUCAO PARA ABERTURA DE ARQ
    la $a0, fileout         # a0 = CAMINHO DO ARQ
    addi $a1, $zero, 1         # a1 = 1 (ESCRITA)
    syscall    
    sw $v0, descrout        # descrout = $v0
    jr $ra                    # RETURN

escreve_out:
    addi $v0, $zero, 15
    lw $a0, descrout
    la $a1, buffer
    addi $a2, $zero, 4
    syscall
    jr $ra

#void writestr(char *str, int descriptor)
writestr:
    # prologo:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 0($sp)
    sw $a1, 4($sp)
    
    # corpo:
    lw $t0, 0($sp)
    lw $t1, 4($sp)

wstr_loop:
    addi $v0, $zero, 15
    addi $a0, $t1, 0
    addi $a1, $t0, 0
    addi $a2, $zero, 1
    syscall
    addi $t0, $t0, 1

wstr_loop_teste:
    lb $t2, 0($t0)
    bne $t2, $zero, wstr_loop

wstr_fim:
    # epilogo:
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra

fecha_escrita:
    addi $v0, $zero, 16        # INSTRUCAO PARA FECHAMENTO DE ARQ
    lw $a0, descrout        # a0 = descrout
    syscall
    beq $v0, $zero, erro_arquivo      # VERIFICA SE O FECHAMENTO FOI BEM SUCEDIDO 
    jr $ra                # RETURN

# DECODIFICACAO:
# int neg16toneg32(int num, int opcode) -> int num
#                  $a0 0sp  $a1 4sp        $v0 0sp
neg16bits:
    # prologo:
    addi $sp, $sp, -12
    sw $a0, 0($sp)
    sw $a1, 0($sp)
    sw $ra, 8($sp)

    # corpo
    # confere se op == andi/ori/xori/lui
    lw $t0, 4($sp)
    addi $t1, $zero, 12
    beq $t0, $t1, neg16bits_fim
    addi $t1, $t1, 1
    beq $t0, $t1, neg16bits_fim
    addi $t1, $t1, 1
    beq $t0, $t1, neg16bits_fim
    addi $t1, $t1, 1
    beq $t0, $t1, neg16bits_fim

    # confere se num >= 0xf000
    lw $t0, 0($sp)
    ori $t1, $zero, 0x0000f000
    slt $t1, $t0, $t1
    bne $t1, $zero, neg16bits_fim
    
    lui $t1, 0x0000ffff
    or $t0, $t1, $t0
    sw $t0, 0($sp)

neg16bits_fim:
    lw $v0, 0($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra

# decodifica_campo(int buffer, int shift, int masc) -> int decod
#                  $a0 4(sp)   $a1 8(sp)  $a2 12(sp)   $v0 0(sp)
decodifica_campo:
    # prologo:
    addi $sp, $sp, -16   # ajustando a pilha
    sw $a0, 4($sp)       # 4($sp) = buffer
    sw $a1, 8($sp)       # 8($sp) = shift
    sw $a2, 12($sp)      # 12($sp) = masc

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

# endereco_beq_bne(int pcounter, int imm) -> int loop
#                  $a0 4($sp)    $a1 8sp     $v0 0sp
endereco_beq_bne:
    # prologo:
    addi $sp, $sp, -16
    sw $a0, 4($sp)
    sw $a1, 8($sp)
    sw $ra, 12($sp)

    # corpo:
    lw $t0, 4($sp)    #t0 = pc
    lw $t1, 8($sp)    #t1 = imm
    sll $t1, $t1, 2   #imm *= 4
    addi $t0, $t0, 4  #pc += 4
    add $t0, $t0, $t1 #t0 = 4imm + pc + 4
    sw $t0, 0($sp)    #loop = t0

    # epilogo:
    lw $v0, 0($sp)
    lw $ra, 12($sp)
    addi $sp, $sp, 16
    jr $ra

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
    la $s6, shamt_imm
    la $s7, pcounter

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
    slti $t0, $v0, 4
    bne $t0, $zero, decodifica_j

    # if(opcode == 28 || opcode == 29): decodifica_r_mul
    addi $t0, $zero, 28
    beq $v0, $t0, decodifica_r_mul
    addi $t0, $zero, 29
    beq $v0, $t0, decodifica_r_mul

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

decodifica_r_mul:
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
    sll $v0, $v0, 2
    sw $v0, 0($s6)
    
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
    addi $a1, $zero, 0
    addi $a2, $zero, 0xffff
    jal decodifica_campo
    sw $v0, 0($s6)

    # transforma imm em negativo de 32 bits
    # imm = neg16bits(imm)
    lw $a0, 0($s6)
    lw $a1, 0($s1)
    jal neg16bits
    sw $v0, 0($s6)

    # verifica se opcode < 8
    lw $t0, 0($s1)
    slti $t0, $t0, 8
    beq $t0, $zero, decodifica_fim

decodifica_beq_bne:
    lw $a0, 0($s7)
    lw $a1, 0($s6)
    jal endereco_beq_bne
    sw $v0, 0($s6)
    
decodifica_fim:
    # cria string com imm/shamt
    lw $a0, 0($s6)
    la $a1, str_shamt_imm
    jal hextostr

    # epilogo:
    lw $ra, 0($sp)   # reajusta o endereco de retorno
    addi $sp, $sp, 4 # reajusta a pilha
    jr $ra           # volta pro procedimento chamador

# MANIPULACAO DE STRING!!

#void hextostr(int num, char *str)
#              $a0,     $a1
hextostr:
    # prologo:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 0($sp)
    sw $a1, 4($sp)

    # corpo:
    lw $t0, 0($sp)      # $t0 = num
    addi $t1, $zero, 8  # $t1 = i
    lw $t2, 4($sp)      # $t2 = str[i+2]
    addi $t3, $zero, 48
    sb $t3, 0($t2)      # str[0] = '0'
    addi $t3, $zero, 120
    sb $t3, 1($t2)      # str[1] = 'x'
    sb $zero, 10($t2)   # str[10] = '\0'
    addi $t2, $t2, 9   # i = 8
    j hextostr_loop_teste

hextostr_loop:
    #$t3 = $t0 || 0xf
    andi $t3, $t0, 0xf
    
    hextostr_if:
    #if (9 < t3)
    addi $t4, $zero, 9
    slt $t4, $t4, $t3
    bne $t4, $zero, hextostr_if_v

    hextostr_if_f:
    addi $t3, $t3, 48
    j hextostr_if_fim

    hextostr_if_v:
    addi $t3, $t3, 87

    hextostr_if_fim:
    sb $t3, 0($t2)
    #num /= 16
    srl $t0, $t0, 4
    #i--
    addi $t1, $t1, -1
    addi $t2, $t2, -1
    
hextostr_loop_teste:
    #while (0 < i)
    slt $t3, $zero, $t1
    bne $t3, $zero, hextostr_loop

hextostr_fim:
    # epilogo:
    lw $ra, 8($sp)
    addi $sp, $sp, 12
    jr $ra

# char *str_copia(char *str_inicio, char *str_origem) -> char *str_fim
str_copia:
    # prologo:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 0($sp)
    sw $a1, 4($sp)
    
    # corpo:
    lw $t0, 0($sp)
    lw $t1, 4($sp)

str_copia_loop:
    lb $t2, 0($t1)
    sb $t2, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1

str_copia_loop_teste:
    lb $t2, 0($t1)
    bne $t2, $zero, str_copia_loop

str_copia_fim:
    # epilogo:
    lw $ra, 8($sp)
    move $v0, $t0
    addi $sp, $sp, 12
    jr $ra

# void str_monta_inst(char *str_montagem, char *str_1, char *str_2, char *str_3)
str_monta_inst:
    # prologo:
    addi $sp, $sp, -20 #ajustando a pilha
    sw $ra, 16($sp)    #16(sp) = ra
    sw $a0, 0($sp)     #00(sp) = str_montagem
    sw $a1, 4($sp)     #04(sp) = str_1
    sw $a2, 8($sp)     #08(sp) = str_2
    sw $a3, 12($sp)    #12(sp) = str_3
    
    # corpo:
    la $t0, str_inst
    lw $t1, 0($sp)

str_monta_inst_loop:
str_monta_inst_if:
    #if (str_montagem[i] == '#')
    lb $t3, 0($t1)
    addi $t4, $zero, 35
    beq $t3, $t4, str_monta_inst_switch_1
    #if (str_montagem[i] == '$')
    addi $t4, $t4, 1
    beq $t3, $t4, str_monta_inst_switch_2
    #if (str_montagem[i] == '%')
    addi $t4, $t4, 1
    beq $t3, $t4, str_monta_inst_switch_3
    j str_monta_inst_if_f

str_monta_inst_switch_1:
    lw $a1, 4($sp)
    j str_monta_inst_switch_fim

str_monta_inst_switch_2:
    lw $a1, 8($sp)
    j str_monta_inst_switch_fim

str_monta_inst_switch_3:
    lw $a1, 12($sp)
    j str_monta_inst_switch_fim

str_monta_inst_switch_fim:
    sw $t1, 0($sp)
    move $a0, $t0
    jal str_copia
    addi $t0, $v0, 0
    lw $t1, 0($sp)
    addi $t1, $t1, 1
    j str_monta_inst_loop_teste

str_monta_inst_if_f:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1

str_monta_inst_loop_teste:
    lb $t3, 0($t1)
    bne $t3, $zero, str_monta_inst_loop

str_monta_inst_fim:
    sb $zero, 0($t0)
    # epilogo:
    lw $ra, 16($sp)
    addi $sp, $sp, 20
    jr $ra

str_escolhe_inst:
    # prologo:
    addi $sp, $sp, -4    # ajustando pilha
    sw $ra, 0($sp)       # 0($sp) = $ra

    # mapa de memoria:
    la $s2, opcode
    la $s3, func
    la $s4, rs
    la $s5, rt
    la $s6, rd
    la $s7, str_shamt_imm

    # corpo:
    lw $t0, 0($s2)
    beq $t0, $zero, str_escolhe_inst_r

    la $s0, str_op_vet
    la $s1, str_reg_vet

    # a0 = string_montagem
    sll $t0, $t0, 2
    add $a0, $s0, $t0
    lw $a0, 0($a0)
    
    # se op == 28 || op == 29 -> mul
    srl $t0, $t0, 2
    addi $t1, $zero, 28
    beq $t0, $t1, str_escolhe_inst_r_mul
    addi $t1, $t1, 1
    beq $t0, $t1, str_escolhe_inst_r_mul

    # a1 = str_1 ($rs)
    lw $t0, 0($s4)
    sll $t0, $t0, 2
    add $a1, $s1, $t0
    lw $a1, 0($a1)
    
    # a2 = str_2 ($rt)
    lw $t0, 0($s5)
    sll $t0, $t0, 2
    add $a2, $s1, $t0
    lw $a2, 0($a2)
    
    # a3 = str_3 (imm)
    addi $a3, $s7, 0

    j str_escolhe_inst_fim

str_escolhe_inst_r:
    la $s0, str_func_vet
    la $s1, str_reg_vet

    # a0 = string_montagem
    lw $t0, 0($s3)
    sll $t0, $t0, 2
    add $a0, $s0, $t0
    lw $a0, 0($a0)

    str_escolhe_inst_r_mul:

    # a1 = str_1 ($rs)
    lw $t0, 0($s4)
    sll $t0, $t0, 2
    add $a1, $s1, $t0
    lw $a1, 0($a1)
    
    # a2 = str_2 ($rt)
    lw $t0, 0($s5)
    sll $t0, $t0, 2
    add $a2, $s1, $t0
    lw $a2, 0($a2)
    
    # a3 = str_3 ($rd)
    lw $t0, 0($s6)
    sll $t0, $t0, 2
    add $a3, $s1, $t0
    lw $a3, 0($a3)

    # if (0 < opcode) -> str_escolhe_inst_fim
    lw $t0, 0($s2)
    slt $t0, $zero, $t0
    bne $t0, $zero, str_escolhe_inst_fim

    # if (func < 4)
    lw $t0, 0($s3)
    slti $t1, $t0, 4
    beq $t1, $zero, str_escolhe_inst_fim

    # a1 = str_1 (shamt)
    addi $a3, $s7, 0

str_escolhe_inst_fim:
    jal str_monta_inst

    # epilogo:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

str_monta_final:
    # prologo:
    addi $sp, $sp, -8    # ajustando pilha
    sw $ra, 4($sp)       # 0($sp) = $ra
    
    # corpo:
    # configurando str_pcounter
    la $a0, pcounter
    lw $a0, 0($a0)
    la $a1, str_pcounter
    jal hextostr
    
    # configurando str_buffer
    la $a0, buffer
    lw $a0, 0($a0)
    la $a1, str_buffer
    jal hextostr

    la $t0, str_final
    la $t1, str_montagem_final

str_monta_final_loop:
str_monta_final_if:
    #if (str_montagem[i] == '$')
    lb $t3, 0($t1)
    addi $t4, $zero, 36
    beq $t3, $t4, str_monta_final_switch_1
    #if (str_montagem[i] == '%')
    addi $t4, $t4, 1
    beq $t3, $t4, str_monta_final_switch_2
    #if (str_montagem[i] == '&')
    addi $t4, $t4, 1
    beq $t3, $t4, str_monta_final_switch_3
    j str_monta_final_if_f

str_monta_final_switch_1:
    la $a1, str_pcounter
    j str_monta_final_switch_fim

str_monta_final_switch_2:
    la $a1, str_buffer
    j str_monta_final_switch_fim

str_monta_final_switch_3:
    la $a1, str_inst
    j str_monta_final_switch_fim

str_monta_final_switch_fim:
    sw $t1, 0($sp)
    move $a0, $t0
    jal str_copia
    addi $t0, $v0, 0
    lw $t1, 0($sp)
    addi $t1, $t1, 1
    j str_monta_final_loop_teste

str_monta_final_if_f:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1

str_monta_final_loop_teste:
    lb $t3, 0($t1)
    bne $t3, $zero, str_monta_final_loop

str_monta_final_fim:
    sb $zero, 0($t0)

    # epilogo:
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra

# INCREMENTA PC!!
incrementa_pc:
    la $s0, pcounter
    lw $t0, 0($s0)
    addi $t0, $t0, 4
    sw $t0, 0($s0)
    jr $ra

# LOOP PARA LEITURA!!
loop:
    # prologo:
    addi $sp, $sp, -4 # ajustando pilha
    sw $ra, 0($sp)    # guardando endereco de retorno
    
loop_1:
    jal le_in
    j loop_teste

loop_teste:
    addi $t0, $zero, 4
    bne $v0, $t0, loop_fim

loop_2:
    jal decodifica
    jal str_escolhe_inst
    jal str_monta_final
    la $a0, str_final
    la $a1, descrout
    lw $a1, 0($a1)
    jal writestr
    jal incrementa_pc
    j loop_1
    
erro_arquivo:
    addi $v0, $zero, 4            # IMPRIMIR STRING
    la $a0, erro_manipulacao        # MENSAGEM DE ERRO AO USUARIO
    syscall

loop_fim:
    # epilogo:
    lw $ra, 0($sp)   # RECUPERANDO END DE RETORNO
    addi $sp, $sp, 4 # REAJUSTANDO PILHA
    jr $ra

main:
    jal abre_leitura
    jal abre_escrita
    jal loop
    jal fecha_leitura
    jal fecha_escrita
    j fini
