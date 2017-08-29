function [W nb]=bernfactory(a,ptrue);
    omega=1/5;
    delta=1/6;
    i=1;
    give_log = 0;
    n=2^i; 
    lhh = 0;
    uhh = 1;
    lh = 0;
    uh = 1;
    lhhpr = 0;
    uhhpr = 1;
    while (func_b(a, n, n, omega, delta) > 1)
        n = 2*n;
    end
    
    
    nstar = n;
    
    g0 = rand;%uniform(0,1)
    
    
    Hpr = binornd(n/2, ptrue);
    
    k=0;
    while ((g0 <= uhh) && (g0 > lhh)) 
    	k = k + 1;
    	
        H = Hpr + binornd(n/2, ptrue);
        
    	lh = func_a(a, n, H, omega, delta);
    	uh = func_b(a, n, H, omega, delta);
    	
        
    	
    	if (n == nstar) 
            lstar = 0;
            ustar = 1;
    	else 
            lstar = 0;
            ustar = 0;
            for j = 0:H
                prob = hygepdf(j, n, H, n/2);
                lstar = lstar + prob * func_a(a, n/2, j, omega, delta);
                ustar = ustar + prob * func_b(a, n/2, j, omega, delta);
            end
     end	
     
     lhh = lhhpr + (lh - lstar)*(uhhpr - lhhpr)/(ustar - lstar);
     uhh = uhhpr + (uh - ustar)*(uhhpr - lhhpr)/(ustar - lstar);
     Hpr = H;
     lhhpr = lhh;
     uhhpr = uhh;
     n = 2*n;
    end		
    
    if (g0 <= lhh) 
        W = 1;
    end
    if (g0 > uhh)
        W = 0;
    end
    
    nb=n/2;
    