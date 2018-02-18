function B = GramSchmidt(A)
%define Q and R
[m n] = size(A);
Q = zeros(m,n);
R = zeros(n);
%modified Gram Schmidt algorithm
for i = 1:n
	R(i,i) = norm(A(:,i));
	Q(:,i) = A(:,i)/R(i,i);
	for j = i+1:n
		R(i,j) = Q(:,i)' * A(:,j);
		A(:,j) = A(:,j) - Q(:,i)*R(i,j);
	end
end
B = inv(R) * Q';
endfunction


