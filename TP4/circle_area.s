.globl _ZNK7CCircle7AreaAsmEv

_ZNK7CCircle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
        mov 8(%ebp), %ecx; #on met l'objet dans %ecx
        
        fld 4(%ecx); # on ajoute mRadius au stack, st[0] devient egale à mRadius 

        fld 4(%ecx); #on ajoute mRadius au stack, st[0] devient egale à mRadius, st[1] devient egale à mRadius 

        fldpi;       #on eajout pi au stack, st[0] devient egale à pi, st[1] devient egale à mRadius et st[2] devient egale à mRadius 
        
        fmulp;      #on multiplie st[0] avec st[1], st[0] devient egale à pi multiplier par mRadius, et st[1] devient egale à mRadius 

        fmulp;      #on multiplie st[0] avec st[1], st[0] devient egale à pi multiplier par mRadius multiplier par mRadius
        
                                /* on retourne un float donc on laisse le resultat dans st[0] 
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
