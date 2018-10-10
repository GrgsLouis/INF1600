.data

	/* Votre programme assembleur ici... */

	i: .int 0
	

	.global func_s

	func_s:
		/* Votre programme assembleur ici... */
		#mov $0, %eax
		mov i, %ebx
		jmp comparaison
	BOUCLE :
			mov b, %edx # %edx=b  
			mov e, %eax # %eax=e 
			sub %edx, %eax # %eax - %edx = %eax = (e-b)
			mov d, %esi # %esi=d
			add %esi, %eax # d+(e-b)
			mov %eax, a # a=d+(e-b) .. %eax=a
			
				#if((b-1000) < (c+500))
				mov c, %edi # %edi=c
				add $500, %edi # %edi=c+500
				mov %edi, c
				sub $1000, %edx # %edx=b-1000
				mov %edx, b
				cmp %edx, %edi
				jg Condition1
					sub $1000, %edi # c-500  
					mov %edi, c # c=c-500
				
					#if(b>c)
					add $1000, %edx
					cmp %edx, %edi	# %edi=c %edx=b
				
				jnge FIN
					sub $500, %edx # b-500
					mov %edx, b # b=b-500
					jmp FIN			
			
				Condition1:
					mov e, %ecx
					add $2000, %edx # pour retourner b a la valeur initiale
					sub %ecx, %edx # b-e
					mov %edx, b
					add $500, %esi
					mov %esi, d
					jmp FIN
				
				FIN:
				
					add $1, %ebx # i++
					jmp comparaison
		comparaison:
			cmp $10, %ebx # i<=10
			jng BOUCLE
			ret





