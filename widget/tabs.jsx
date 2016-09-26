import React from "react";


class Tabs extends React.Component{
  constructor(){
    super();
    this.state = {tab_index: 0};
    this.tabs = ["one","two","three"];
    this.changeTab = this.changeTab.bind(this);
    this.panels = ["panel 1", "panel 2", "panel 3"];
  }


  changeTab(event) {
    this.setState({ tab_index: parseInt(event.target.id)});
  }

  render() {

    const { tab_index } = this.state;

    return (
      <div className="tabs">
      <h1>TABS</h1>
        <ul>
         {this.tabs.map((name, index) => {
             return <h2 key={index} id={index}
               onClick={this.changeTab}
               >{name}</h2>;
           })}
       </ul>
       <article>
         <h3>{this.panels[tab_index]}</h3>
       </article>
     </div>
    );}
}


export default Tabs;
