import {TracksConstants} from "../actions/tracks_actions";
import {merge} from 'lodash/merge';

var currTrackId = 0;

const tracksReducer = (oldState = {}, action) => {
  switch (action.type) {
    case TracksConstants.START_RECORDING:
      currTrackId++;
      let track = {
        id: currTrackId,
        name: "Track " + currTrackId,
        roll: [],
        timeStart: Date.now()
      };
      return merge(oldState,track);
    case TracksConstants.STOP_RECORDING:
      let newRoll = oldState.roll.push({
        notes:[],
        timeSlice: action.timeNow - oldState[currTrackId].timeStart
      });
      let track = {
        roll: newRoll,

      };
    default:
      return oldState;
  }
};

export default tracksReducer;
