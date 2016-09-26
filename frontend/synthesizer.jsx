import Note from "./util/note";
import configureStore from './store/store';
import Root from './components/root';
import ReactDOM from 'react-dom';
import React from 'react';

document.addEventListener("DOMContentLoaded", function(){
  ReactDOM.render(<Root store={configureStore()}/>, document.getElementById('root'));
});
