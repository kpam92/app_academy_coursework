import {Provider} from 'react-redux';
import React from 'react';
import PokemonIndexContainer from "./pokemon/pokemon_index_container.jsx";

const Root = (props) => {
  return (
    <Provider store={props.store}>
      <PokemonIndexContainer />
    </Provider>
  );
};

export default Root;
