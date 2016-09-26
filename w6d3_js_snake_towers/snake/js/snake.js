class Snake {
  constructor() {
    this.direction = "E";
    this.segments = [[10,10]];
    this.growing = false;
  }

  move() {
    let temp = this.segments[this.segments.length - 1];
    if (this.direction === "E"){
      temp[1] += 1;
    } else if (this.direction === "W") {
      temp[1] -= 1;
    } else if (this.direction === "N") {
      temp[0] -= 1;
    } else {
      temp[0] += 1;
    }
    this.segments.push(temp);
  }

  eatenItself() {
    let head = this.segments[this.segments.length - 1];
    let eaten = false;
    this.segments.forEach((el,idx) => {
      if (idx !== this.segments.length -1) {
        if (el[0] === head[0] && el[1] === head[1]) {
          eaten = true;
        }
      }
    });
    return eaten;
  }

  changeDirection(direction) {
    this.direction = direction;
  }





}


class Board {

  constructor() {
    this.snake = new Snake;
    this.apple = [Math.floor(Math.random() * 20),Math.floor(Math.random() * 20)];
  }

  makeApple() {
    this.apple = [Math.floor(Math.random() * 20),Math.floor(Math.random() * 20)];
  }

  checkLost() {
    let lost = false;
    let head = this.snake.segments[this.snake.segments.length - 1];
    if (head[0] > 20 || head[1] > 20) {
      lost = true;
    } else if (head[0] < 0 || head[1] < 0) {
      lost = true;
    } else if (this.snake.eatenItself() === true) {
      lost = true;
    }

    //checks head direction if its going off board or into itself
  }

  changeDirection(direction){
    this.snake.changeDirection(direction);
  }




}


module.exports = Board;
