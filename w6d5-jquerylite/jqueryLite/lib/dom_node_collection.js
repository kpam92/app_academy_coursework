class DOMNodeCollection {
  constructor(htmlElements) {
    this.htmlElements = htmlElements;
  }

  html(htmlString) {
    if (htmlString) {
      this.htmlElements.forEach( (el) => {
        el.innerHTML = htmlString;
      });
    } else {
      return this.htmlElements[0];
    }
  }

  empty() {
    this.htmlElements.forEach( (el) => {
      el.innerHTML = "";
    });
  }

  append(element) {
    this.htmlElements.forEach( (el) => {
      el.innerHTML = el.innerHTML.concat(element);
    });
  }

  attr(name, value) {
    let at = this.htmlElements[0].attributes;
    if (value) {
      let attribute = document.createAttribute(name);
      attribute.nodeValue = value;
      at.setNamedItem(attribute);
    }
    return at.getNamedItem(name);
  }

  addClass(klass) {
    if (this.htmlElements[0].className === "") {
      
    }
  }

  removeClass(klass) {}
}

module.exports = DOMNodeCollection;
