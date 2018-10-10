.data
debut_data:	
  a: .float 
  b: .float
  c: .float
  d: .float
  e: .float
  f: .float
  g: .float

fin_data:

.global func_s
	
func_s:
	/* Votre programme assembleur ici... */

  flds d;	#st[0]=d
  flds b;	#st[1]=d, st[0]=b
  fmulp;	#st[0]*st[1]=b*d 
  flds c;	#st[0]=c, st[1]=b*d		
  fsubrp;	#st[1]-st[0]=(b*d)-c ..st[1]=st[0]	
  fstps b;	#st[0]=(b*d)-c , st[1]=vide
  flds f;	#st[0]=f , st[1]=(b*d)-c
  flds g;	#st[0]=g, st[1]=f
  fsubrp;	#st[0]=st[1]=f-g
  flds b;	#st[0]=(b*d)-c  , st[1]=f-g
  fdivp;	#st[0]=st[1]=[(b*d)-c]/(f-g)
  flds e;	#st[0]=e , st[1]=[(b*d)-c]/(f-g)
  faddp;	#st[0]=st[1]=e+[(b*d)-c]/(f-g)
  fstps c;	#st[0]=e+[(b*d)-c]/(f-g) , st[1]=vide
  flds g;	#st[0]=g , st[1]=e+[(b*d)-c]/(f-g)
  flds e;	#st[0]=e , st[1]=g
  fsubrp;	#st[0]=st[1]=g-e
  flds f;	#st[0]=f , st[1]=g-e
  fdivrp;	#st[0]=st[1]= (g-e)/f
  flds c;	#st[0]=	e+[(b*d)-c]/(f-g) , st[1]=(g-e)/f
  fmulp;	#st[0]=st[1]= [(g-e)/f]*{e+[(b*d)-c]/(f-g)}	
  fstps a;	#st[0]=[(g-e)/f]*{e+[(b*d)-c]/(f-g)} , st[1]=vide

ret 





