function doInvisible() {
  const cards = document.querySelectorAll(".card-content");
  for (let i = 10; i < cards.length; i++) {
    cards[i].classList.add("invisible");
  };
}

function moreRoom() {
  const more = document.getElementById("more");
  more.addEventListener("click", () => {
    const invisibleCards = document.querySelectorAll(".invisible");
    for (let i = 0; i < 10; i++) {
      if (invisibleCards[i]) {
        invisibleCards[i].classList.remove("invisible");
      } else {
        break
      };
    };
    if (invisibleCards.length - 10 <= 0) {
      more.classList.add("invisible")
    };
  });
}

window.addEventListener("load", doInvisible)
window.addEventListener("load", moreRoom)