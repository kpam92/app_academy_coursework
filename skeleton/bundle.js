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

	const Router = __webpack_require__(1);
	const Inbox = __webpack_require__(2);

	document.addEventListener('DOMContentLoaded', function() {

	  let nav = document.querySelector('ul.sidebar-nav');
	  nav.addEventListener('click', function(event) {

	    if (event.target.parentNode.nodeName === "LI") {

	      const text = event.target.innerHTML.toLowerCase();

	      window.location.hash = text;
	    }


	  })

	  let content = document.querySelector(".content");
	  let router = new Router(content);
	  router.start();

	});


/***/ },
/* 1 */
/***/ function(module, exports) {

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


/***/ },
/* 2 */
/***/ function(module, exports) {

	class Inbox {
	  render() {

	  }
	}

	module.exports = Inbox;


/***/ }
/******/ ]);