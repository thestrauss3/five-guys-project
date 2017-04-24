import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import BurgerIndex from '../components/BurgerIndex';

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
          <Route path='/burgers' component={BurgerIndex} />
        </Route>
      </Router>

      </div>
    )
  }
}

export default App;
