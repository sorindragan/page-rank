function y = ImportanceFactor(x, val1,  val2);
%values of a and b to keep the function continuous
a = 1/(val2 - val1);
b = - val1/(val2 - val1);
%memeber function
if x>=0 && x<val1
	y = 0;
end
if x>=val1 && x<=val2
	y = a*x + b;
end
if x>val2 && x<1
	y = 1;
end
endfunction
