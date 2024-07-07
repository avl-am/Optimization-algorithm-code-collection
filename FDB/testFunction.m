function [ fitness ] = testFunction( x, fNumber )
    x = x';
	[dimension, pop] = size(x);
	fitness = zeros(1, pop);
	for i = 1 : pop
		fitness(i) = benchmarks(x(:,i), fNumber, dimension);
	end
end
