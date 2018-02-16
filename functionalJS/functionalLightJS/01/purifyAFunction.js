// # Instructions
// 1. Make a pure function `bar(..)` to wrap around `foo(..)`.
// 2. Make a pure function `bar(..)` that "adapts" `foo(..)` to avoid its side
// effects.

function foo(x) {
	y++;
	z = x * y;
}

var y = 5, z;

foo(20);
z;		// 120

foo(25);
z;		// 175

// Answer
function bar(x, y) {
    var z;

    foo(x);
    return [y, z];

    function foo(x) {
        y++;
        z = x * y;
    }
}
