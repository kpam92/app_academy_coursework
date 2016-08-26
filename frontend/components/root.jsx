import {Provider} from 'react-redux';
import React from 'react';
import PokemonIndexContainer from "./pokemon/pokemon_index_container.jsx";
import { Router, Route, hashHistory } from 'react-router';

const Root = (props) => {
  return (
    <Provider store={props.store}>
      <Router history={hashHistory}>
        <Route path='/' component={PokemonIndexContainer}></Route>
      </Router>
    </Provider>
  );
};

export default Root;
