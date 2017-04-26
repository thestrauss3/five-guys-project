import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


class Reviews extends Component {
  constructor(props) {
    super(props);
    debugger;
    this.state = {
      count: this.props.reviewRating
    };
    this.onClickUpVote = this.onClickUpVote.bind(this);
    this.onClickDownVote = this.onClickDownVote.bind(this);
  }

  onClickUpVote(){
    let upVote = this.state.count + 1
  }

  onClickDownVote(){
    let downVote = this.state.count - 1
  }


  render() {
    return (
      <div>
        <h2>Hey World</h2>
        <button onClick={this.onClickUpVote} >▲</button>
        <button onClick={this.onClickDownVote} >▼</button>
      </div>
    )
  }
}

export default Reviews;
