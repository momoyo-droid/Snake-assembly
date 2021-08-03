;;;;;;;;;;;;;;;;;;;;;;;;GLOBALS
SnakePosition: var #1000
SnakeSize: var #1
SnakeDirection:	var #1
foodPosition: var #1
Score: var #1
Score1: var #1
Score2: var #1
Score3: var #1
Speed: var #1
foodGlobal: var #1

;;;;;;;;;;;;;;;;;;;;;;;;RANDOMS
rand: var #100
	static rand + #0, #346
	static rand + #1, #1104
	static rand + #2, #154
	static rand + #3, #429
	static rand + #4, #841
	static rand + #5, #923
	static rand + #6, #205
	static rand + #7, #1139
	static rand + #8, #1149
	static rand + #9, #628
	static rand + #10, #419
	static rand + #11, #829
	static rand + #12, #682
	static rand + #13, #512
	static rand + #14, #1027
	static rand + #15, #504
	static rand + #16, #441
	static rand + #17, #779
	static rand + #18, #938
	static rand + #19, #635
	static rand + #20, #1151
	static rand + #21, #241
	static rand + #22, #982
	static rand + #23, #921
	static rand + #24, #593
	static rand + #25, #198
	static rand + #26, #1062
	static rand + #27, #276
	static rand + #28, #478
	static rand + #29, #831
	static rand + #30, #513
	static rand + #31, #704
	static rand + #32, #252
	static rand + #33, #1062
	static rand + #34, #1013
	static rand + #35, #972
	static rand + #36, #302
	static rand + #37, #574
	static rand + #38, #951
	static rand + #39, #808
	static rand + #40, #1081
	static rand + #41, #726
	static rand + #42, #993
	static rand + #43, #1118
	static rand + #44, #595
	static rand + #45, #337
	static rand + #46, #979
	static rand + #47, #392
	static rand + #48, #995
	static rand + #49, #757
	static rand + #50, #907
	static rand + #51, #987
	static rand + #52, #876
	static rand + #53, #729
	static rand + #54, #748
	static rand + #55, #825
	static rand + #56, #284
	static rand + #57, #128
	static rand + #58, #981
	static rand + #59, #1158
	static rand + #60, #838
	static rand + #61, #850
	static rand + #62, #180
	static rand + #63, #969
	static rand + #64, #229
	static rand + #65, #549
	static rand + #66, #781
	static rand + #67, #410
	static rand + #68, #1002
	static rand + #69, #1088
	static rand + #70, #574
	static rand + #71, #401
	static rand + #72, #132
	static rand + #73, #407
	static rand + #74, #358
	static rand + #75, #606
	static rand + #76, #624
	static rand + #77, #178
	static rand + #78, #877
	static rand + #79, #975
	static rand + #80, #291
	static rand + #81, #1140
	static rand + #82, #802
	static rand + #83, #523
	static rand + #84, #187
	static rand + #85, #907
	static rand + #86, #189
	static rand + #87, #350
	static rand + #88, #914
	static rand + #89, #1049
	static rand + #90, #865
	static rand + #91, #1108
	static rand + #92, #739
	static rand + #93, #924
	static rand + #94, #917
	static rand + #95, #847
	static rand + #96, #313
	static rand + #97, #1054
	static rand + #98, #613
	static rand + #99, #671

;;;;;;;;;;;;;;;;;;;;;;;;STRINGS
winMsg: string "You Won!!!"
winDel: string "          "
gameOverMsg: string "Game Over!"
gameOverDel: string "          "
restartMsg:	string "Aperte [ESPACE] para jogar!"
restartDel: string "                           "
score: string "Pontos: "


;;;;;;;;;;;;;;;;;;;;;;;;MAIN FUNCTIONS
main:
	loadn r0, #15
	loadn r1, #score
	loadn r2, #0

	call createMap

	call print

	call init

	call mainLoop

	rts

