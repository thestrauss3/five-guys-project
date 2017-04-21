import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class BurgerIndex extends Component {
  constructor(props) {
    super(props);
    this.state = { fortune: '' };
  }

  componentDidMount() {
    fetch('/api/fortune.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ fortune: body.fortune });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    return (
      <div>
       <h1>Your Fortune: {this.state.fortune}</h1>
      </div>
    )
  }
}

export default BurgerIndex;
