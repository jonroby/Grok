let Combinatorics = require('js-combinatorics');

let nums =  [1,3,4,6];

let add = (num1, num2) => {
    return num1 + num2;
}

let subtract = (num1, num2) => {
    return num1 - num2;
}

let multiply = (num1, num2) => {
    return num1 * num2;
}

let divide = (num1, num2) => {
    return num1 / num2;
}

let operations = [add, subtract, multiply, divide];

let test = (arr, ops) => {
    let w = arr[0];
    let x = arr[1];
    let y = arr[2];
    let z = arr[3];

    let op1 = ops[0];
    let op2 = ops[1];
    let op3 = ops[2];

    return op3(op2(op1(w,x), y), z);
}

let testAll = () => {
    let numberPermutations = Combinatorics.permutation(nums);

    let operationsCombinations = Combinatorics.combination(operations, 3);


    while (n = numberPermutations.next()) {
        while (ops = operationsCombinations.next()) {
            console.log("result ", test(n, ops));
            if (test(n, ops) === 25) {
                return true;
            }
        }
    }

    return false;
}

console.log(testAll());
