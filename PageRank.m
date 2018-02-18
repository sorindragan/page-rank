function [R1 R2 R3] = PageRank(nume, d, eps)
output_precision(6);
fid = fopen(nume, "r");
N = fgetl(fid);
N = str2num(N);
w = zeros(1,N);
v = zeros(1,N);
a = zeros(1,N);
b = zeros(1,N);
u = zeros(1,N);

for i = 1:N
	M = fgetl(fid);
end
%read val1 and val2 from the last two rows of the line
val1 = fgetl(fid);
val1 = str2num(val1);

val2 = fgetl(fid);
val2 = str2num(val2);

R1 = Iterative(nume, d, eps);
R2 = Algebraic(nume, d);
R3 = Power(nume, d, eps);
R = R2';
%b contains the indices
for i = 1:N
	b(i) = i;
end
%w contains usorted PageRank indice 
for i = 1:N
	w(i) =R(i);
end
%classical bubble sort
for i = 1:N
	for j = 1:N
		if (R(i) < R(j)) && (abs(R(i) - R(j)) > eps)
			aux = R(i);
			R(i) = R(j);
			R(j) = aux;
		end
	end
end
R = fliplr(R);
%v contains sorted PageRank indices
for i = 1:N
	v(i) = R(i);
end
%v and w comparison
for j = 1:N
	if v(1) == w(j);
		v(1) = j;
		break;
	end
end

for i = 2:N
	for j = 1:N
		if v(i) == w(j);
			if v(i-1) != j
				v(i) = j;
			end
		end
	end
end
for i = 1:N
	u(i) = ImportanceFactor(R(i), val1, val2);
end
fclose(fid);
b = b';
v = v';
u = u';
name = [nume ".out"];
fid2 = fopen(name, "w");
fprintf(fid2, "Number of nodes: %d\n\n", N);
fprintf(fid2, "Iterative version: \n");
fprintf(fid2, "%f\n", R1);
fprintf(fid2, "\n");
fprintf(fid2, "Algebraic version: \n");
fprintf(fid2, "%f\n", R2);
fprintf(fid2, "\n");
fprintf(fid2, "Power Method version: \n");
fprintf(fid2, "%f\n", R3);
fprintf(fid2, "\n");
fprintf(fid2, "Rankings: \n");
for i = 1:N
fprintf(fid2, "%d %d %f \n" ,b(i),v(i),u(i));
end
fclose(fid2);
endfunction
