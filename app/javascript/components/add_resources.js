const addResource = () => {

  const removeBtn = document.getElementById("removeResource")
  const addButton = document.getElementById("addResource");

  addButton.addEventListener("click", () => {
    const lastId = document.querySelector(
      ".fieldset-container"
    ).lastElementChild.id;

    const newId = parseInt(lastId, 10) + 1;

    const newFieldset = document
      .querySelector('[id="0"]')
      .outerHTML.replace(/0/g, newId);

    document
      .querySelector(".fieldset-container")
      .insertAdjacentHTML("beforeend", newFieldset);
  });

  removeBtn.addEventListener("click", () =>  {
    const lastId = document.querySelector(
      ".fieldset-container"
    ).lastElementChild.id;
    console.log(lastId);
    const fieldsetToRemove = document.querySelector(`[id="${lastId}"]`)
      console.log(fieldsetToRemove);
      if(lastId != 0){
        fieldsetToRemove.remove()
      }
  })

};

export { addResource };
