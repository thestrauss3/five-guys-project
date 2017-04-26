import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class Reviews extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: this.props.reviewRating,
      totalVotes: 0
    };
    this.onClickUpVote = this.onClickUpVote.bind(this);
    this.onClickDownVote = this.onClickDownVote.bind(this);
  }

  onClickUpVote(){
    let reviewId = this.props.id
    fetch(`/api/v1/upvotes/${reviewId}`, {credentials: 'same-origin'})
      .then(response => response.json())
      .then(totalVotes => {
        this.setState({
          totalVotes: totalVotes
        });
  })
    let upVote = this.state.count + 1
    this.setState({ count: upVote})
  }

  onClickDownVote(){
    let downVote = this.state.count - 1
    this.setState({ count: downVote})
  }


  render() {
    return (
      <div className="row">
        <div className="columns small-3">
          <h4>Review Score: {this.state.count}</h4>
          <button onClick={this.onClickUpVote} >▲</button><br/>
          <button onClick={this.onClickDownVote} >▼</button>
          <h3>Total Votes: {this.state.totalVotes}</h3>
        </div>
        <div className="columns small-9">
          <h2>{this.props.body}</h2>
          <p>Rating: {this.props.burgerRating} burger(s)</p>
          <br/><br/><br/>
        </div>
      </div>
    )
  }
}

export default Reviews;
