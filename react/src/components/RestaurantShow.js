import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class RestaurantShow extends Component {
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
      <h1>Restaurant SHOW</h1>
      </div>
    )
  }
}

export default RestaurantShow;
