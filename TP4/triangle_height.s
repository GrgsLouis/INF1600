	.globl	_ZNK9CTriangle9HeightAsmEv

	_ZNK9CTriangle9HeightAsmEv:
			push %ebp      /* save old base pointer */
			mov %esp, %ebp /* set ebp to current esp */
        
			/* Write your solution here */
		
			mov 8(%ebp), %ecx; #on met l'objet dans %ecx

			push %ecx;  #on met l'objet dans la pile 

			mov (%ecx), %ecx; #on place l'adresse de ecx dans %ecx 

			add $20, %ecx; # +12 � %ecx

			call *(%ecx);   #on appelle AreaAsm depuis la virtual table 
		
			fld1;    #st[0] egale � 1, st[1] devient egale � AreaAsm

			fld1;    #st[0] egale � 1, st[1] devient egale � 1, st[2] devient egale � AreAsm 

			faddp;   #st[0] egale � 2, st[1] devient egale � AreaAsm

			fmulp;   #st[0] egale � 2 multiplier par AreaAsm
		
			fld 12(%ecx); #st[0] egale � mSides[2], st[1] egale � 2 multiplier par AreaAsm

			fdivrp;       #st[0] egale � ((2 multiplier par AreaAsm) diviser par mSides[2])
        
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
