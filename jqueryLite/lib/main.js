const DOMNodeCollection = require("./dom_node_collection.js");

const $l = function(selector) {
  if (selector instanceof HTMLElement) {
    return new DOMNodeCollection([selector]);
  }

  const nodeList = document.querySelectorAll(selector);
  return new DOMNodeCollection(Array.from(nodeList));
};

window.$l = $l;
