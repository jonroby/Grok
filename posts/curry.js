function test(a, b, c) {
    return a * b - c;
}

function curry(fn) {
    let len = fn.length;
    let args = [];

    function step(length, arg) {
        if (length === 0) {
            return fn(...args);
        } else {
            return function(x) {
                args.push(x);
                return step(length - 1);
            };
        }
    }

    return step(len);
}

let curriedTest = curry(test);
let ans = curriedTest(10)(3)(2);