mainLoop:
	call initSnake

	loop:
		playLoop:
			call printSnake
			call controlSnake
			call checkCollision
			call delay

			jmp playLoop

		gameOverLoop:
			call random
			call restart

			jmp gameOverLoop

createMap:
    push r0
    push r1
    push r2
    push r3
    push r4

    loadn r0, #80
    loadn r1, #119
    loadn r2, #'%'
    loadn r3, #40
    loadn r4, #3072
    add r2, r2, r4

    printLateralBorders:
        outchar r2, r0
        outchar r2, r1
        add r0, r0, r3
        add r1, r1, r3

        cmp r0, r4
        jle printLateralBorders

    loadn r0, #81
    loadn r1, #1161
    loadn r3, #120

    printVerticalBorders:
        outchar r2, r0
        outchar r2, r1

        inc r0
        inc r1

        cmp r0, r3
        jle printVerticalBorders

    pop r4
    pop r3
    pop r2
    pop r1
    pop r0

    rts

print:
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r3, #'\0'

	printLoop:
		loadi r4, r1
		cmp r4, r3
		jeq printEnd
		add r4, r4, r2
		outchar r4, r0
		inc r0
		inc r1
		jmp printLoop

	printEnd:
		pop r0
		pop r1
		pop r2
		pop r3
		pop r4
	rts


;;;;;;;;;;;;;;;;;;;;;;;;SNAKE
init:
	loadn r0, #9400
	store Speed, r0

	loadn r1, #0
	store Score1, r1
	
	loadn r1, #0
	store Score2, r1
	
	loadn r1, #0
	store Score3, r1

	loadn r2, #25
	loadn r3, #48
	outchar r3, r2
	
	loadn r2, #26
	loadn r3, #48
	outchar r3, r2
	
	loadn r2, #27
	loadn r3, #48
	outchar r3, r2
	

	loadn r4, #130
	store foodPosition, r4

	loadn r5, #800
	store SnakePosition, r5

	loadn r6, #1
	store SnakeSize, r1

	loadn r6, #rand
	store foodGlobal, r6

	rts

initSnake:
	push r0
	push r1
	push r2
	push r3

	loadn r0, #2
	store SnakeSize, r0

	loadn r0, #SnakePosition
	loadn r1, #500
	storei r0, r1

	inc r0
	dec r1
	storei r0, r1

	inc r0
	dec r1
	storei r0, r1

	inc r0
	dec r1
	storei r0, r1

	inc r0
	loadn r1, #0
	storei r0, r1

	loadn r0, #SnakePosition
	loadn r1, #48
	loadi r2, r0
	loadn r3, #0

	loop:
		outchar r1, r2

		inc r0
		loadi r2, r0
		cmp r2, r3
		jne loop

	loadn r0, #820
	call foodRespaw

	loadn r0, #0
	store SnakeDirection, r0

	pop r0
	pop r1
	pop r2
	pop r3

	rts

printSnake:
	push r0
	push r1
	push r2
	push r3

	loadn r0, #1000
	loadn r1, #0
	mod r0, r6, r0
	cmp r0, r1
	jne printSnakeEnd

	call printFood

	loadn r0, #SnakePosition
	loadn r1, #'#'
	loadi r2, r0
	outchar r1, r2

	loadn r1, #' '
	load r3, SnakeSize
	add r0, r0, r3
	loadi r2, r0
	outchar r1, r2

	printSnakeEnd:
		pop r0
		pop r1
		pop r2
		pop r3

	rts

