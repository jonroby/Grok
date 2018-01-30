const str = "test yo = {\n\n}";
const str2 = "test yo = {\nhelloItsme\n}";

const reg = /test yo = {[\sa-zA-Z-]+(\n)/;

const res = str2.match(reg);

console.log("res ", res);
