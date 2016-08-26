
// export const receiveAllPokemon = (data) => {
//   console.log(data);
// };

export const fetchAllPokemon = (success) => {
  $.ajax({
    type: "GET",
    url: "/api/pokemon",
    success
  });
};
