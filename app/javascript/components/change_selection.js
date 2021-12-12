console.log(document);
const textContent = document.querySelector(".article-content");
console.log(textContent);
const addStyleToSelection = () => {
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
    selectedText = window.getSelection();

    console.log(selectedText.toString());
  }

  ["mouseup", "keyup", "touchend"].forEach((e) => {
    textContent.addEventListener(e, addStyleToSelection);
  });
};

export { addStyleToSelection };
