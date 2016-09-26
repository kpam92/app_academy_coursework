const readline = require('readline');

const reader = readline.createInterface({

  input: process.stdin,
  output: process.stdout
});

class Game {

  constructor() {
    this.stacks = [[3,2,1],[],[]];
  }

  promptMove(callback) {
  //  console.log(this.stacks);
    reader.question("Where do you want to move from?", function(res1) {
      reader.question("Where do you want to move to?", function(res2) {
        const startTowerIdx = parseInt(res1);
        const endTowerIdx = parseInt(res2);

        callback(startTowerIdx, endTowerIdx);
      });
    });
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if (this.stacks[startTowerIdx][0] === null) {
      return false;
    } else if (this.stacks[startTowerIdx][this.stacks[startTowerIdx].length - 1] >  this.stacks[endTowerIdx][this.stacks[endTowerIdx].length - 1]    ) {
      return false;
    } else {
      return true;
    }
  }

  move(startTowerIdx, endTowerIdx) {
    // this.promptMove(function(startTowerIdx,endTowerIdx) {
      // if (this.isValidMove(startTowerIdx, endTowerIdx) === true) {
        this.stacks[endTowerIdx].push(this.stacks[startTowerIdx].pop());
      //   return true;
      // } else {
      //   return false;
      // }
    // });
  }

  printMethod() {
    return JSON.stringify(this.stacks);
  }

  isWon() {
    if (this.stacks[1].length === 3 || this.stacks[2].length === 3) {
      return true;
    }
    else {
      return false;
    }
  }
run(completionCallback) {
  // while (this.isWon() === false) {
    console.log(this.printMethod());

    function play(this.isWon()) {
      if (isWon() === false){
        round();
      }
      else {
        sortCompletionCallback();
      }

      play(false);
    }
    round() {
      this.promptMove( (startTowerIdx, endTowerIdx) => {
        if (this.isValidMove(startTowerIdx,endTowerIdx) === true) {
          this.move(startTowerIdx,endTowerIdx);
          this.promptMove()
        } else {
          console.log("invalid move");
        }
      });
    }
}

}
let game = new Game();
game.run( function (){
  console.log("you win!!!!!");
});
