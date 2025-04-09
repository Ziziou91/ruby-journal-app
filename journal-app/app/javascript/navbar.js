function submitForm(formId) {
  const form = document.getElementById(formId);
  if (form) {
    // Check if any input fields in the form are empty
    const inputs = form.querySelectorAll("input");
    let isValid = true;

    inputs.forEach((input) => {
      if (input.value.trim() === "") {
        console.error(`Input field "${input.name}" is empty.`);
        isValid = false;
      }
    });

    if (isValid) {
      console.log(`Submitting form with ID: ${formId}`);
      form.requestSubmit();
    } else {
      console.error(`Form with ID ${formId} contains empty fields. Submission prevented.`);
    }
  } else {
    console.error(`Form with ID ${formId} not found.`);
  }
}

document.addEventListener("turbo:load", () => {
  const entryName = document.getElementById("entry-name");
  const editForm = document.getElementById("edit-entry-form");
  const autoSaveInput = document.querySelector(".auto-save-input");
  const autoSaveForm = document.querySelector(".auto-save-form");
  const entryNameInput = document.getElementById("entry-name-input");


  if (autoSaveInput && autoSaveForm) {
    console.log("triggered autoSaveInput");
    // Show the form and focus the input when the entry name is clicked
    entryName.addEventListener("click", () => {
      entryName.classList.add("hidden");
      editForm.classList.remove("hidden");
      autoSaveInput.focus();
    });

    // Submit the form when the input loses focus
    autoSaveInput.addEventListener("blur", () => {
      autoSaveForm.requestSubmit();
    });
  }

  const dropdownToggle = document.getElementById("dropdown-toggle");
  const dropdownMenu = document.getElementById("dropdown-menu");

  if (dropdownToggle && dropdownMenu) {
    dropdownToggle.addEventListener("click", (e) => {
      e.preventDefault();
      dropdownMenu.classList.toggle("hidden");
      console.log("Dropdown menu visibility toggled:", !dropdownMenu.classList.contains("hidden"));
    });

    // Close the dropdown if the user clicks outside of it
    document.addEventListener("click", (e) => {
      if (!dropdownToggle.contains(e.target) && !dropdownMenu.contains(e.target)) {
        dropdownMenu.classList.add("hidden");
      }
    });
  }
});
