import {fetchAllPokemon} from '../util/api_util';
import {receiveAllPokemon, pokemonConsts} from '../actions/pokemon_actions';


export default (store) => next => action => {

  const pokeSuccess = data => store.dispatch(receiveAllPokemon(data));
  switch (action.type) {
    case pokemonConsts.REQUEST_ALL_POKEMON:
      fetchAllPokemon(pokeSuccess);
      return next(action);
    default:
      return next(action);
  }
};
