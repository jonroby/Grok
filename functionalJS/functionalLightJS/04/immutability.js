/*
# Instructions

1. Define `pickNumbers(..)` so that it's a pure function (other than the
randomness!) which generates a new random lottery number (using `lotteryNum()`)
and adds it to the list.

2. `pickNumbers(..)` should always keep the list of lottery numbers sorted in
ascending order. Also, no duplicates!
*/

function lotteryNum() {
	return (Math.round(Math.random() * 100) % 58) + 1;
}

function addToList(i, list, item) {
    if (list.length === 0) {
        return [item];
    }
    return list.slice(0, i) + [item] + list.slice(i);
}

function pickNumber(nums) {
    let rand = lotteryNum();
    let idx = nums.indexOf(rand);
    if (idx !== -1) return addToList(idx, nums, rand);
    return nums;
}

var luckyLotteryNumbers = [];

for (var i = 0; i < 6; i++) {
	pickNumber(luckyLotteryNumbers);
}

console.log(luckyLotteryNumbers);
