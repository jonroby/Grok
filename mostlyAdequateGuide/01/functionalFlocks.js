const conjoin = (flockX, flockY) => flockX + flockY;
const breed = (flockX, flockY) => flockX * flockY;

const flockA = 4;
const flockB = 2;
const flockC = 0;

const r1 = conjoin(
    breed(flockB, conjoin(flockA, flockC)), // 2 * 4 = 8
    breed(flockA, flockB) // 4 * 2 = 8
); // 8 + 8 = 16

console.log('r1 ', r1);

const add = (x, y) => x + y;
const multiply = (x, y) => x * y;

const r2 = add(
    multiply(flockB, add(flockA, flockC)),
    multiply(flockA, flockB)
);

console.log('r2 ', r2);

// associative
// add(add(x, y), z) === add(x, add(y, z));

// commutative
// add(x, y) === add(y, x);

// identity
// add(x, 0) === x;

// distributive
// multiply(x, add(y,z)) === add(multiply(x, y), multiply(x, z));
