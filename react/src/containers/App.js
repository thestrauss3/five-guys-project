import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import BurgerIndex from '../components/BurgerIndex';
import BurgerShow from '../components/BurgerShow';
import ReviewIndex from '../components/ReviewIndex';
import RestaurantIndex from '../components/RestaurantIndex';
import RestaurantShow from '../components/RestaurantShow';
import BurgerNew from '../components/BurgerNew';


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
      <h1>show</h1>
      <Router history={browserHistory}>
        <Route path='/'>
          <Route path='/burgers' component={BurgerIndex} />
          <Route path="/burgers/:id" component={BurgerShow} />
          <Route path="/reviews" component={ReviewIndex} />
          <Route path='/restaurants' component={RestaurantIndex} />
          <Route path='/restaurants/:id' component={RestaurantShow} />
          <Route path='burgers/new' component={BurgerNew} />
        </Route>
      </Router>

      </div>
    )
  }
}

export default App;
