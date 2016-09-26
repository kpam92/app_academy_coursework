export const pokemonConsts = {
  RECEIVE_ALL_POKEMON: "RECEIVE_ALL_POKEMON",
  REQUEST_ALL_POKEMON: "REQUEST_ALL_POKEMON"
};

export const receiveAllPokemon = (pokemon) => ({
  type: pokemonConsts.RECEIVE_ALL_POKEMON,
  pokemon
});

export const requestAllPokemon = () => ({
  type: pokemonConsts.REQUEST_ALL_POKEMON
});
