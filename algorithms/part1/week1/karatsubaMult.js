let num1 = '3141592653589793238462643383279502884197169399375105820974944592'
let num2 = '2718281828459045235360287471352662497757247093699959574966967627'

x = []
y = []

for (let i = 0; i < num1.length; i++) {
  x.push(i)
}

for (let i = 0; i < num2.length; i++) {
  y.push(i)
}

function listToNum(list) {
  console.log('list ', list)
  if (list.length > 0) {
    return Number(list.join(''))
  } else {
    return 0;
  }
}

function numToList(num) {
  let res = [];
  let stringifiedNum = String(num)
  for (let i = 0; i < stringifiedNum; i++) {
    res.push(stringifiedNum[i]);
  }
  return res;
}

function splitList(list) {
  half = Math.floor(list.length/2);
  return { a: list.slice(0, half), b: list.slice(half) };
}

function karatsubaMult(x, y) {
  console.log(x);
  console.log(y);
  if (x.length === 0) {
    return 0;
  } else if (x.length === 1) {
    return Number(x[0]) * Number(y[0]);
  } else {
    let obj1 = splitList(x);
    let obj2 = splitList(y);

    let a = obj1.a;
    let b = obj1.b;
    let c = obj2.a;
    let d = obj2.b;

    let p = listToNum(a) + listToNum(b)
    let p_list = numToList(p)
    let q = listToNum(c) + listToNum(d)
    let q_list = numToList(q)

    let ac = karatsubaMult(a, c)
    let bd = karatsubaMult(b, d)
    let pq = karatsubaMult(p_list, q_list)

    let adbc = pq - ac - bd

    return (10^(len(x))) * ac + (10^(len(x)/2)) * adbc + bd
  }
}



karatsubaMult([5,6,7,8], [1,2,3,4])
// recursiveMultiplication(x, y)
