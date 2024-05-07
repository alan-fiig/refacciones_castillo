// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("DOMContentLoaded", () => {
  const toggleThemeButton = document.getElementById("toggle-theme");

  toggleThemeButton.addEventListener("click", () => {
    const htmlElement = document.documentElement;

    htmlElement.classList.toggle("dark");

    const lightModeIcon = toggleThemeButton.querySelector(".light-mode");
    const darkModeIcon = toggleThemeButton.querySelector(".dark-mode");

    if (htmlElement.classList.contains("dark")) {
      lightModeIcon.style.display = "none";
      darkModeIcon.style.display = "inline";
    } else {
      lightModeIcon.style.display = "inline";
      darkModeIcon.style.display = "none";
    }
  });
});
