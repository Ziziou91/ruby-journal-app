document.addEventListener('turbo:load', () => {
    const sidebar = document.getElementById('sidebar');
    const content = document.getElementById('content');
    const toggleBtn = document.getElementById('toggleSidebar');

    if (toggleBtn && sidebar && content) {
        toggleBtn.addEventListener('click', (e) => {
            e.preventDefault();  // Prevent navigation (if using link_to)

            sidebar.classList.toggle('visible');
            sidebar.classList.remove('hidden'); // ensures it's visible after first toggle
            content.classList.toggle('shifted');
        });
    }
});
