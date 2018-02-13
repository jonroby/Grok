const add = x => y => x + y;

const increment = add(1);
const addTen = add(10);

// curry :: ((a, b, ...) -> c) -> a -> b -> ... -> c
function curry(fn) {
  const arity = fn.length;

  return function $curry(...args) {
    if (args.length < arity) {
      return $curry.bind(null, ...args);
    }

    return fn.call(null, ...args);
  };
}

const match = curry((what, s) => s.match(what));
const replace = curry((what, replacement, s) => s.replace(what, replacement));
const filter = curry((f, xs) => xs.filter(f));
const map = curry((f, xs) => xs.map(f));

// Notice that the data that's being operated on (string, array) is the last
// argument.

match(/r/g, 'hello world'); // [ 'r' ]

const hasLetterR = match(/r/g); // x => x.match(/r/g)
hasLetterR('hello world'); // [ 'r' ]
hasLetterR('just j and s and t etc'); // null

filter(hasLetterR, ['rock and roll', 'smooth jazz']); // ['rock and roll']

const removeStringsWithoutRs = filter(hasLetterR); // xs => xs.filter(x => x.match(/r/g))
removeStringsWithoutRs(['rock and roll', 'smooth jazz', 'drum circle']); // ['rock and roll', 'drum circle']

const noVowels = replace(/[aeiou]/ig); // (r,x) => x.replace(/[aeiou]/ig, r)
const censored = noVowels('*'); // x => x.replace(/[aeiou]/ig, '*')
censored('Chocolate Rain'); // 'Ch*c*l*t* R**n'

const getChildren = x => x.childNodes;
const allTheChildren = map(getChildren);


// Exercises
// Refactor to remove all arguments by partially applying the function

// words :: String -> [String]
const split = curry((separator, str) => str.split(separator));
const words = split(' ');

console.log('words in a sentence', words('words in a sentence'))

// const match = curry((what, s) => s.match(what));

// Refactor to remove all arguments by partially applying the functions.
// const filterQs = xs => filter(x => x.match(/q/i), xs);

// filterQs :: [String] -> [String]
const filterQs = filter(match(/q/i));

// Refactor `max` to not reference any arguments using the helper function `keepHighest`.
// const max = xs => reduce((acc, x) => (x >= acc ? x : acc), -Infinity, xs);

// reduce :: (b -> a -> b) -> b -> [a] -> b
const reduce = curry((fn, zero, xs) => xs.reduce(fn, zero));
const keepHighest = (acc, x) => (x >= acc ? x : acc);

// :: [Number] -> Number
const max = reduce(keepHighest)(-Infinity);
