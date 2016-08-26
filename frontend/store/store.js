import {createStore} from 'redux';
import {pokemonReducer} from "../reducers/pokemon_reducer";
import masterMiddleware from '../middleware/master_middleware';

export const configureStore = (preloadedState) => (
  createStore(
    pokemonReducer,
    preloadedState,
    masterMiddleware
  )
);
