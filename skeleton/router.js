class Router {

  constructor(node) {
    this.node = node;
  }

  start(){
    this.render();
    let that = this;
    window.addEventListener('hashchange', function() {
      that.render();
    });
  }

  activeRoute(){
    return window.location.hash.slice(1);

  }

  render() {
    this.node.innerHTML = "";

    let pNode = document.createElement("p");
    pNode.innerHTML = this.activeRoute();
    this.node.appendChild(pNode);
  }
}


module.exports = Router;
