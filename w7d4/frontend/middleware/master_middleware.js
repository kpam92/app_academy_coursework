import { applyMiddleware} from 'redux';

import PokemonMiddleware from "./pokemon_middleware";


const masterMiddleware = applyMiddleware(
  PokemonMiddleware
);

export default masterMiddleware;
