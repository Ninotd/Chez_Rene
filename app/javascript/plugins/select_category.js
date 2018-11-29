const selectCategory = () => {
  const buttons = document.querySelectorAll('.clickable');

  buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
      buttons.forEach((button) => {
        button.classList.remove("newstyle");
      });
      event.currentTarget.classList.add("newstyle");
      const select = document.querySelector('#gun_category');
      const category = event.currentTarget.dataset.category;
      select.value = category;
    });
  });
}

export default selectCategory;
