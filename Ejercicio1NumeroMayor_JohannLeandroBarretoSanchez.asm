.data
    numeros: .word 2, 7, 1, 11, 5    #Aqui definimos las variables numeros y resultado.
    result: .asciiz "El número mayor es: "

.text
    main:
        #En estas lineas se carga los números en registros.
        lw $t0, numeros
        lw $t1, numeros + 4
        lw $t2, numeros + 8
        lw $t3, numeros + 12
        lw $t4, numeros + 16

        #Aqui se encuentra el número mayor.
        li $t5, -1
        #Se compara y se actualiza con el primer número y luego con todos los demás.
        blt $t0, $t5, update_max
        move $t5, $t0
        
    update_max:
        blt $t1, $t5, update_max_2
        move $t5, $t1
    update_max_2:
        blt $t2, $t5, update_max_3
        move $t5, $t2
    update_max_3:
        blt $t3, $t5, update_max_4
        move $t5, $t3
    update_max_4:
        blt $t4, $t5, update_max_5
        move $t5, $t4
    update_max_5:

        #Se muestra el resultado.
        li $v0, 4
        la $a0, result
        syscall

        #Se muestra el número mayor.
        li $v0, 1
        move $a0, $t5
        syscall

        #Finalmente se termina el programa.
        li $v0, 10
        syscall
