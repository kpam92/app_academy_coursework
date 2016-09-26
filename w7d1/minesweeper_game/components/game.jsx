import React from "react";
import Minesweeper from "../minesweeper.js";

class Game extends React.Component{
  constructor(){
    super();
    this.state = { board: new Minesweeper.Board(10, 3)};
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(){}


  render() {

    <Board grid={this.state.board} state={this.updateGame}/>

  }
}



export default Game;
