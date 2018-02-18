function R = Power(name, d, eps)
output_precision(6);
fid = fopen(name, "r");
N = fgetl(fid);
N = str2num(N);
w = zeros(1, N);
M = zeros(N);
A = zeros(N);
L = zeros(1, N);
u = ones(N ,1);
P = zeros(N);
R = ones(N, 1);
R = R.*1/N;
y = ones(N,1);
%A = adjacency matrix, L = link vector
for i = 1:N
	w = fgetl(fid);
	w = str2num(w);
	for j = 3:(w(2)+2)
		A(i,w(j)) = 1;
	end
	L(i) = w(2);
end
%supplementary condition
for i =1:N
	if A(i,i) == 1
		A(i,i) = 0;
		L(i) = L(i)-1;
	end
end
%M
for i = 1:N
	for j = 1:N
		if A(j,i) == 1
			M(i,j) = 1/L(j);
		end
	end
end

%column-stochastic matrix
P = d*M + ((1-d)/N)*ones(N);

while 1
	z = P*y;
	y = z/norm(z);
	l = y'*P*y;
	y = y/norm(y,1);
	if norm(P*y - l*y) < eps
		break;
	end
end

%R is the principal eigenvector of P
R = P*y;
fclose(fid);

endfunction
