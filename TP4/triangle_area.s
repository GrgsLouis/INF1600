	.globl _ZNK9CTriangle7AreaAsmEv

	_ZNK9CTriangle7AreaAsmEv:
			push %ebp      /* save old base pointer */
			mov %esp, %ebp /* set ebp to current esp */
        
			/* Write your solution here */

			subl $4, %esp	#On fait une espace pour notre P
			movl $0, -4(%ebp) #on met P egale à 0 
			mov 8(%ebp), %ecx; #on place l'objet dans %ecx

			push %ecx;    #on le met dans la pile
			mov (%ecx), %ecx; #on met l'adresse de ecx dans %ecx

				add $12, %ecx;  # +12 à %ecx
		
				call *(%ecx);   #call PerimeterAsm de la table virtuale
		
				fld1;	#on ajoute 1 au stack et le st[0] devient egale à 1 et le st[1] devient egale à PerimeterAsm

				fld1;	#on ajoute 1 au stack et le st[0] devient egale à 1 et le st[1] devient egale à 1 et notre st[2] devient egale à PerimeterAsm

				faddp;	#on additione st[0] avec st[1] alors notre st[0] devient egale à 2 et notre st[1] devient egale à PerimeterAsm

				fdivrp; #on divise st[1] par st[0], et notre st[0] devient egale à PerimeterAsm diviser par 2

				fstp -4(%ebp); #on met st[0] dans P, et P devient egale à PerimeterAsm diviser par 2
	
				fld -4(%ebp); #st[0] egale à P 

				fld 4(%ecx);  #st[0] egale à mSides[0] et notre st[1] devient egale à P 

				fsubrp;       #st[0] devient egale à (P - mSides[0])   
		
				fld -4(%ebp); #st[0] egale à P et st[1] devient egale à (P - mSides[0])   

				fld 8(%ecx);  #st[0] egale à mSides[1], st[1] devient egale à P et st[2] devient egale à (P - mSides[0])

				fsubp;        #st[0] egale à (P - mSides[1]) et st[1] devient egale à (P - mSides[0]) 
		
				fld -4(%ebp); #st[0] egale à P, st[1] devient egale à (P - mSides[1]) et st[2] devient egale à (P - mSides[0]) 

				fld 12(%ecx); #st[0] egale à mSides[2], st[1] devient egale à P, st[2] devient egale à (P - mSides[1]) et st[3] devient egale à (P - mSides[0]) 

				fsubp;        #st[0] egale à (P - mSides[2]), st[1] devient egale à (P - mSides[1]) et st[2] devient egale à (P - mSides[0]) 
	
				fld -4(%ebp); # st[0] egale à P, st[1] devient egale à (P - mSides[2]), st[2] devient egale à (P - mSides[1]) et st[3] devient egale à (P - mSides[0]) 
		
				fmulp;        #st[0] egale à (P * (P - mSides[2])), st[1] devient egale à (P - mSides[1]) et st[2] devient egale à(P - mSides[0]) 

				fmulp;        #st[0] egale à (P * (P - mSides[2])) multiplier par (P - mSides[1]), st[1] devient egale à (P - mSides[0]) 

				fmulp;        #st[0] egale à (P * (P - mSides[2])) multiplier par (P - mSides[1]) multiplier encore par (P - mSides[0]) 
	
				fsqrt;        #st[0] egale à sqrt(P multiplier par (P - mSides[2]) multiplier par (P - mSides[1]) multiplier encore par (P - mSides[0])) 
        
        
					leave          /* restore ebp and esp */
					ret            /* return to the caller */
