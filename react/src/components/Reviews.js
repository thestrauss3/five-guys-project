import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class Reviews extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: this.props.reviewRating,
      totalVotes: this.props.reviewRating
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
    let reviewId = this.props.id
    fetch(`/api/v1/downvotes/${reviewId}`, {credentials: 'same-origin'})
      .then(response => response.json())
      .then(totalVotes => {
        this.setState({
          totalVotes: totalVotes
        });
      })
    let downVote = this.state.count - 1
    this.setState({ count: downVote})
  }


  render() {
    return (
      <div className="row">
        <div className="columns small-3">
        <center><h5>Review Score: {this.state.totalVotes}</h5>
          <button className="upvote" onClick={this.onClickUpVote} >▲</button><br/>
          <button className="downvote" onClick={this.onClickDownVote} >▼</button></center>
        </div>
        <div className="rating columns small-9">
          <h2>{this.props.body}</h2>
          <p>Rating: {this.props.burgerRating}/5</p>
          <hr/>
        </div>
      </div>
    )
  }
}

export default Reviews;
