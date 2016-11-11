function fun_plotter
%Function plotter script
%for interpolation using equally spaced and
%chebyshev nodes
r = randi([30 60],1,5);

% x range of values [a,b] for plotting
a = -2;
b = -a;
X = sprintf('Runge Fun plotter for Interp Approx');
disp(X)
for k = 1:length(r)
    % make equally spaced interpolation points
    X = sprintf('Plot %i Data',k);
    disp(X)

    n = r(k);
    h = (b-a)/(n-1);
    p = a + (0:n-1)*h;

    X = sprintf('%i Interpolation Points',n);
    disp(X)
    % make sampling points: normal and chebyshev nodes for interval [-2 2]

    n_s = randi([5 20],1,1);
    h_s = (b-a)/(n_s-1);

    x = a + (0:n_s-1)*h_s;
    c_x = (0.5)*(b-a)*cos( (2 * (1:n_s) - 1) / (2 * n_s) * pi);

    X = sprintf('%i Sampling Points',n_s);
    disp(X)

    % Runge function
    % R(x) = 1 / (1 + 20 * x^2)
    figure;
    y_c = 1 ./ (1 + 20.* c_x.*c_x);
    y = 1 ./ (1 + 20.* x.*x);
    t = 1 ./ (1 + 20 .* p.*p);
    fun_x = newtonInterp(x,y,p);
    fun_c = newtonInterp(c_x,y_c,p);

    % Plot
    hold on;
    plot(x,y,'or');
    plot(c_x,y_c,'og');
    plot(p,t,'-b');
    plot(p,fun_x,'-r');
    plot(p,fun_c,'-g');
    title('Newton Interpolation: Equal Space/Chebyshev nodes');
    legend('Equal Space samples','Chebyshev samples', 'Runge Function', 'Equal Space interpolation','Chebyshev interpolation');
end
