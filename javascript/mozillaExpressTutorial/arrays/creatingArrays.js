let shopping = ["bread", "milk", "cheese", "hummus", "noodles"];
shopping;

let babies = [];

/**
 * defines an Infant
 */
class Infant {
  /**
   * @param {number} a first num
   * @param {number} b second num
   */
  constructor(a, b) {
    this.underFive = a || null;
    this.other = b;

    return 5;
  }
}
/**
 * @param {number} nInput the upper limit
 */
function create(nInput) {
  for (let i = -4; i < nInput; i++) {
    babies.push(new Infant(i, i + 10));
  }
}


create(10);


let myOwnList = [1, 2, 5, 7, "hello"];

console.log(myOwnList.length);
console.log(myOwnList.join(","));

console.log(babies);
