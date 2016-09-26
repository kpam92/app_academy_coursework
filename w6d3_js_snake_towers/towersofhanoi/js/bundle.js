/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const HanoiGame = __webpack_require__(1);
	const HanoiView = __webpack_require__(2);
	console.log("BAKJHFVAHSASUHURHGUYRHGGDF");
	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  let newHanoiGame = new HanoiView(game, rootEl);
	  newHanoiGame.setupTowers();
	  newHanoiGame.render();
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class HanoiView {
	  constructor(hanoigame,dom){
	    this.$dom = dom;
	    this.game = hanoigame;
	    this.columns = [];
	  }
	  setupTowers() {
	    this.$dom.append("<ul><li id=1></li><li id=2></li><li id=3></li></ul><ul></ul><ul></ul>");
	    $("ul").css("float", "left");

	    $("ul").each(function(idx, el) {
	    $(el).attr("data-pos", idx);
	    $(el).css({
	      "width":"100px",
	      "border":"1px solid black",
	      "height":"60px"
	    });
	  });

	  $("#1").css({
	    "width":"20px",
	    "background":"blue",
	    "margin" : "5px auto ",
	    "border-radius" : "10px",
	    "height" : "10px"
	  });

	  $("#2").css({
	    "width":"40px",
	    "background":"orange",
	    "margin" : "5px auto ",
	    "border-radius" : "10px",
	    "height" : "10px"
	  });

	  $("#3").css({
	    "width":"60px",
	    "background":"red",
	    "margin" : "5px auto ",
	    "border-radius" : "10px",
	    "height" : "10px"
	  });

	  $("li").css({
	  });

	  }

	  render() {
	    let that = this;
	    $('ul').click( function(event) {
	      let currentTarget = event.currentTarget;
	      let $currentTarget = $(currentTarget);
	      that.columns.push($currentTarget.attr('data-pos'));

	      if (that.columns.length === 2) {

	        if (that.game.move(that.columns[0],that.columns[1])) {
	          let $pieceToMove = $("ul[data-pos="+that.columns[0] + "]").children().first();
	          // let $pieceToMove = that.$dom.find("data[pos]='" + that.columns[0]);
	          $currentTarget.prepend($pieceToMove);
	          that.columns = [];
	        }
	        else {
	          that.columns = [];
	        }
	      }
	    });

	  }

	}

	module.exports = HanoiView


/***/ }
/******/ ]);