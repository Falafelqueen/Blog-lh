const changeToHTML = () => {
  const articleCont = document.querySelectorAll(".article-content");
  articleCont.forEach((article) => {
    const articleString = article.innerText;
    console.log(articleString);
    article.insertAdjacentHTML(
      "afterend",
      `<div class="article-text"${articleString}</div>`
    );
  });
};

export { changeToHTML };
