document.addEventListener("turbo:load", () => {
  // Sidebar toggle functionality
  const sidebar = document.getElementById("sidebar");
  const content = document.getElementById("content");
  const toggleBtn = document.getElementById("toggleSidebar");

  if (toggleBtn && sidebar && content) {
    toggleBtn.addEventListener("click", (e) => {
      e.preventDefault(); // Prevent navigation (if using link_to)
      console.log("Toggle button clicked"); // Debugging statement

      sidebar.classList.toggle("visible");
      sidebar.classList.remove("hidden"); // Ensure it's visible after the first toggle
      content.classList.toggle("shifted");
    });
  }

  // Sidebar content toggle functionality
  const recentEntriesBtn = document.getElementById("recent-entries-btn");
  const allEntriesBtn = document.getElementById("all-entries-btn");
  const recentEntriesContent = document.getElementById("recent-entries");
  const allEntriesContent = document.getElementById("all-entries");

  if (recentEntriesBtn && allEntriesBtn && recentEntriesContent && allEntriesContent) {
    recentEntriesBtn.addEventListener("click", () => {
      // Toggle active class on buttons
      recentEntriesBtn.classList.add("active");
      allEntriesBtn.classList.remove("active");

      // Toggle content visibility
      recentEntriesContent.classList.remove("hidden");
      allEntriesContent.classList.add("hidden");

      // Toggle icon visibility
      recentEntriesBtn.querySelector(".active-icon").classList.remove("hidden");
      recentEntriesBtn.querySelector(".inactive-icon").classList.add("hidden");
      allEntriesBtn.querySelector(".active-icon").classList.add("hidden");
      allEntriesBtn.querySelector(".inactive-icon").classList.remove("hidden");
    });

    allEntriesBtn.addEventListener("click", () => {
      // Toggle active class on buttons
      allEntriesBtn.classList.add("active");
      recentEntriesBtn.classList.remove("active");

      // Toggle content visibility
      allEntriesContent.classList.remove("hidden");
      recentEntriesContent.classList.add("hidden");

      // Toggle icon visibility
      allEntriesBtn.querySelector(".active-icon").classList.remove("hidden");
      allEntriesBtn.querySelector(".inactive-icon").classList.add("hidden");
      recentEntriesBtn.querySelector(".active-icon").classList.add("hidden");
      recentEntriesBtn.querySelector(".inactive-icon").classList.remove("hidden");
    });
  }
});
