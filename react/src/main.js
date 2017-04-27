import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './containers/App';
import Votes from './containers/Votes';

$(function() {
  let appElement = document.getElementById('app')
  if (appElement) {
    ReactDOM.render(
    <App />,
    appElement
  )}
})

$(function() {
  let voteElement = document.getElementById('votes')
  if (voteElement) {
    ReactDOM.render(
    <Votes />,
    voteElement
  )}
})
