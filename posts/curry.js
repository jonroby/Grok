function multiplySubtract(a, b, c) {
    return a * b - c;
}

multiplySubtract()

function curry(fn) {
    let len = fn.length;

    function step(length, args) {
        if (length === 0) {
            return fn(...args);
        } else {
            return function(x) {
                args.push(x);
                return step(length - 1, args);
            };
        }
    }

    return step(len, []);
}

const curry = fn => {
    const recurse = args => {
        if (fn.length === args.length) return fn(...args);
        return x => recurse(args + [x]);
    };
    
    return recurse([]);
};

function uncurry(fn) {
    let final = null;
    function step(f, args) {
        if (typeof f() !== "function") {
            final = f;
        } else {
            step(f)
        }
    }

    return step()

    return function(x, y, z)
}

let curriedMultiplySubtract = curry(multiplySubtract);
let ans = curriedMultiplySubtract(10)(3)(2);
console.log(ans);
