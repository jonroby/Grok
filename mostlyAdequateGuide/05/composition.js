const compose = (f, g) => x => f(g(x));

const toUpperCase = x => x.toUpperCase();
const exclaim = x => `${x}!`;
const shout = compose(exclaim, toUpperCase);

console.log(shout('send in the clowns'));

// requirements

// reduce :: (b -> a -> b) -> b -> [a] -> b
const reduce = curry((fn, zero, xs) => xs.reduce(fn, zero));
function curry(fn) {
  const arity = fn.length;

  return function $curry(...args) {
    if (args.length < arity) {
      return $curry.bind(null, ...args);
    }

    return fn.call(null, ...args);
  };
}

const head = x => x[0];

const reverse = reduce((acc, x) => [x].concat(acc), []);
const last = compose(head, reverse);

console.log(last(['jumpkick', 'roundhouse', 'uppercut'])); // 'uppercut'


// *** Pointfree ***

// not pointfree because we mention the data: word
const snakeCase = word => word.toLowerCase().replace(/\s+/ig, '_');

// pointfree
const snakeCase = compose(replace(/\s+/ig, '_'), toLowerCase);

// * Exercises *

const car = {
  name: 'Aston Martin One-77',
  horsepower: 750,
  dollar_value: 1850000,
  in_stock: true,
}

// isLastInStock :: [Car] -> Boolean
const isLastInStock = compose(prop('in_stock'), last);

// averageDollarValue :: [Car] -> Int
const averageDollarValue = compose(average, map(prop('dollar_value')));

const append = flip(concat);

// fastestCar :: [Car] -> String
const fastestCar = (cars) => {
  const sorted = sortBy(car => car.horsepower, cars);
  const fastest = last(sorted);
  return concat(fastest.name, ' is the fastest');
};

const append = flip(concat);
const fastestCar = compose(
    append('is the fastest'),
    prop('name')
    last,
    sortBy(prop('horsepower'))
)
