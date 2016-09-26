const View = require('./ttt-view.js');// require appropriate file
const Game = require('./game.js');// require appropriate file

$( () => {
  let newGame = new Game;
  let newView = new View(newGame,$('figure'));
  newView.setupBoard();
  // Your code here

    $("li").mouseover(function(event){
      let currentTarget = event.currentTarget;
      let $currentTarget = $(currentTarget);
      $currentTarget.css("background","yellow");
        // $("li").css("background", "yellow");
    });
    $("li").mouseout(function(event){
      let currentTarget = event.currentTarget;
      let $currentTarget = $(currentTarget);
      $currentTarget.css("background","grey");
        // $("li").css("background", "yellow");
    });

    newView.bindEvents();
});
