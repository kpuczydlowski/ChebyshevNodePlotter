function [fun, coef] = newtonInterp(x,y,t)
%Compute the Newton Interpolating Polynomial
%In:
%x - inputs to unknown function
%y - known outputs of unknown function
%t - point desired for approximation
%Out:
%polynomial function approximation, newton method coefficients


n = length(x);
% get coefficients from newton divided differences
coef = InterpN(x,y);

d_f(1,:) = repmat(1,size(t)); %resizes
c(1,:) = repmat(coef(1),size(t));

% iteratively compute interpolation
for i = 2:n
    d_f(i,:) = ( (t - x(i-1)) .* d_f(i-1,:));
    c(i,:) = coef(i) .* d_f(i,:);
end
fun = sum(c); % return sum along columns
end
