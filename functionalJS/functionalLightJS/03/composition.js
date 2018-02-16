/*
 Instructions

1. Define a `compose(..)` that takes any number of functions (as individual
arguments) and composes them right-to-left.

2. Define a `pipe(..)` that takes any number of functions (as individual
arguments) and composes them left-to-right.
*/

function increment(x) { return x + 1; }
function decrement(x) { return x - 1; }
function double(x) { return x * 2; }
function half(x) { return x / 2; }

// function compose(...fns) {
//     return pipe(...fns.reverse());
// }

const isEmpty = list => list.length === 0;

const pipe = (fn, ...fns) => arg => {
    if (isEmpty(fns)) return fn(arg);
    return pipe(...fns)(fn(arg));
    return fn2(fn1)
}

// arg => (arg => increment(arg))(half(arg))

const test = (arg) => (x => increment(x))((x => increment(x))(half(arg)));

const test2 = x => increment(decrement)
console.log('test 10 ', test2(10))

// increment(half(arg))

// var f = compose(decrement,double,increment,half);
var p = pipe(half,increment);

console.log(p(10) === 6);
// true

// console.log(f(3) === p(3));
// true
