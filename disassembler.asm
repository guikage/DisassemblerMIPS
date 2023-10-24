.data
    filein: .asciiz "./leitura.txt"
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
main:
	jal abre_in			# ABRE ARQUIVO PARA LEITURA
	jal abre_out			# ABRE ARQUIVO PARA ESCRITA
	jal loop
	j fim

# LEITURA!!
abre_in:
	addi $v0, $zero, 13 		# INSTRUCAO PARA ABERTURA DE ARQ
	la $a0, filein 			# a0 = CAMINHO DO ARQ
	move $a1, $zero 		# a1 = 0 (LEITURA)
	syscall
	beq $v0, $zero, erro_arquivo	# SE V0 != 0, HOUVE ERRO E VAI PARA erro_aquivo ONDE E TRATADO O ERRO
	
	sw $v0, descrin			# descrin = $v0
	jr $ra				# RETURN
	
le_in:
	addi $v0, $zero, 14 		# INSTRUCAO PARA LEITURA
	lw $a0, descrin 		# a0 = CABECALHO
	la $a1, buffer 			# a1 = ENDERECO DO BUFFER
	addi $a2, $zero, 4 		# a2 = 4 (TAMANHO DO BUFFER)
	syscall
	add $t8, $v0, $zero
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

# LOOP PARA LEITURA E ESCRITA!!
loop:
	move $s7, $ra
	j loop_1
loop_2:
	jal decode
	jal escreve_out
	
loop_1:
	jal le_in
	j loop_teste

loop_teste:
	beq $t8, 4, loop_2
	
loop_fim:
	jr $s7

erro_arquivo:
    addi $v0, $zero, 4    		# IMPRIMIR STRING
    la $a0, erro_manipulacao		# MENSAGEM DE ERRO AO USUARIO
    syscall
    j fim				
    
# DECODIFICACAO!!
decode:
	# DECODIFICACAO!!
fim:
	jal fecha_in
	jal fecha_out
	addi $v0, $zero, 17 		# ENCERRAR PROGRAM
	addi $a0, $zero, 0 		# VALOR DE RETORNO DO PROGRAMA: 0 - SUCESSO
	syscall             		# CHAMADA DO SISTEMA PARA ENCERRAR O PROGRAM COM VALOR 0
