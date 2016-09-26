import React from "react";
import Weather from "./weather";

class WeatherClock extends React.Component{

  constructor(props){
    super(props);
    this.state = {hours: (new Date().getHours() > 12 ? (new Date().getHours() - 12) : new Date().getHours()),
                  minutes: new Date().getMinutes(),
                  seconds: new Date().getSeconds() };
    this.timeChange = this.timeChange.bind(this);
    // this.componentDidMount = this.componentDidMount.bind(this);
  }

  timeChange(){
    const hours = (new Date().getHours() > 12 ? (new Date().getHours() - 12) : new Date().getHours())
    this.setState({hours: hours,
                  minutes: new Date().getMinutes(),
                  seconds: new Date().getSeconds()});
  }

  componentDidMount(){

    setInterval(this.timeChange, 1000);
  }

  render() {
    return (
      <div className="weatherclock">
      <h1>CLOCK</h1>
      <h2>{this.state.hours}:{this.state.minutes}:{this.state.seconds}</h2>
      <h1>WEATHER</h1>
      <Weather/>
      </div>
    );
  }
}


export default WeatherClock;
