import fs from 'fs';
import { transform } from 'babel-core';

const actionStr = fs.readFileSync('./actionStrings.js', 'utf8');

function transformAction({ types: t, template }) {
//   const importX = template(`import x from "./x";`, { sourceType: "module" });
//   const exportX = template(`export const fetchUser = payload =>
//   ({ type: types.FETCH_USER, payload });
// `, { sourceType: "module" });
  let test = "yo";
  const importX = template(`import { IMPORT_NAME, IMPORT_2 } from "${test}";`, { sourceType: "module" });

  // const importX = buildRequire();

  const importId = t.identifier("fetchSomething");
  console.log('importId ', importId);

  return {
    visitor: {
      Program(path, state) {
        const lastImport = path.get("body").filter(p => p.isImportDeclaration()).pop();
        // console.log('lastImport ', lastImport)

        // const lastExport = path.get("body").filter(p => p.isExportDeclaration()).pop();

        // console.log('lastExport ', lastExport.get("body"))
        console.log(1)


        if (lastImport) {
          lastImport.insertAfter(importX({
            IMPORT_NAME: t.identifier('fetchSomething'),
            IMPORT_2: t.identifier('fetchSomethingSuccess'),
            SOURCE: t.stringLiteral("my-module")
          }));
        }
        // if (lastExport) lastExport.insertAfter(exportX());
        console.log(2)
      },
      ExportNamedDeclaration(path, state) {
        path.node.specifiers.push(importId);

        // path.node.specifiers[1].insertAfter(exportVariable());
      }
    }
  };
};

const out = transform(actionStr, {
  plugins: [transformAction]
});

console.log(out.code);

