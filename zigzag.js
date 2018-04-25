let convert = (s, numRows) => {
  if (numRows === 1) return s;
  let jump = (n, i) => i + (2 * ((n - 1) - (i % (n - 1))));
  let retStr = '';
  for (let i = 0; i < numRows; i++) {
    let j = i;
    while (j < s.length) {
      retStr = retStr + s[j];
      j = jump(numRows, j);
    }
  }
  return retStr;
}

let res = convert('abcd', 2);

// PAHNAPLSIIGYIR
// PINALSIGYAHRPI

console.log('res ', res);
