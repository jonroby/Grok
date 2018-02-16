// A pure function is a function that, given the same input, will always return
// the same output and does not have any observable side effect.

// Case for purity:

// * Cacheable *

const memoize = f => {
    const cache = {};

    return (...args) => {
        const argStr = JSON.stringify(args);
        console.log('f(...args) ', f(...args));
        cache[argStr] = cache[argStr] || f(...args);
        return cache[argStr];
    };
};

const squareNumber = memoize(x => x * x);

squareNumber(4);

squareNumber(4); // => 16, returning cache

// Some impure functions can be transformed into pure functions by delaying
// evaluation.

// const pureHttpCall = memoize((url, params) => () => $.getJSON(url, params));

// impure
// const signUp = attrs => {
//     const user = saveUser(attrs);
//     welcomeUser(user);
// };

// pure
// const signUp = (Db, Email, attrs) => () => {
//     const user = saveUser(Db, attrs);
//     welcomeUser(Email, user);
// }

// * Testable *

// Pure functions are easier to test, because we don't have to mock a real
// payment gateway or setup and assert the state of the world after each test.

// * Reasonable *

// * Parallel *

// Finally, and here's the coup de grâce, we can run any pure function in parallel
// since it does not need access to shared memory and it cannot, by definition,
// have a race condition due to some side effect.
//
// This is very much possible in a server side js environment with threads as well
// as in the browser with web workers though current culture seems to avoid it due
// to complexity when dealing with impure functions.
