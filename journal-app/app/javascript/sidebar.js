document.addEventListener("turbo:load", () => {
  // Sidebar toggle functionality
  const sidebar = document.getElementById("sidebar");
  const content = document.getElementById("content");
  const toggleBtn = document.getElementById("toggleSidebar");

  if (toggleBtn && sidebar && content) {
    toggleBtn.addEventListener("click", (e) => {
      e.preventDefault(); // Prevent navigation (if using link_to)

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
    // Show Recent Entries when the "Recent Entries" button is clicked
    recentEntriesBtn.addEventListener("click", () => {
      recentEntriesContent.classList.remove("hidden");
      allEntriesContent.classList.add("hidden");
      recentEntriesBtn.classList.add("active");
      allEntriesBtn.classList.remove("active");
    });

    // Show All Entries when the "All Entries" button is clicked
    allEntriesBtn.addEventListener("click", () => {
      allEntriesContent.classList.remove("hidden");
      recentEntriesContent.classList.add("hidden");
      allEntriesBtn.classList.add("active");
      recentEntriesBtn.classList.remove("active");
    });
  }
});
