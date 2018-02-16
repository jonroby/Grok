/* # Instructions

1. Define `foo(..)` so that it produces a function which remembers only the
first two arguments that were passed to `foo(..)`, and always adds them together
and returns the result.

*/

function foo(x, y) {
    return () => x + y;
}

var x = foo(3,4);

console.log(x());	// 7
console.log(x(2,1));	// 7
