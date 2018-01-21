clear; clc;

main()

function main()
	p = gcp(); 

	FAIL=1
	N = 100;
	F = parfeval(p, @test,1, N);
    [completedIdx,thisResult] = fetchNext(F)

    FAIL
	% nested function
	function idx = test(idx)
		A=magic(idx^1.5);
		FAIL=1488
	end
end