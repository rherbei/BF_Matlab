function z=func_b(a,n,k, omega, delta)
	a1=func_a(a, n, k, omega, delta);
	C=a^2*sqrt(2)/( delta*sqrt(exp(1)) );
	z=a1+C/(2*n);