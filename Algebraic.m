function R = Algebraic(nume, d)
output_precision(6);
fid = fopen(nume, "r");
N = fgetl(fid);
N = str2num(N);
w = zeros(1, N);
M = zeros(N);
A = zeros(N);
L = zeros(1, N);
u = ones(N ,1);
R = ones(N, 1);
R = R.*1/N;
%A = adjacency matrix, L = link vector
for i = 1:N
	w = fgetl(fid);
	w = str2num(w);
	for j = 3:(w(2)+2)
		A(i,w(j)) = 1;
	end
	L(i) = w(2);
end

for i =1:N
	if A(i,i) == 1
		A(i,i) = 0;
		L(i) = L(i)-1;
	end
end

for i = 1:N
	for j = 1:N
		if A(j,i) == 1
			M(i,j) = 1/L(j); %j is linked to i, 0 otherwise
		end
	end
end
%calculate matrix inverse with Gramm Schmidt algorithm
B = GramSchmidt(eye(N) - d*M);
%result
R = B*((1-d)/N)*u;
fclose(fid);
endfunction
