#include <stdio.h>

#void itostr(int num, char *str){
#    int a = 1, i = 0;
#    while(a <= num){
#        a *= 10;
#    }
#    while(a > 1){
#        str[i] = (num % a*10) / a + '0';
#        a /= 10;
#        i++;
#    }
#    str[i] = '\0';
#    return;
#}
#
#
#int main(){
#    char string[12];
#    itostr(10, string);
#    printf("%s", string);
#    return 0;
#}

.data
    string: .space 12
    file_out: .asciiz "./teste.txt"

.text

main:
    addi $a0, $zero, 0xff
    la $a1, string
    jal itostr

    addi $v0, $zero, 4
    la $a0, string
    syscall

    addi $v0, $zero, 13
    la $a0, file_out
    addi $a1, $zero, 1
    syscall
    addi $a1, $v0, 0
    la $a0, string
    jal writestr

    addi $v0, $zero, 10
    syscall

#void itostr(int num, char *str){
#            $a0,     $a1
itostr:
    # prologo:
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 0($sp)
    sw $a1, 4($sp)

    # corpo:
    lw $t0, 0($sp)     # $t0 = num
    addi $t1, $zero, 1 # $t1 = a
    lw $t2, 4($sp)     # $t2 = str[i]
    j itostr_loop1_teste

itostr_loop1:
    addi $t4, $zero, 10
    mul $t1, $t1, $t4

itostr_loop1_teste:
    #(while (!(num < a))
    slt $t4, $t0, $t1
    beq $t4, $zero, itostr_loop1
    j itostr_loop2_teste

itostr_loop2:
    # t3 = a * 10;
    addi $t5, $zero, 10
    mul $t3, $t1, $t5
    # t3 = num % t3;
    div $t0, $t3
    mfhi $t3
    #t3 = t3 / a;
    div $t3, $t1
    mflo $t3
    #str[i] = t3 + '0';
    add $t4, $zero, $t3
    addi $t4, $t4, 48
    sb $t4, 0($t2)
    #a /= 10
    div $t1, $t5
    mflo, $t1
    #i++
    addi $t2, $t2, 1
    
itostr_loop2_teste:
    #while (0 < a)
    slt $t3, $zero, $t1
    bne $t3, $zero, itostr_loop2

itostr_fim:
    sb $zero, 0($t2)

    # epilogo:
    lw $ra, 8($sp)
    addi $sp, $sp, 12
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
