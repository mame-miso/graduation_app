console.log("application.js 読み込みOK");

document.addEventListener("click", (event) => {
  const clickedImage = event.target.closest(".js-image");
  const modal = document.getElementById("image-modal");
  const modalImg = document.getElementById("modal-image");

  if (clickedImage && modal && modalImg) {
    const img = clickedImage.tagName === "IMG"
      ? clickedImage
      : clickedImage.querySelector("img");

    if (img) {
      modalImg.src = img.src;
      modal.classList.add("is-open");
    }
  }

  if (
    event.target.classList.contains("modal-close") ||
    event.target.id === "image-modal"
  ) {
    if (modal) {
      modal.classList.remove("is-open");
    }
  }
});

document.addEventListener("DOMContentLoaded", () => {
  const toggle = document.getElementById("menu-toggle");
  const menu = document.getElementById("side-menu");

  if (!toggle || !menu) return;

  toggle.addEventListener("click", () => {
    menu.classList.toggle("open");
  });

  document.addEventListener("click", (e) => {
    if (!menu.contains(e.target) && !toggle.contains(e.target)) {
      menu.classList.remove("open");
    }
  });
});
