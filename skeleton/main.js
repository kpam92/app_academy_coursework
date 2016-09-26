const Router = require('./router.js');
const Inbox = require('./inbox.js');

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
