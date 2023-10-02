.data
	filein: .asciiz "./teste.bin"
	fileout: .asciiz "./teste.txt"
	descrin: .word 0
	descrout: .word 0
	buffer: .space 4

.text
main:
	jal abre_in
	jal abre_out
	jal loop
	j fim
	
abre_in:
	addi $v0, $zero, 13 #vi = 13
	la $a0, filein #a0 = nome do arquivo
	move $a1, $zero #a1 = 0 (read)
	syscall
	sw $v0, descrin
	jr $ra
	
abre_out:
	addi $v0, $zero, 13 #vi = 13
	la $a0, fileout #a0 = nome do arquivo
	addi $a1, $zero, 1 #a1 = 1 (write)
	syscall
	sw $v0, descrout
	jr $ra
	
fecha_in:
	addi $v0, $zero, 16
	lw $a0, descrin
	syscall
	jr $ra

fecha_out:
	addi $v0, $zero, 16
	lw $a0, descrout
	syscall
	jr $ra

le_in:
	addi $v0, $zero, 14 #vi = 14
	lw $a0, descrin #a0 = cabecalho
	la $a1, buffer #a1 = endereco do buffer
	addi $a2, $zero, 4 #a2 = 4 (tamanho do buffer)
	syscall
	add $t8, $v0, $zero
	jr $ra
	
escreve_out:
	addi $v0, $zero, 15
	lw $a0, descrout
	la $a1, buffer
	addi $a2, $zero, 4
	syscall
	jr $ra

decode:
	#TODO: decodificar a entrada

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

fim:
	jal fecha_in
	jal fecha_out
	addi $v0, $zero, 17 # serviço 17 - exit 2
	addi $a0, $zero, 0 # o valor de retorno do programa é 0 - sucesso
	syscall             # fazemos uma chamada do serviço 17 do sistema com valor 0
