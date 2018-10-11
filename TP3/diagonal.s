.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

		//* Write your solution here */

		xor %ebx, %ebx 				/* ebx = r = 0 */
		xor %edi, %edi 				/* edi = c = 0 */ 

	loop: 
		cmp %ebx, 16(%ebp)			/*on compare r et matorder */
		jbe end 					/* si cest plus petit ou égale, alors on va à la fin */
		jmp loop2					/* sinon on commence la deuxieme boucle */
		
	inc1: 
		incl %ebx					/* on incremente r */
		movl $0, %edi				/* c = 0 */
		jmp loop					/* on recommence la premiere boucle */
		
	loop2:
		cmp %edi, 16(%ebp)			/* on compare c et matorder */
		jne op   					/* si ce c nest pas égale à matorder, alors on rentre dans la boucle op */
		jmp inc1 					/* sils sont égales, alors on a fini avec la deuxième boucle on incremente r */

	op:	
		cmp %ebx, %edi				/* on compare r et c */
		jne else        			/* sils ne sont pas égales, on va à la partie else */
		je equal					/* sils sont egaux alors on va a la partie equal */

	equal:
		movl 8(%ebp), %ecx 			/* on met inmatdata dans ecx */
		movl 16(%ebp), %eax			/* on met matorder dans eax */
		
		imul %ebx, %eax 			/* eax = eax * ebx = matorder * r */
		addl %edi, %eax  			/* eax = c+r*matorder */
		movl (%ecx, %eax, 4), %ecx	/* ecx = inmatdata[c+r*matorder] */

		movl 12(%ebp), %edx 		/*on met outmatdata dans edx */
		movl %ecx, (%edx, %eax, 4) 	/* outmatdata[c + r * matorder] = inmatdata[c + r * matorder] */
		 
		incl %edi					/* on incremente c */
		jmp loop2					/* on recommence la deuxieme boucle */
		
	else:	
		movl 12(%ebp), %edx 		/* on met outmatdata dans edx */
		movl 16(%ebp), %eax			/* on met matorder dans eax */
		imul %ebx, %eax				/* eax = r * matorder */
		add %edi, %eax				/* eax = c + r * matorder */
		movl $0, (%edx, %eax, 4)	/* outmatdata[c + r * matorder] = 0; */	


		incl %edi      				/* on incrémente c */
		jmp loop2					/* on recommence la deuxieme boucle */
		
	end:    
        leave          				/* restore ebp and esp */
        ret            				/* return to the caller */
