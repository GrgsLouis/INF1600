.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */

        /* Write your solution here */

		xor %edi, %edi; 					/* c=0 */
		xor %ebx, %ebx; 					/* r=0 */

	loop:
		cmp %ebx, 16(%ebp) 					/* on compare r et matorder */
		jbe end1 							/* si le resultat est plus petit, on va a la fin */ 
		jmp loop2 							/* sinon on va dans le deuxieme loop */
		
	loop2:		
		cmp %edi, 16(%ebp)					/* on compare c et matorder */
		jbe inc1           					/* si c < matorder on va incrementer r */

		movl 16(%ebp), %eax 				/* on met matorder dans le registre eax */
		imull %ebx, %eax 					/* eax = ( matorder * r ) */
		add %edi, %eax 						/* eax = ( c + r * matorder ) */
		
		movl 12(%ebp), %ecx 				/* ecx= inmatdata2 */
		movl 8(%ebp), %edx 					/* edx= inmatdata1 */
		
		movl (%ecx, %eax, 4), %ecx			/* ecx= inmatdata2[c + r * matorder] */
		movl (%edx, %eax, 4), %edx			/* edx= inmatdata1[c + r * matorder] */

		cmp %ecx,%edx						/* on compare ecx et edx */
		jne end0       						/* s ils ne sont pas égales, on quitte, sinon on incrémente la boucle */
		je inc2

	
	inc2: 									/* on incremente c et on recommence la seconde boucle */
		inc %edi
		jmp loop2
		
	inc1: 									/* on incremente r, reinitialise c et on recommence la premiere boucle */
		inc %ebx
		movl $0, %edi
		jmp loop
		
	end1:									/* premiere option de sortie return = 1 */
		mov $1, %eax  						/* si on est ici, on a trouvé que les deux matrices sont égales */
		jmp end 							/* on met la valeure de retour 1 dans eax et on va a la fin */

	end0:									/* deuxieme option de sortie return = 0 */
		mov $0, %eax 						/* si on est ici, on a trouvé que les deux matrices ne sont pas égales */
		jmp end
		
	end:									/* fin de la fonction */
        leave          						/* Restore ebp and esp */
        ret            						/* Return to the caller */
