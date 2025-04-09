// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import "entries"
import "navbar"
import "sidebar"
import "sidebar_calendar"


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
  };
