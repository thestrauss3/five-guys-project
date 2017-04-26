import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import App from './containers/App';
import BurgerIndex from './components/BurgerIndex';
import Votes from './containers/Votes';

// $(function() {
//   ReactDOM.render(
//     <App />,
//     document.getElementById('app')
//   );
// });

$(function() {
  ReactDOM.render(
    <Votes />,
    document.getElementById('votes')
  );
});
