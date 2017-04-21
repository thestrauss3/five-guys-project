import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class App extends Component {
  constructor(props) {
    super(props);

    this.state = {
      currentLine: "null",
      currentDirection: "null"
    }

  }

  render() {
    return (
      <div>
        <Router history={browserHistory}>
          <Route path='/'>
            <Route path='/burgers' component={Burgers}>
          </Route>
        </Router>
      </div>
    )
  }
}

export default App;
