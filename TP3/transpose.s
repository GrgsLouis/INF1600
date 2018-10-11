.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */

		xor %ebx, %ebx 					/* ebx = r = 0 */
		xor %edi, %edi 					/* edi = c = 0 */ 

	loop: 
		cmp %ebx, 16(%ebp)				/* on compare r et matorder */
		jbe end 						/* si cest plus petit ou égale, on va à la fin */
		
	loop2:
		cmp %edi, 16(%ebp)				/* on compare c et matorder */
		jne op  	       				/* si r nest pas égale à matorder, alors on effectue les operations de transposition */
		jmp inc1						/* sinon, on incrémente et on réinitialise c en retournant à loop */	 	

	op:
		movl 8(%ebp), %ecx 				/* on met inmatdata dans ecx */
		movl 16(%ebp), %eax				/* on met matorder dans eax */
		imul %edi, %eax					/* eax = matorder * c */
		addl %ebx, %eax                                 /* eax = r + matorder * c */
		movl (%ecx, %eax, 4), %ecx                      /* ecx = inmatdata[r + c * matorder] */
		
		movl 12(%ebp), %edx                             /* edx = outmatdata */
		movl 16(%ebp), %eax				/* on met matorder dans eax */
		imul %ebx, %eax                                 /* eax = matorder * r */
		addl %edi, %eax                                 /* eax = c + matorder * r */
		movl %ecx, (%edx, %eax, 4)                      /* outmatdata[c + r * matorder] = inmatdata[r + c * matorder] */
		
		incl %edi						/* on incremente c */
		jmp loop2						/* on recommence la deuxieme boucle */
		
	inc1: 
		incl %ebx						/* on incremente r */
		movl $0, %edi					/* on reinitialise c */
		jmp loop						/* on recommence la premiere loop */
		
	end:    
        leave          					/* restore ebp and esp */
        ret            					/* return to the caller */
