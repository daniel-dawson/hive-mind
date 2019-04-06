let mainNavs = document.querySelectorAll(".js-menu");
let navBarToggle = document.querySelector("#js-navbar-toggle");

navBarToggle.addEventListener("click", function() {
  mainNavs.forEach(nav => {
    nav.classList.toggle("active");
  });
});
