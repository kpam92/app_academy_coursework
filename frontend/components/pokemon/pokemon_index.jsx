import React from 'react';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
    // this.state = {pokemon: []};
  }

  componentDidMount () {
    this.props.requestAllPokemon();
  }

  render () {
    const pokeList = this.props.pokemon.map(pokemon => (
      <li key={pokemon.id}>{pokemon.name}</li>
    ));
    debugger;
    return (
      <section className="pokedex">
        PokemonIndex
        <ul>
          {pokeList}
        </ul>
      </section>
    );
  }

}

export default PokemonIndex;
