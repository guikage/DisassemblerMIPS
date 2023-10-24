# DisassemblerMIPS
OBJETIVO -> DESENVOLVER DISSEMBLER!
---
    -  DEVE SER ESCRITO EM ASSEMBLY DO MIPS
    -  SIMULADO NO NOSSO SOFWARE MARS
    O QUE O PROGRAMA FARÁ:
        - LÊ UM ARQUIVO COM CODIGO EM LINGUAGEM MAQUINA!
            - LER UM ARQUIVO EM (.bin)
        - REALIZA A DESMONTAGEM
            - PROCESSO DE CONVERTER AS INSTRUÇÕES DE MAQUINA PARA EM LINGUAGEM DE MONTAGEM
        - ESCREVE O RESULTADO DO PROCESSAMENTO EM UM ARQUIVO TEXTO (arq.txt)
            - ESCREVER EM UM ARQUIVO TEXTO 
    Para cada instrução em linguagem de máquina, a saída do programa deve gerar, pelo menos, o endereço da instrução desmontada, a instrução em linguagem de máquina e a instrução em linguagem assembly.
        Endereço Instrução assembly
        0x00400000 0x27BDFFF8 addiu $sp, $sp -8
        0x00400004 0x24080005 addiu $t0, $zero, 5
        0x00400008 0xAFA80004 sw $t0, 4($sp)
. . . . . . . . .
O arquivo com o código em linguagem de máquina será fornecido pelo professor.

Será dado também o arquivo em assembly, utilizado para gerar as instruções em linguagem de máquina.
O programa deve reconhecer todas as instruções em linguagem de máquina do arquivo fornecido. 

Outras instruções, o programa apresenta o endereço, a instrução e a mensagem "instrução desconhecida".






Para o desenvolvimento do trabalho, utilize o mapa de opcodes da figura B.10.2, do livro do Patterson
(Patterson e Hennessy, 2014).


    ENTREGA DO TRABALHO     |       DIA 03|11|2023
A entrega do trabalho será realizada por meio da ferramenta Moodle, em data acordada com o professor. 
Entregar um relatório (em PDF), os arquivos-fontes dos programas desenvolvidos e os arquivos de entrada, usados na verificação e validação do programa. O relatório do trabalho deverá conter as seguintes seções: introdução,
objetivos, revisão bibliográfica, metodologia, experimento, resultados, discussão e conclusões e
perspectivas.
