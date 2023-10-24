.data
    filein: .asciiz "./teste.bin"
    fileout: .asciiz "./teste.txt"
    descrin: .word 0
    descrout: .word 0
    buffer: .space 4
    erro_manipulacao: .ascizz "ERRO AO MANIPULAR O ARQUIVO!!"
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
    addi $v0, $zero, 17 # serviço 17 - exit 2
    addi $a0, $zero, 0 # o valor de retorno do programa é 0 - 
    syscall


# LEITURA!!
abre_in:
	addi $v0, $zero, 13 		# INSTRUCAO PARA ABERTURA DE ARQ
	la $a0, filein 			# a0 = CAMINHO DO ARQ
	move $a1, $zero 		# a1 = 0 (LEITURA)
	syscall
	beq $v0, $zero, erro_arquivo	# SE V0 != 0, HOUVE ERRO E VAI PARA erro_aquivo ONDE E TRATADO O ERRO
	
	sw $v0, descrin			# descrin = $v0
	jr $ra				# RETURN

#le_in(void) -> bytes_lidos
le_in:
	addi $v0, $zero, 14 		# INSTRUCAO PARA LEITURA
	lw $a0, descrin 		# a0 = CABECALHO
	la $a1, buffer 			# a1 = ENDERECO DO BUFFER
	addi $a2, $zero, 4 		# a2 = 4 (TAMANHO DO BUFFER)
	syscall
	jr $ra				# RETURN
		
fecha_in:
	addi $v0, $zero, 16		# INSTRUCAO PARA FECHAMENTO DE ARQ
	lw $a0, descrin			# a0 = descrin
	syscall
	beq $v0, $zero, erro_arquivo  	# VERIFICA SE O FECHAMENTO FOI BEM SUCEDIDO 
	jr $ra				# RETURN

# ESCRITA!  			
abre_out:
	addi $v0, $zero, 13 		# INSTRUCAO PARA ABERTURA DE ARQ
	la $a0, fileout 		# a0 = CAMINHO DO ARQ
	addi $a1, $zero, 1 		# a1 = 1 (ESCRITA)
	syscall	
	beq $v0, $zero, erro_arquivo	# SE V0 != 0, HOUVE ERRO E VAI PARA erro_aquivo ONDE E TRATADO O ERRO
	sw $v0, descrout		# descrout = $v0
	jr $ra					# RETURN

escreve_out:
	addi $v0, $zero, 15
	lw $a0, descrout
	la $a1, buffer
	addi $a2, $zero, 4
	syscall
	jr $ra

fecha_out:
	addi $v0, $zero, 16		# INSTRUCAO PARA FECHAMENTO DE ARQ
	lw $a0, descrout		# a0 = descrout
	syscall
	beq $v0, $zero, erro_arquivo  	# VERIFICA SE O FECHAMENTO FOI BEM SUCEDIDO 
	jr $ra				# RETURN

# FUNCAO DE TESTE:
testa_out:
    # mapa de memoria:
    la $s0, buffer
    la $s1, opcode
    la $s2, func
    la $s3, rs
    la $s4, rt
    la $s5, rd
    la $s6, shamt
    la $s7, imm
    
    #printar buffer
    addi $v0, $zero, 35
    lw $a0, 0($s0)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #printar opcode
    addi $v0, $zero, 35
    lw $a0, 0($s1)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #printar func
    addi $v0, $zero, 35
    lw $a0, 0($s2)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #printar rs
    addi $v0, $zero, 35
    lw $a0, 0($s3)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #printar rt
    addi $v0, $zero, 35
    lw $a0, 0($s4)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #printar rd
    addi $v0, $zero, 35
    lw $a0, 0($s5)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #printar shamt
    addi $v0, $zero, 35
    lw $a0, 0($s6)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #printar imm
    addi $v0, $zero, 35
    lw $a0, 0($s7)
    syscall
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall
    
    #mais um \n
    addi $v0, $zero, 11
    addi $a0, $zero, 10
    syscall

# DECODIFICACAO:
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
    slti $v0, $v0, 4
    bne $v0, $zero, decodifica_j

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
    addi $a1, $zero, 0
    addi $a2, $zero, 0xffff
    jal decodifica_campo
    sw $v0, 0($s7)
    
decodifica_fim:
    # epilogo:
    lw $ra, 0($sp)   # reajusta o endereco de retorno
    addi $sp, $sp, 4 # reajusta a pilha
    jr $ra           # volta pro procedimento chamador

# LOOP PARA LEITURA E ESCRITA!!
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
	#jal escreve_out
	jal testa_out
	j loop_1
	
erro_arquivo:
    addi $v0, $zero, 4    		# IMPRIMIR STRING
    la $a0, erro_manipulacao		# MENSAGEM DE ERRO AO USUARIO
    syscall

loop_fim:
    # epilogo:
    lw $ra, 0($sp)   # recuperando end de retorno
    addi $sp, $sp, 4 # reajustando pilha
	jr $ra

main:
    jal abre_in
    jal abre_out
    
    jal loop
    
    jal fecha_in
    jal fecha_out
    j fini
