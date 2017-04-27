import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';
import Reviews from '../components/Reviews';

class Votes extends Component {
  constructor(props) {
    super(props);
    this.state = {
      reviews:[],
      votes: '',
      totalVotes: []
    };

    this.getVoteData = this.getVoteData.bind(this);
  }

  componentDidMount() {
    this.getVoteData();
  }

  getVoteData() {
    let pathUrl = window.location.pathname
    let splitPathUrl = pathUrl.split("/")
    let burgerId = splitPathUrl[2]
    fetch(`/api/v1/uservotes/${burgerId}`)
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
      .then(reviews => {
        this.setState({
          reviews: reviews
        });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {
    let review = this.state.reviews.map(review => {
      return(
        <Reviews
        id={review.id}
        key={review.id}
        burger={review.burger_id}
        burgerRating={review.burger_rating}
        body={review.body}
        reviewRating={review.review_rating}
        />
      )
    })
    return (
      <div>
        {review}
      </div>
    )
  }
}

export default Votes;
