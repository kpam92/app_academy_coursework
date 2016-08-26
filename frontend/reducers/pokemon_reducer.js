import {pokemonConsts} from "../actions/pokemon_actions";
import merge from 'lodash/merge';

const defaultState = {
  pokemon: []
};


export const pokemonReducer = (oldState = defaultState, action) => {
  switch(action.type) {
    case pokemonConsts.RECEIVE_ALL_POKEMON:
      return merge({}, oldState, {pokemon: action.pokemon});
    default:
      return oldState;
  }
};
