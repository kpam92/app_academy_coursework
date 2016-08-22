import React from "react";


class AutoComplete extends React.Component{
  constructor(props){
    super(props);
    this.state = {names: this.props.names.split(","),
                  result: this.props.names.split(",")};
  }

  updateList(event){
    const currKey = event.currentTarget.value
    result
  }
  render(){

    return(
      <div>
      <input type="text" onChange={this.updateList}></input>
      <ul>
         {this.state.names.map((name, index) => {
             return <h5 key={index} id={index}>{name}</h5>;
           })}
      </ul>
      </div>
    );
  }
}

export default AutoComplete;
