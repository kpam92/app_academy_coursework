import React from "react";
import ReactDOM from "react-dom";
import Game from "./components/game.jsx";
import Minesweeper from "./minesweeper.js";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Game/>, root);
});
