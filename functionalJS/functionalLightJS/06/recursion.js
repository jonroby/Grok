// # Instructions

// 1. Turn `mult(..)` into a recursive function that can work on as many
// arguments (2 or more) as necessary.

// function mult(x,y,z) {
// 	return x * y * z;
// }

let mult = (head, ...tail) => {
    return tail.length === 0
    ? head
    : head * mult(...tail);
}

console.log(mult(3,4,5));	// 60

console.log(mult(3,4,5,6));	// Oops!
