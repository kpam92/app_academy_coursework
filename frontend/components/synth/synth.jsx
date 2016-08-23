import React from 'react';
import Note from '../../util/note';
import { NOTE_NAMES, TONES } from '../../util/tones';
import $ from 'jquery';
//
class Synth extends React.Component {
  constructor(props) {
    super(props);
    this.notes = NOTE_NAMES.map( tone => {
      return new Note(TONES[tone]);
    });
  }

  onKeyDown(e) {
    this.props.keyPressed(String.fromCharCode(e.keyCode).toLowerCase());
  }

  onKeyUp(e) {
    this.props.keyReleased(String.fromCharCode(e.keyCode).toLowerCase());
  }

  componentDidMount() {
    $(document).on('keydown', e=> this.onKeyDown(e));
    $(document).on('keyup', e=> this.onKeyUp(e));
  }
  playNotes() {
    this.notes.forEach( (note,index) => {
      if (this.props.notes.includes(NOTE_NAMES[index])) {
        note.start();
      } else {
        note.stop();
      }
    });
  }
  render() {
    this.playNotes();
    return(
      <div><ul>{this.notes.map( note => {

      })}
      </ul></div>
    );
  }
}
export default Synth;
