.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
        
        mov 8(%ebp), %ecx;   #on place l'objet dans %ecx
        
		fld1;	#on ajoute 1 au stack et le st[0] devient egale � 1

		fld1;	#on ajoute 1 au stack et le st[0] devient egale � 1 et le st[1] egale � 1

		faddp;	#addition de st[0] et de st[1] et le resultat qui est egale � 2 est mis dans st[0]

        fldpi;   #on ajoute pi au stack et st[0] devient egale � pi(3.14...) et st[1] devient egale � 2

        fld 4(%ecx); #on ajoute mRadius au stack et st[0] devient egale � mRadius, st[1] devient egale � pi et st[2] devient egale � 2

        fmulp;  #on multiplie st[0] avec st[1], on obtient alors que st[0] est egale � mRadius * pi et le st[1] egale � 2

        fmulp;  #on multiplie le st[0] avec le st[1], on obtient que le st[0] va devenir egale � 2 * pi * mRadius
        
          /* on retourne un float donc on laisse le resultat dans st[0] */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
