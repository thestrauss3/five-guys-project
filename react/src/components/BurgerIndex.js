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
          burgersFirstHalf: body.burgersFirstHalf,
          burgersSecondHalf: body.burgersSecondHalf
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {

      let burgersFirstHalf;
      if (this.state.burgersFirstHalf) {
        burgersFirstHalf = this.state.burgersFirstHalf.map(burger => {
          return(
            <div>
              <p className="burgerlist"><a href={`/burgers/` + burger.id}>{burger.name}</a></p>
            </div>
          )
        })
      }

      let burgersSecondHalf;
      if (this.state.burgersSecondHalf) {
        burgersSecondHalf = this.state.burgersSecondHalf.map(burger => {
          return(
            <div>
              <p className="burgerlist"><a href={`/burgers/` + burger.id}>{burger.name}</a></p>
            </div>
          )
        })
      }

      return (
        <div className="text-center burger-react" id="main">
         <h1>All Burgers:</h1>
         <div className="rows text-center">
            <div className="small-6 columns">
              {burgersFirstHalf}
            </div>
            <div className="small-6 columns">
              {burgersSecondHalf}
            </div>
          </div>
        </div>
      )
    }
  }

  export default BurgerIndex;
