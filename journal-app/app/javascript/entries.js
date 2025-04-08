document.addEventListener('DOMContentLoaded', () => {
    function updateEntries(headingText, filter) {
      // Update the hidden heading
      const heading = document.getElementById('dynamic-heading');
      heading.textContent = headingText;

      // Toggle active button
      const buttons = document.querySelectorAll('.top-box button');
      buttons.forEach(btn => btn.classList.remove('active'));
      const activeButton = Array.from(buttons).find(btn => btn.textContent.trim() === headingText.trim());
      if (activeButton) activeButton.classList.add('active');

      // Expose globally for inline onclick handlers
      window.updateEntries = updateEntries;
    }
  });
