$(function () {
  "use strict";

  /* HTML: <div class="loader"></div> */
  var loader = $(".loader");

  /* Mostrar el preloader mientras se carga la página */
  loader.show();

  /* Esperar a que la página se cargue completamente */
  $(window).on("load", function () {
    setTimeout(function () {
      loader.fadeOut();
    }, 1500);
  });
});
