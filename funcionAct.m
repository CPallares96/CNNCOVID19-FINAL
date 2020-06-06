function Yo = funcionAct(x)
    k=find(x);
    [N,n]=size(x);
    Yo=zeros(1,n);
    Yo(k)=1./(1+exp(-x(k)));  %Maraña del Omar
    Yo=sparse(Yo);
end