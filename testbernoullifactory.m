clear all;
close all;



ptrue=0.1;
a=2;


B=10000;

Wkeep=[];

for k=1:B
    [W nb]=bernfactory(a,ptrue);
    Wkeep = [Wkeep, W];
    fprintf(1,'k=%d W=%d, number of inputs needed=%d\n',k,W,nb);
end

    