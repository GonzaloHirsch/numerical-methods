% Parametros para los metodosleft = 0;right = 0.15;ya = 0;N = 15;% Parametros para la funcion y su derivadaa = 5000/2501;b = 100/2501;% F sin derivarfun = @(t) (a*exp(-t/2)) + (b*sin(25*t)) - (a*cos(25*t));% Derivada de ffun_prime = @(t, yt) (-0.5 * yt) + 50 * sin(25 * t);% METODO RK4% Listas para los h y sus erroresh_val = [];e_val = [];for j=1:12  h = right/pow2(j);  [x, u] = rk4(fun_prime, left, right, ya, pow2(j), h);  e = error(fun, x, u);  h_val = [h_val h];  e_val = [e_val e];end% Valores correspondientes a h y el error que se obtienedisp('RK4 Table(h - Global Error):')vals = [h_val; e_val]'% METODO RK3h_val = [];e_val = [];for j=1:12  h = right/pow2(j);  [x, u] = rk3(fun_prime, left, right, ya, pow2(j), h);  e = error(fun, x, u);  h_val = [h_val h];  e_val = [e_val e];end% Valores correspondientes a h y el error que se obtienedisp('RK3 Table(h - Global Error):')vals = [h_val; e_val]'% METODO HEUNh_val = [];e_val = [];for j=1:12  h = right/pow2(j);  [x, u] = heun(fun_prime, left, right, ya, pow2(j), h);  e = error(fun, x, u);  h_val = [h_val h];  e_val = [e_val e];end% Valores correspondientes a h y el error que se obtienedisp('Heun Table(h - Global Error):')vals = [h_val; e_val]'% METODO EULERh_val = [];e_val = [];for j=1:12  h = right/pow2(j);  [x, u] = euler(fun_prime, left, right, ya, pow2(j), h);  e = error(fun, x, u);  h_val = [h_val h];  e_val = [e_val e];end% Valores correspondientes a h y el error que se obtienedisp('Euler Table(h - Global Error):')vals = [h_val; e_val]'