import fs from 'fs';
import { transform } from 'babel-core';

const actionStr = fs.readFileSync('./actionStrings.js', 'utf8');

function transformAction({ types: t }) {
  return {
    visitor: {

    }
  };
};

const out = transform(actionStr, {
  plugins: [transformAction]
});

console.log(out.code);
