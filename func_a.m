function z=func_a(a,n,k,omega,delta)
	phat=k/n;
	
	temp3 = a*phat;

	temp4 = (1-omega)+capF(phat-(1-omega)/a, a, delta);
  	
  	if phat<(1-omega)/a
  		z=temp3;
  	else
  		z=temp4;
  	end
  