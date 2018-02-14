/*
# Instructions
1. Refactor the output(..), printIf(..), and isLongEnough(..) functions
to be point-free style.

2. Hints:
	- Some browsers require console.log(..) to run against the console
context , so x = console.log; x(..) fails (because of lost this binding).
Use console.log.bind(console) to be safe.
	- printIf(..) can be expressed in terms of a when(..) that looks like:
*/

function when(fn) {
	return function(predicate){
		return function(...args){
			if (predicate(...args)) {
				return fn(...args);
			}
		};
	};
}

function negate(fn) {
    return function(...args) {
        return !fn(...args)
    }
}

function isShortEnough(str) {
	return str.length <= 5;
}

// function output(txt) {
// 	console.log(txt);
// }

let output = console.log.bind(console);

// function printIf(predicate) {
// 	return function(msg) {
// 		if (predicate(msg)) {
// 			output(msg);
// 		}
// 	};
// }

let printIf = when(output);

// function isLongEnough(negate) {
// 	return !isShortEnough(str);
// }

let isLongEnough = negate(isShortEnough);



var msg1 = "Hello";
var msg2 = msg1 + " World";

printIf(isShortEnough)(msg1);		// Hello
printIf(isShortEnough)(msg2);
printIf(isLongEnough)(msg1);
printIf(isLongEnough)(msg2);		// Hello World
