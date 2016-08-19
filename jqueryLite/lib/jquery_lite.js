/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const DOMNodeCollection = __webpack_require__(1);

	const $l = function(selector) {
	  if (selector instanceof HTMLElement) {
	    return new DOMNodeCollection([selector]);
	  }

	  const nodeList = document.querySelectorAll(selector);
	  return new DOMNodeCollection(Array.from(nodeList));
	};

	window.$l = $l;


/***/ },
/* 1 */
/***/ function(module, exports) {

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
	    klass = klass.split(' ').join("-");
	    let el = this.htmlElements[0];
	    if (el.className === "") {
	      el.className = klass;
	    } else {
	      el.className = [el.className, klass].join('-');
	    }

	  }

	  removeClass(klass) {
	    let el = this.htmlElements[0];
	    let elKlass = el.className.split('-');
	    let result = [];
	    elKlass.forEach(element => {
	      if (klass !== element) {
	        result.push(element);
	      }
	    });
	    el.className = result.join("-");
	  }

	  children() {
	    let node = this.htmlElements[0];
	    return node.children;
	  }
	}

	module.exports = DOMNodeCollection;


/***/ }
/******/ ]);