const Board =require("./snake.js");

class View {
  constructor(element) {
    this.$el = $(element);
    this.board = new Board();
    let that = this;
    $(document).on("keydown",function(event){
      if (event.which === 87) {
      that.board.changeDirection("N");
      } else if (event.which === 65) {
        that.board.changeDirection("W");
      } else if (event.which === 88) {
        that.board.changeDirection("S");
      } else if (event.which === 68) {
        that.board.changeDirection("E");
      }
    });
    window.setInterval(() => {
      that.step();
    },500);
  }

  step() {
    this.board.snake.move();

  }
}
