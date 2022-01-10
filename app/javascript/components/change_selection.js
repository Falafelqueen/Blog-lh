const articleShow = document.querySelector(".article-show");
const textContent = articleShow.querySelector(".article-content");

const styleSelection = () => {
  if (articleShow) {
    let selectedText = "";
    if (window.getSelection) {
      selectedText = window.getSelection();
      if (selectedText.toString() !== "") {
        console.log(
          selectedText.getRangeAt(0).commonAncestorContainer.cloneNode()
        );
      }
      console.log(selectedText);
    } else if (document.getSelection) {
      selectedText = document.getSelection();

      console.log(selectedText.toString());
    }
  }
};
const addStyleToSelection = () => {
  ["mouseup", "keyup", "touchend"].forEach((e) => {
    textContent.addEventListener(e, styleSelection);
  });
};

export { addStyleToSelection };
