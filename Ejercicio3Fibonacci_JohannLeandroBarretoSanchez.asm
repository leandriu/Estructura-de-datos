.data
    result: .asciiz "Serie Fibonacci: "
    coma: .asciiz ", "

.text
    main:
        #Se muestra el mensaje inicial.
        li $v0, 4
        la $a0, result
        syscall

        #Se Inicializan los primeros dos términos de la serie.
        li $t0, 0       #Primer término.
        li $t1, 1       #Segundo término.

        #Se muestra el primer término.
        move $a0, $t0
        li $v0, 1
        syscall

        #Se generan los siguientes términos de la serie.
        li $t2, 15      #Se establece el número total de términos a generar.
        bnez $t2, loop  #Se salta a loop si hay más términos.

        #Se finaliza el programa si solo hay un término.
        li $v0, 10
        syscall

    loop:
        #Se calcula el siguiente término
        add $t3, $t0, $t1   #Se suman los dos términos anteriores.
        move $t0, $t1       #Se mueve el segundo término al primer término.
        move $t1, $t3       #Se muev el resultado al segundo término.
        
        #Se muestra una coma a excepcion del primer término.
        beqz $t2, print_number
        li $v0, 4
        la $a0, coma
        syscall

        #Se muestra el término actual
        print_number:
        move $a0, $t3
        li $v0, 1
        syscall

        #Se disminuye N y se verifica si debemos continuar
        subi $t2, $t2, 1
        bnez $t2, loop

        
