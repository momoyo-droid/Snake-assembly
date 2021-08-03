; Teste das instrucoes que vao sendo implementadas!


; 4 Perguntas ao implemantar as instrucoes:
;	1) O Que preciso fazer para esta instrucao?
;	2) Onde Comeca: Pegargcc simple_simulator.c -O3 -march=native -o simulador -Wall -lm -lcurses o que tem que fazer e ir voltando ate' chegar em um registrador (ie. PC)
;	3) Qual e' a Sequencia de Operacoes: Descrever todos os comandos que tem que dar nos cilos de Dec e Exec
;	4) Ja' terminou??? Cumpriu o que tinha que fazer??? O PC esta' pronto para a proxima instrucao (cuidado com Load, Loadn, Store, Jmp, Call)

	; Teste do Median para dois valores positivos
	loadn r1, #3
	loadn r2, #13
	Median r3, r1, r2

	loadn r1, #'A'
	add r3, r1, r3

	loadn r1, #8
	sub r3, r3, r1		; Retrocede 8 letras no alfabeto

	loadn r0, #0
	outchar r3, r0		; Printa A na linha 0

	; Teste do Median para o menor valor negativo	
	loadn r1, #0
	loadn r2, #3
	sub r1, r1, r2		; r1 = -3

	loadn r2, #13
	Median r3, r1, r2

	loadn r1, #'A'
	add r3, r1, r3

	loadn r1, #4
	sub r3, r3, r1		; Retrocede 6 letras no alfabeto

	loadn r0, #2
	outchar r3, r0		; Printa B na linha 2

	; Teste do Median para o maior valor negativo	
	loadn r1, #22
	loadn r2, #6
	sub r1, r2, r1		; r1 = -16

	Median r3, r1, r2
	loadn r1, #'H'
	add r3, r1, r3

	loadn r0, #4
	outchar r3, r0		; Printa C na linha 4
	
	; Teste do Median para ambos valores negativos
	loadn r1, #8
	loadn r2, #0
	sub r1, r2, r1		; r1 = -8

	loadn r2, #36
	loadn r3, #0
	sub r2, r3, r2		; r2 = -36

	Median r3, r1, r2	; r3 = -22
	loadn r1, #'Z'
	add r3, r1, r3

	loadn r0, #6
	outchar r3, r0		; Printa D na linha 6
	
	; Teste do Median para um dos valores ímpar	
	loadn r1, #15
	loadn r2, #8

	Median r3, r1, r2		; r3 = 12,5. Que é arredondado inferiormente sempre
	loadn r1, #'P'
	sub r3, r1, r3

	loadn r0, #8
	outchar r3, r0		; Printa E na linha 8
	
Fim:	
	halt