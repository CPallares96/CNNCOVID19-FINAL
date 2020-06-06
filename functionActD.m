function z = functionActD(x,y,w)
if w==1
    z=-1*(exp(x*y')*y);
    z=z./((1+exp(-x*y')) * (1+exp(-x*y'))');
end

if w==2
    z=-1*(exp((y*x))*x');
    z=z./((1+exp((-x'*y'))) * (1+exp(-x'*y')'));
    
end

end

% function z = functionActD(x,y,w)
% if w==1
%     z=-1*(exp(x*y)*y);
%     z=z./((1+exp(-x*y)) * (1+exp(-x*y)));
% end
% 
% if w==2
%     z=-1*(exp(x*y)*x);
%     z=z./((1+exp(-x*y)) * (1+exp(-x*y)));
%     
% end
% 
% end