controlSnake:
	push r0
	push r1
	push r2
	push r3
	push r4

	loadn r0, #5000
	loadn r1, #0
	mod r0, r6, r0
	cmp r0, r1
	jne controlSnakeEnd

	ifFood:
		load r0, foodPosition
		loadn r1, #SnakePosition
		loadi r2, r1

		cmp r0, r2
		jne move

		call incrementScore

		load r0, SnakeSize
		inc r0
		store SnakeSize, r0

		loadn r0, #220
		call foodRespaw

	move:
		loadn r0, #SnakePosition
		loadn r1, #SnakePosition
		load r2, SnakeSize

		add r0, r0, r2
		dec r2
		add r1, r1, r2
		loadn r4, #0

		loopMoveSnake:
			loadi 	r3, r1
			storei 	r0, r3

			dec r0
			dec r1

			cmp r2, r4
			dec r2

			jne loopMoveSnake

	turnSnake:
		inchar r1

		loadn r2, #100
		cmp r1, r2
		jeq move_D

		loadn r2, #115
		cmp r1, r2
		jeq move_S

		loadn r2, #97
		cmp r1, r2
		jeq move_A

		loadn r2, #119
		cmp r1, r2
		jeq move_W

		jmp updateMovement

		move_D:
			loadn r0, #0
			
			loadn r1, #2
			load r2, SnakeDirection
			cmp r1, r2
			jeq move_left

			store SnakeDirection, r0
			jmp move_right

		move_S:
			loadn r0, #1
			
			loadn r1, #3
			load r2, SnakeDirection
			cmp r1, r2
			jeq move_up

			store SnakeDirection, r0
			jmp move_down

		move_A:
			loadn r0, #2
			
			loadn r1, #0
			load r2, SnakeDirection
			cmp r1, r2
			jeq move_right

			store SnakeDirection, r0
			jmp move_left

		move_W:
			loadn r0, #3
			
			loadn r1, #1
			load r2, SnakeDirection
			cmp r1, r2
			jeq move_down

			store SnakeDirection, r0
			jmp move_up

	updateMovement:
		load r0, SnakeDirection

		loadn r2, #0
		cmp r0, r2
		jeq move_right

		loadn r2, #1
		cmp r0, r2
		jeq move_down

		loadn r2, #2
		cmp r0, r2
		jeq move_left

		loadn r2, #3
		cmp r0, r2
		jeq move_up

		jmp controlSnakeEnd

		move_right:
			loadn r0, #SnakePosition
			loadi r1, r0
			inc r1
			storei r0, r1

			jmp controlSnakeEnd

		move_down:
			loadn r0, #SnakePosition
			loadi r1, r0
			loadn r2, #40
			add r1, r1, r2
			storei r0, r1

			jmp controlSnakeEnd

		move_left:
			loadn r0, #SnakePosition
			loadi r1, r0

			dec r1
			storei r0, r1

			jmp controlSnakeEnd

		move_up:
			loadn r0, #SnakePosition
			loadi r1, r0
			loadn r2, #40
			sub r1, r1, r2
			storei r0, r1

	controlSnakeEnd:
		pop r0
		pop r1
		pop r2
		pop r3
		pop r4

	rts

checkCollision:
	loadn r0, #SnakePosition
	loadi r1, r0

	loadn r2, #40
	loadn r3, #39
	mod r2, r1, r2
	cmp r2, r3
	jeq gameOverFlag

	loadn r2, #40
	loadn r3, #0
	mod r2, r1, r2
	cmp r2, r3
	jeq gameOverFlag

	loadn r2, #119
	cmp r1, r2
	jle gameOverFlag

	loadn r2, #1160
	cmp r1, r2
	jgr gameOverFlag

	load r2, SnakeSize
	loadi r4, r0
	loadn r3, #1

	checkCollisionLoop:
		inc r0
		loadi r1, r0
		cmp r1, r4
		jeq gameOverFlag

		dec r2
		cmp r2, r3
		jne checkCollisionLoop

	jmp checkCollisionEnd

	gameOverFlag:
		load r0, foodPosition
		loadn r1, #' '
		outchar r1, r0

		loadn r0, #615
		loadn r1, #gameOverMsg
		loadn r2, #0
		call print

		loadn r0, #687
		loadn r1, #restartMsg
		loadn r2, #0
		call print

		jmp gameOverLoop


	checkCollisionEnd:
	rts

