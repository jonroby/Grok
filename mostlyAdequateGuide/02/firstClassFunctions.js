// The function wrapper around hi in greeting is redundant.
const hi = name => `Hi ${name}`;
const greeting = name => hi(name);

// ignorant
const getServerStuff = callback => ajaxCall(json => callback(json));

// enlightened
const getServerStuff = ajaxCall;
