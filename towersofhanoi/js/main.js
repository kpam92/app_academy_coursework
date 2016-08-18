const HanoiGame = require('./game.js');
const HanoiView = require('./hanoi-view.js');
console.log("BAKJHFVAHSASUHURHGUYRHGGDF");
$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  let newHanoiGame = new HanoiView(game, rootEl);
  newHanoiGame.setupTowers();
  newHanoiGame.render();
});
