const addResource = () => {
  const addButton = document.getElementById("addResource");

  addButton.addEventListener("click", () => {
    const lastId = document.querySelector(
      ".fieldset-container"
    ).lastElementChild;

    const newId = parseInt(lastId, 10) + 1;

    const newFieldset = document
      .querySelector('[id="0"]')
      .outerHTML.replace(/0/g, newId);

    document
      .querySelector(".fieldset-container")
      .insertAdjacentHTML("beforeend", newFieldset);
  });
};

export { addResource };
