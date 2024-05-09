document.addEventListener("turbo:load", () => {
  const toggleThemeButton = document.getElementById("toggle-theme");
  // Verificar si el modo oscuro está habilitado en `localStorage`
  const darkModeEnabled = localStorage.getItem("darkMode") === "true";
  const htmlElement = document.documentElement;

  if (darkModeEnabled) {
    htmlElement.classList.add("dark");
  } else {
    htmlElement.classList.remove("dark");
  }

  if (toggleThemeButton) {
    toggleThemeButton.addEventListener("click", () => {
      htmlElement.classList.toggle("dark");

      // Actualizar el estado de modo oscuro en `localStorage`
      const isDarkMode = htmlElement.classList.contains("dark");
      localStorage.setItem("darkMode", isDarkMode.toString());

      const lightModeIcon = toggleThemeButton.querySelector(".light-mode");
      const darkModeIcon = toggleThemeButton.querySelector(".dark-mode");

      if (isDarkMode) {
        lightModeIcon.style.display = "none";
        darkModeIcon.style.display = "inline";
      } else {
        lightModeIcon.style.display = "inline";
        darkModeIcon.style.display = "none";
      }
    });
  }
});
