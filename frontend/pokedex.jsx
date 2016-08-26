import React from 'react';
import ReactDOM from 'react-dom';
import {configureStore} from "./store/store";
// import * as API from './util/api_util.js';
// import * as ACTIONS from './actions/pokemon_actions';
import Root from "./components/root";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, root);
  window.store = store;
});
