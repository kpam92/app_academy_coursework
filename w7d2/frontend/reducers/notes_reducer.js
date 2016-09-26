import {NotesConstants} from "../actions/note_actions";

const NotesReducer = function(oldState = [], action) {
  if (!validKeys.includes(action.key)) return oldState;
  let key = keyMap[action.key];
  function removeKey(){
    var index = oldState.indexOf(key);
    var newState = Array.from(oldState);
    newState.splice(index,1);
    return newState;
  }
  switch(action.type) {
    case NotesConstants.KEY_PRESSED:
      return (oldState.includes(key) ? oldState : [...oldState, key]);
    case NotesConstants.KEY_RELEASED:
      return (oldState.includes(key) ? removeKey() : oldState );
    default:
      return oldState;
  }
};

const validKeys = ["a","s","d","f","g"];
const keyMap = {a: "C5", s: "D5", d: "E5", f: "F5", g: "G5"};



export default NotesReducer;
