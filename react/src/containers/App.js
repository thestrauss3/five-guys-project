import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import BurgersContainer from '../containers/BurgersContainer';
import BurgerContainer from '../containers/BurgerContainer';

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }

  render() {
    return (
      <div>
      <h1>show</h1>
      <Router history={browserHistory}>
        <Route path='/'>
          <Route path='/burgers' component={BurgersContainer} />
          <Route path="/burgers/:id" component={BurgerContainer} />
        </Route>
      </Router>

      </div>
    )
  }
}

export default App;
