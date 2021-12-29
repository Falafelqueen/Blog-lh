const inputs = document.querySelectorAll(".controls input");
const propertyValues = JSON.parse(localStorage.getItem("something")) || [];

const changeFontSize = () => {
  inputs.forEach((input) => {
    ["mousemove", "change", "touchend"].forEach((e) => {
      input.addEventListener(e, () => {
        const suffix = input.dataset.sizing || "";
        const propertyValue = {
          property: `--${input.name}`,
          value: input.value + suffix,
        };
        const existing = propertyValues.find(
          (el) => el.property === `--${input.name}`
        );

        const fontsize = propertyValue.property === `--title-font-size`;

        if (existing && fontsize) {
          existing.value = propertyValue.value;
          localStorage.setItem(
            "fontsizeValue",
            JSON.stringify(propertyValue.value)
          );
        } else if (existing) {
          existing.value = propertyValue.value;
          localStorage.setItem(
            "fontColorValue",
            JSON.stringify(propertyValue.value)
          );
        } else {
          propertyValues.push(propertyValue);
        }

        document.documentElement.style.setProperty(
          propertyValue.property,
          propertyValue.value
        );

        localStorage.setItem("something", JSON.stringify(propertyValues));
      });
    });
  });
};

const keepChangedStylingProperties = () => {
  inputs.forEach((input) => {
    const propertyObj = propertyValues.find(
      (el) => el.property === `--${input.name}`
    );
    document.documentElement.style.setProperty(
      propertyObj.property,
      propertyObj.value
    );
    if (input.name === "title-font-size") {
      input.value =
        JSON.parse(localStorage.getItem("fontsizeValue")) || input.value;
    } else {
      input.value =
        JSON.parse(localStorage.getItem("fontColorValue")) || input.value;
    }
  });
};
export { changeFontSize, keepChangedStylingProperties };
