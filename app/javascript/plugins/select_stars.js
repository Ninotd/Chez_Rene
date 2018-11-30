const selectStars = () => {
  const stars = document.querySelectorAll('.js-star');

  stars.forEach((star) => {
    star.addEventListener('click', (event) => {
      colorStar(event.currentTarget, stars);
      const ratingInput = document.querySelector('#booking_review_rating');
      ratingInput.value = star.dataset.value;
    });
  });
}

const colorStar = (currentStar, stars) => {
  //trouver star où l'on est

  stars.forEach((star) => {
    if (star.dataset.value <= currentStar.dataset.value) {
      star.classList.remove("far");
      star.classList.add("fas");
    } else {
      star.classList.remove("fas");
      star.classList.add("far");
    }
  });
}

export { selectStars };
