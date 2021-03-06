// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("bootstrap");
require("jquery");

require("trix")
require("@rails/actiontext")

import "bootstrap";
// import { addStyleToSelection } from "../components/change_selection";
// import { changeFontSize } from "../components/change";
// import { keepChangedStylingProperties } from "../components/change";
import { addResource } from "../components/add_resources";
import { animateSearch } from "../components/animate_searchbar";

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// import { changeToHTML } from "../components/change";
document.addEventListener("turbolinks:load", () => {
  if (document.querySelector(".fieldset-container")) {
    addResource();
  }

    animateSearch();


  // changeToHTML();
});
