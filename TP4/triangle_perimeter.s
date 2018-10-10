	.globl _ZNK9CTriangle12PerimeterAsmEv

	_ZNK9CTriangle12PerimeterAsmEv:
			push %ebp      /* save old base pointer */
			mov %esp, %ebp /* set ebp to current esp */
         
			/* Write your solution here */ 
			mov 8(%ebp), %ecx; #on met l'objet dans %ecx
         
			fld 4(%ecx);   #on ajoute mSides[0] au stack, st[0] devient egale à mSides[0] 

			fld 8(%ecx);   #on ajoute mSides[1] au stack, st[0] devient egale à mSides[1], st[1] devient egale à mSides[0] 

			fld 12(%ecx);  #on ajoute mSides[2] au stack, st[0] devient egale à mSides[2], st[1] devient egale à mSides[1] et st[2] egale à mSides[0] 
        
			faddp;  #on additione st[0] à st[1], st[0] devient egale à (mSides[2] + mSides[1]), st[1] devient egale à mSides[0] 

			faddp; #on additione  st[0] à at[1], st[0] devient egale à (mSides[2] + mSides[1] + mSides[0]) 
        
									/* on retourne un float donc on laisse le resultat dans st[0] */
        
			leave          /* restore ebp and esp */
			ret            /* return to the caller */
