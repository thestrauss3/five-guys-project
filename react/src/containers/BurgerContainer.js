import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import BurgerShow from './../components/BurgerShow'

class BurgerContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      burger: null
    };

    this.getBurgerData = this.getBurgerData.bind(this);
  }

  componentDidMount() {

    this.getBurgerData();
  }

  getBurgerData() {
    let path = window.location.pathname
    fetch(`/api/v1/${path}`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
              error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response =>  response.json())
      .then(body => {
        this.setState({
          burger: body
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    if (this.state.burger) {
      return (
        <div>
          <BurgerShow
            name = {this.state.burger.name}
            price = {this.state.burger.price}
            description = {this.state.burger.description}
            image = {this.state.burger.image_url}
          />
        </div>
      )
    } else {
      return (
        <h1>Loading....</h1>
      )
    }
  }
}

export default BurgerContainer;
