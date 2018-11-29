const soundLink = document.getElementById('sound').innerText
const music = new Audio(soundLink);
document.addEventListener("click", (event) => {
  music.play();
});
