var View = function (game, $el) {
  console.log("new view being made");
  this.game = game;
  this.el = $el;
};

View.prototype.bindEvents = function () {
  let that = this;
  $("li").click(function(event){
    let currentTarget = event.currentTarget;
    let $currentTarget = $(currentTarget);
    let coordCode = $currentTarget.attr("data-pos");
    let coord = [Math.floor(coordCode/3),coordCode % 3];
    console.log(coordCode);
    $currentTarget.append(that.game.currentPlayer);
    $currentTarget.addClass(that.game.currentPlayer);
    that.game.playMove(coord);
    if (that.game.winner()){
      alert(`You're the winner Mr. ${that.game.winner()}`);
    }
    });
};

// View.prototype.makeMove = function ($square) {
//
// };

View.prototype.setupBoard = function () {
  console.log("setupboard being called");
  this.el.append('<ul></ul>');
  for (var x = 0; x < 9; x++) {
    $('ul').append($('<li></li>').attr("data-pos",x));
  }

  $('ul').css({'width':'600px'});
  $('li').css({'float':'left',
  'width':'200px',
  'height':'200px',
  'border':'5px solid black',
  'box-sizing':'border-box',
  'background' : 'grey'
  });



};

module.exports = View;
