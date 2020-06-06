function z=taylorSigmoidD(x,y,w)
if w==1
    yp3=y*(y')*y;
    yp5=y*(y')*y*(y')*y;
    xp2=x*x';
    xp4=x*(x')*(x)*x';

    z=y/4 + ((xp2)*(yp3)/16)+ ((xp4)*(yp5)/96);
else
    xp3=x*(x')*x;
    xp5=x*(x')*x*(x')*x;
    yp2=y*y';
    yp4=y*(y')*(y)*y';
    z=x/4 + ((xp3)*(yp2)/16)+ ((xp5)*(yp4)/96);
end
end