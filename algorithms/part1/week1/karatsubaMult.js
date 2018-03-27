let num1 = 3141592653589793238462643383279502884197169399375105820974944592;
let num2 = 2718281828459045235360287471352662497757247093699959574966967627;

function arrToNum(arr) {
  if (arr.length > 0) {
    return Number(arr.map(i => String(i)).join(''))
  } else {
    return 0;
  }
}

function numToArr(num) {
  let res = [];
  let stringifiedNum = String(num)
  for (let i = 0; i < stringifiedNum; i++) {
    res.push(stringifiedNum[i]);
  }
  return res.map(i => Number(i));
}

function splitList(list) {
  half = Math.floor(list.length/2);
  return { a: list.slice(0, half), b: list.slice(half) };
}


function numOfDigits(num) {
  return String(num).length;
}

function getSplits(num) {
  let arr = numToArr(num);
  let half = Math.floor(arr.length/2);
  let firstHalf = arr.slice(0, half)
  let secondHalf = arr.slice(half)

  return { firstHalf, secondHalf };
}

function karatsubaMult(x, y) {
  if (numOfDigits(x) === 0) {
    return 1;
  } else if (numOfDigits(x) === 1) {
    return x * y;
  } else {
    let splitX = getSplits(x);
    let splitY = getSplits(y);

    let a = splitX.firstHalf;
    let b = splitX.secondHalf;
    let c = splitY.firstHalf;
    let d = splitY.secondHalf;

    let p = a + b
    let q = c + d

    let ac = karatsubaMult(a, c);
    console.log('ac ', ac)
    let bd = karatsubaMult(b, d);
    console.log('bd ', bd)
    let pq = karatsubaMult(p, q);
    console.log('pq ', pq)

    let adbc = pq - ac - bd;

    return (10^(numOfDigits(x))) * ac + (10^(numOfDigits(x)/2)) * adbc + bd;
  }
}



let res = karatsubaMult(10, 12)
console.log('res ', res);
// recursiveMultiplication(x, y)
