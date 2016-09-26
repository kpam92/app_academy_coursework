// addNumbers
//
// Let's write a function that will read several numbers, one after
// another, and sum up the total. After each number, let's print out the
// partial sums along the way, and pass the total sum to a callback when done.
//
// First off, use readline.createInterface to create a global variable,
// reader. Use process.stdin/process.stdout like I do in my examples.
//
// Next, write a function, addNumbers(sum, numsLeft, completionCallback):
//
// If numsLeft > 0, then:
// Prompt the user for a number (use reader).
// Pass a callback that:
// Uses parseInt to parse the input.
// Increment the sum and console.log it.
// Recursively calls addNumbers again, passing in:
// the increased sum,
// the decreased numsLeft,
// and the same completionCallback.
// If numsLeft === 0, call completionCallback(sum) so that the total
// sum can be used.
// To test, try out:
//
// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
// This should prompt for three numbers, printing out the partial sums
// and then the final, total sum.



const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers (sum, numsLeft, completionCallback) {
  console.log(sum);
  if (numsLeft === 0) {
    reader.close();
    return completionCallback(sum);
  }

  reader.question("Enter a number: ",(answer) => {
    sum += parseInt(answer);
    numsLeft -= 1;
    addNumbers(sum, numsLeft, completionCallback);
  });
}


addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
