var fs = require("fs");
const rules = fs.readFileSync('input.txt').toString().split("\n");

const parents = new Map();

for (rule of rules) {
  [parent, childrenString] = rule.split('s contain');
  const childrenMatches = childrenString.matchAll(/[a-z]+ [a-z]+ bag/g);
  for (let childMatch of childrenMatches) {
    child = childMatch[0];
    if (parents.has(child)) {
      parents.get(child).push(parent);
    } else {
      parents.set(child, [parent]);
    }
  }
}

const bags = new Set();

function findBags(bag) {
  const parentBags = parents.get(bag);
  parentBags && parentBags.forEach((parentBag) => {
    bags.add(parentBag);
    findBags(parentBag);
  })
}

findBags('shiny gold bag');

console.log('Bags which can hold a shiny gold bag:', bags.size);