import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class BurgerIndex extends Component {
  constructor(props) {
    super(props);
    this.state = { burger: '' };

    this.getBurgerData = this.getBurgerData.bind(this);
  }

  componentDidMount() {
    this.getBurgerData();
  }

  getBurgerData() {
    fetch(`/api/v1/burgers`)
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
        this.setState({
          burgers: body
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let burgers;

    if (this.state.burgers) {
      burgers = this.state.burgers.map(burger => {
        return(
          <h4>
            <li>{burger.name}</li>
          </h4>
        )
      })
    }
    return (
      <div>
       <h1>look et teh burgrz:</h1>
       {burgers}
      </div>
    )
  }
}

export default BurgerIndex;
