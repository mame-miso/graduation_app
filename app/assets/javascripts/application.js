console.log("application.js 読み込みOK");

document.addEventListener("click", (event) => {
  const clickedImage = event.target.closest(".js-image");

  if (clickedImage) {
    const modal = document.getElementById("image-modal");
    const modalImg = document.getElementById("modal-image");

    if (!modal || !modalImg) return;

    modal.style.display = "block";
    modalImg.src = clickedImage.src;
  }

  if (
    event.target.classList.contains("modal-close") ||
    event.target.id === "image-modal"
  ) {
    const modal = document.getElementById("image-modal");
    if (modal) {
      modal.style.display = "none";
    }
  }
});