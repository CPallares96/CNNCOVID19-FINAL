function z = taylorSigmoid(x,y)
z=0.5+ (x*y/4)+((x^3)*(y^3)/48)+((x^5)*(y^5)/480);
end