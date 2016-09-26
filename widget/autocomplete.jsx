import React from "react";
const ReactCSSTransitionGroup = require('react/lib/ReactCSSTransitionGroup');


class AutoComplete extends React.Component{
  constructor(props){
    super(props);
    this.state = {names: this.props.names.split(","),
                  result: this.props.names.split(",")};
  this.updateList = this.updateList.bind(this);
  }

  updateList(event){
    const currKey = event.currentTarget.value;
    const newResult = [];
    this.state.names.map( function(name) {
      if (currKey === name.slice(0,currKey.length)) {
        newResult.push(name);
      }
    });
    this.setState({result: newResult});
  }
  render(){

    return(
      <div>
      <input type="text" onChange={this.updateList}></input>
      <ul>

        <ReactCSSTransitionGroup transitionName="auto"
           transitionEnterTimeout={500}
           transitionLeaveTimeout={500}>
         {this.state.result.map((name, index) => {
             return <h5 key={index} id={index}>{name}</h5>;
           })}
        </ReactCSSTransitionGroup>
      </ul>
      </div>
    );
  }
}

export default AutoComplete;
