.data
    numeros: .word 4, 6, 2, 16, 9    #Se definen los números a comparar.
    result: .asciiz "El número menor es: "

.text
    main:
        #Se cargan los números en registros.
        lw $t0, numeros
        lw $t1, numeros + 4
        lw $t2, numeros + 8
        lw $t3, numeros + 12
        lw $t4, numeros + 16
        #Se encuentra el número menor.
        li $t5, 0x7FFFFFFF  # Se establece $t5 en un valor grande.
        #Se compara y actualiza con los otros números.
        bgt $t0, $t5, update_min
        move $t5, $t0
    update_min:
        bgt $t1, $t5, update_min_2
        move $t5, $t1
    update_min_2:
        bgt $t2, $t5, update_min_3
        move $t5, $t2
    update_min_3:
        bgt $t3, $t5, update_min_4
        move $t5, $t3
    update_min_4:
        bgt $t4, $t5, update_min_5
        move $t5, $t4
    update_min_5:

        #Se muestra el resultado.
        li $v0, 4
        la $a0, result
        syscall

        #Se muestra el número menor.
        li $v0, 1
        move $a0, $t5
        syscall

        #Finalmente se finaliza el programa.
        li $v0, 10
        syscall
