.text
    main:
        addi    $1,$0,1         # $1=1
        

    _init_SEG:
        lw      $7,464($0)    # change ,$7 is 0x00010000
        addi    $8,$0,0     # $8 is the score, high 16 bits is loss score, low 16 bits is hit score
        sw      $8,468($0)    # change, put the score into SEG_IO  

    _init_BLUE:
    	addi	$12,$0,472	# change, put the Blue_IO addr into $12 

    _init_LED:
        addi      $2,$0,600       # 2, change, pointer of LED_Data, first not 0x0000000f
        addi      $3,$0,476       # 3, change, pointer of LED_IO
        

        lw      $4,0($2)
        sw      $4,0($3)        # line 0

        lw      $4,-4($2)
        sw      $4,4($3)        # line 1 ...

        lw      $4,-8($2)
        sw      $4,8($3)

        lw      $4,-12($2)
        sw      $4,12($3)

        lw      $4,-16($2)
        sw      $4,16($3)

        lw      $4,-20($2)
        sw      $4,20($3)

        lw      $4,-24($2)
        sw      $4,24($3)

        lw      $4,-28($2)
        sw      $4,28($3)

        lw      $4,-32($2)
        sw      $4,32($3)

        lw      $4,-36($2)
        sw      $4,36($3)

        lw      $4,-40($2)
        sw      $4,40($3)

        lw      $4,-44($2)
        sw      $4,44($3)

        lw      $4,-48($2)
        sw      $4,48($3)

        lw      $4,-52($2)
        sw      $4,52($3)

        lw      $4,-56($2)
        sw      $4,56($3)

        lw      $4,-60($2)
        sw      $4,60($3)

        addi    $5,$0,0     # $5 is the counter
        addi    $6,$0,2047

    _init_ok:
        beq     $5,$6,_init_LED
        j       _init_ok
    _LED_IRQ:
        addi    $2,$2,4		# _LED_IRQ
        addi    $5,$5,1
        
        lw      $4,0($2)
        sw      $4,0($3)        # line 0

        lw      $4,-4($2)
        sw      $4,4($3)        # line 1 ...

        lw      $4,-8($2)
        sw      $4,8($3)

        lw      $4,-12($2)
        sw      $4,12($3)

        lw      $4,-16($2)
        sw      $4,16($3)

        lw      $4,-20($2)
        sw      $4,20($3)

        lw      $4,-24($2)
        sw      $4,24($3)

        lw      $4,-28($2)
        sw      $4,28($3)

        lw      $4,-32($2)
        sw      $4,32($3)

        lw      $4,-36($2)
        sw      $4,36($3)

        lw      $4,-40($2)
        sw      $4,40($3)

        lw      $4,-44($2)
        sw      $4,44($3)

        lw      $4,-48($2)
        sw      $4,48($3)

        lw      $4,-52($2)
        sw      $4,52($3)

        lw      $4,-56($2)
        sw      $4,56($3)

        lw      $4,-60($2)
        sw      $4,60($3)       # line 15

        eret

    _SEG_IRQ:
        sw      $8,468($0)        # change, put the score into SEG_IO  ,_SEG_IRQ
        eret

    _BLUE_IRQ:
    	lw	$13,0($12)	# _BLUE_IRQ 	
    	# andi 	$14,$13,0x00001000
    	# beq 	$14,$0,_BLUE_ERR
    	andi	$14,$13,0x00000fff
    	add 	$14,$14,$14
    	add	$14,$14,$14
    	lw 	$13,0($14)
    	sw 	$13,0($12)
    	eret
    _BLUE_ERR:
    	eret
    
    Input0_IRQ:
        lw      $10,60($3)      # $10 is the current line, Input0_IRQ
        
        andi    $10,$10,0x8
        beq     $10,$0,Input0_Success

    Input0_Failure:
        addi    $8,$8,1
        eret
    Input0_Success:
        add     $8,$8,$7
        eret

    Input1_IRQ:
        lw      $10,60($3)      # $10 is the current line, Input1_IRQ
        
        andi    $10,$10,0x4
        beq     $10,$0,Input1_Success

    Input1_Failure:
        addi    $8,$8,1
        eret
    Input1_Success:
        add     $8,$8,$7
        eret


    Input2_IRQ:
        lw      $10,60($3)      # $10 is the current line, Input2_IRQ
        
        andi    $10,$10,0x2
        beq     $10,$0,Input2_Success

    Input2_Failure:
        addi    $8,$8,1
        eret
    Input2_Success:
        add     $8,$8,$7
        eret 


    Input3_IRQ:
        lw      $10,60($3)      # $10 is the current line, Input3_IRQ
        
        andi    $10,$10,0x1
        beq     $10,$0,Input3_Success

    Input3_Failure:
        addi    $8,$8,1
        eret
    Input3_Success:
        add     $8,$8,$7
        eret 


# .data 
#     LED_IO:     .space  64
#     SEG_IO:     .word   0x00000000
#     SEG_High:   .word   0x00010000
#     LED_start:  .word   0x00000000
#     LED_Data:   .space  8192
