import fs from 'fs';
import { transform } from 'babel-core';

const actionStr = fs.readFileSync('./actionStrings.js', 'utf8');

function transformAction({ types: t, template }) {
  const importX = template(`import x from "./x";`, { sourceType: "module" });
  const exportX = template(`export const fetchUser = payload =>
  ({ type: types.FETCH_USER, payload });
`, { sourceType: "module" });

  return {
    visitor: {
      Program(path, state) {
        const lastImport = path.get("body").filter(p => p.isImportDeclaration()).pop();
        // console.log('lastImport ', lastImport)

        const lastExport = path.get("body").filter(p => p.isExportDeclaration()).pop();

        if (lastImport) lastImport.insertAfter(importX());
        if (lastExport) lastExport.insertAfter(exportX());
      },
    }
  };
};

const out = transform(actionStr, {
  plugins: [transformAction]
});

console.log(out.code);
