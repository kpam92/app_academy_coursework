import React from "react";
import ReactDOM from "react-dom";
import Tabs from './tabs';
import WeatherClock from './weather_clock';
import Weather from "./weather";
import AutoComplete from "./autocomplete";
// const ReactCSSTransitionGroup = require('react-addons-css-transition-group');


document.addEventListener("DOMContentLoaded", () => {
	const root = document.querySelector("#root");
	ReactDOM.render(
		<div>
		<Tabs/>
		<WeatherClock/>
		<AutoComplete names="abra,kadabra,alakazam,flareon,jolteon,umbreon"/>
		</div>

, root);
});
