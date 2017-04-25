import React, { Component } from 'react';
import { Router, Route, Link, browserHistory, IndexRoute } from 'react-router';


const BurgerShow = props => {
  return(
    <div>
      <h1>Burger Name: {props.name}</h1>
      <h3>Price: {props.price}</h3>
      <h4>Description: {props.description}</h4>
      <img src={props.image_url} id="burger_image"/>
    </div>
  )
}

export default BurgerShow;
