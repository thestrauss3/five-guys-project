import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class Burgers extends Component {
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
      </div>
    )
  }
}

export default Burgers;