deleteSnake:
	push r0
	push r1
	push r2
	push r3

	loadn r0, #SnakePosition
	inc r0
	loadn r1, #' '
	loadi r2, r0
	loadn r3, #0
	
	deleteLoop:
		outchar r1, r2
		inc r0
		loadi r2, r0
		
		cmp r2, r3
		jne deleteLoop
	
	deleteEnd:
		pop r3
		pop r2
		pop r1
		pop r0
		
	rts


;;;;;;;;;;;;;;;;;;;;;;;;FOOD
printFood:
	push r2
	push r0
	push r1

	load r0, foodPosition
	loadn r1, #'$'
	loadn r2, #2304
	add r1, r1, r2

	outchar r1, r0

	pop r1
	pop r0
	pop r2

	rts

foodRespaw:
	push r0
	push r1
	push r2
	push r3

	load r0, foodGlobal
	loadi r1, r0
	store foodPosition, r1
	call printFood
	inc r0
	store foodGlobal, r0

	loadn r2, #rand
	loadn r3, #100
	add r2, r2, r3
	cmp r0, r2
	jle endProcedure

	loadn r0, #0
	store foodGlobal, r0

;;;;;;;;;;;;;;;;;;;;;;;;GAME LEVEL
incrementScore:
	push r0
	push r1
	push r2
	push r3
	push r4

	load r0, Speed
	loadn r1, #500
	add r0, r0, r1
	store Speed, r0

	loadn r3, #10
	load r0, Score3
	inc r0
	cmp r0, r3
	jeq increment_2
	
	loadn r2, #27
	store Score3, r0
	loadn r4, #48
	add r0, r0, r4
	outchar r0, r2

	jmp incrementEnd

	increment_2:
		load r0, foodPosition
		loadn r1, #' '
		outchar r1, r0

		loadn r0, #615
		loadn r1, #winMsg
		loadn r2, #0
		call print

		loadn r0, #687
		loadn r1, #restartMsg
		loadn r2, #0
		call print

		jmp gameOverLoop
		jmp incrementEnd

	incrementEnd:
		pop r0
		pop r1
		pop r2
		pop r3
		pop r4

	rts


;;;;;;;;;;;;;;;;;;;;;;;;GENERAL
random:
	push r0
	push r1
	push r2
	push r3

	load r0, foodGlobal
	loadn r2, #5
	add r0, r0, r2
	loadi r1, r0
	store foodPosition, r1
	inc r0
	store foodGlobal, r0

	loadn r2, #rand
	loadn r3, #100
	add r2, r2, r3
	cmp r0, r2
	
	pop r0
	pop r1
	pop r2
	pop r3


	loadn r0, #rand
	store foodGlobal, r0

delay:
	push r0

	inc r6
	load r0, Speed
	cmp r6, r0
	jgr ResetTimer

	jmp TimerEnd

	ResetTimer:
		loadn r6, #0
	TimerEnd:
		pop r0

	rts

restart:
	push r0
	push r1
	push r2
	

	inchar r0
	loadn r1, #' '
	
	cmp r0, r1
	jeq restart_trigger
	
	jmp restart_end
	
	restart_trigger:
		loadn r0, #615
		loadn r1, #gameOverDel
		loadn r2, #0
		call print

		loadn r0, #615
		loadn r1, #winDel
		loadn r2, #0
		call print
		
		loadn r0, #687
		loadn r1, #restartDel
		loadn r2, #0
		call print
		
		call deleteSnake
		
		loadn r1, #0
		store Score1, r1
	
		loadn r1, #0
		store Score2, r1
	
		loadn r1, #0
		store Score3, r1

		loadn r2, #25
		loadn r3, #48
		outchar r3, r2
	
		loadn r2, #26
		loadn r3, #48
		outchar r3, r2
	
		loadn r2, #27
		loadn r3, #48
		outchar r3, r2

		loadn r0, #9400
		store Speed, r0

		jmp mainLoop

		
	restart_end:
		pop r2
		pop r1
		pop r0 
		
	rts

endProcedure:
	pop r0
	pop r1
	pop r2
	pop r3

	rts