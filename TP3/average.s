.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      				/* Save old base pointer */
        mov %esp, %ebp 				/* Set ebp to current esp */

		/* Write your solution here */
		
		xor %ebx, %ebx 				/* ebx = r = 0 */
		xor %edi, %edi 				/* edi = c = 0 */ 
		xor %esi, %esi 				/* esi = elem = 0 */
	

	loop:
		cmp %ebx, 16(%ebp)			/* on compare r et matorder */
		jbe end						/* si cest plus  petit ou égale, on a fini */
		movl $0, %esi 				/* elem = 0 */	
		
	loop2:
		cmp %edi, 16(%ebp)			/* on compare c et matorder */
		jne operationloop2			/* si la comparasion nest pas égale à 0, alors on effectue la boucle operationloop2 */
		jmp postLoop 				/* Sinon, si c est égale à matorder (ou plus grand) on va au else */

	operationloop2:

		movl 8(%ebp), %ecx			/* on met inmatdata dans ecx */
		movl 16(%ebp), %eax			/* on met matorder dans eax */
		imul %ebx, %eax 			/* eax = r * matorder */
		addl %edi, %eax  			/* eax = c+r*matorder */
		movl (%ecx, %eax, 4), %ecx  /* ecx = inmatdata[c + r * matorder] */
		addl %ecx, %esi				/* elem += inmatdata[c + r * matorder]; */
		
		incl %edi					/* incremente c */
		jmp loop2					/* on recommence la loop */

	postLoop:
		mov $0, %edx 				/* On s'assure que le registre edx soit bien à zéro, avant la division... */
		mov 16(%ebp), %ecx			/* on met matorder dans ecx */
		mov %esi, %eax				/* eax = elem */
		idiv %ecx					/* donc eax = eax / ecx ce qui est alors elem/matorder */
		
		movl 12(%ebp), %edx			/* on met outmatdata dans edx */
		movl %eax, (%edx, %ebx, 4)  /* outmatdata[r] = elem/matorder */

		jmp inc1					

	inc1:
		inc %ebx					/* on incrémente r, on réinitialise c dans la boucle, et on retourne à loop */
		mov $0, %edi
		jmp loop	
	
	end: 
        leave          				/* Restore ebp and esp */
        ret           				/* Return to the caller */
		
