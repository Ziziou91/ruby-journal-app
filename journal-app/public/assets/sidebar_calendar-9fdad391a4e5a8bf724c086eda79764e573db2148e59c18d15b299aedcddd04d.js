document.addEventListener("turbo:load", () => {
    console.log("Simple calendar.js loaded");


    const calendarContainers = document.querySelectorAll(".sidebar-calendar-container, #infinite-calendar");

    if (calendarContainers.length === 0) {
      console.error("No calendar containers found on page");
      return;
    }

    console.log(`Found ${calendarContainers.length} calendar container(s)`);

    calendarContainers.forEach(container => {
      let currentMonth = new Date(container.dataset.currentMonth || new Date());

      const formatDate = (date) => {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, "0");
        const day = String(date.getDate()).padStart(2, "0");
        return `${year}-${month}-${'01'}`; // Format as YYYY-MM-DD
      };

      const loadCalendarMonth = async (newDate) => {
        const formattedDate = formatDate(newDate);
        console.log(`Loading calendar for: ${formattedDate}`);

        try {
          const response = await fetch(`/calendar?month=${formattedDate}`, {
            headers: {
              "Accept": "text/html",
              "X-Requested-With": "XMLHttpRequest"
            }
          });

          if (!response.ok) {
            throw new Error(`Failed to load calendar for ${formattedDate}`);
          }

          const html = await response.text();
          const tempDiv = document.createElement("div");
          tempDiv.innerHTML = html;

          const newCalendar = tempDiv.querySelector(".simple-calendar");
          if (newCalendar) {
            const existingCalendar = container.querySelector(".simple-calendar");
            if (existingCalendar) {
              container.replaceChild(newCalendar, existingCalendar);
            } else {
              container.innerHTML = "";
              container.appendChild(newCalendar);
            }

            container.dataset.currentMonth = formattedDate;
            currentMonth = newDate;
            console.log(`Calendar updated to: ${formattedDate}`);
          } else {
            console.error("Could not find .simple-calendar in the response");
          }
        } catch (error) {
          console.error("Error loading calendar:", error);
        }
      };

      // Event listeners for infinite scroll
      let isLoading = false;

      container.addEventListener("scroll", () => {
        if (isLoading) return;

        const scrollTop = container.scrollTop;
        const scrollHeight = container.scrollHeight;
        const clientHeight = container.clientHeight;

        if (scrollTop < 50) {
          console.log("Near top, loading previous month");
          isLoading = true;
          const newDate = new Date(currentMonth);
          newDate.setMonth(newDate.getMonth() - 1);
          loadCalendarMonth(newDate).finally(() => {
            isLoading = false;
          });
        }

        if (scrollHeight - scrollTop - clientHeight < 50) {
          console.log("Near bottom, loading next month");
          isLoading = true;
          const newDate = new Date(currentMonth);
          newDate.setMonth(newDate.getMonth() + 1);
          loadCalendarMonth(newDate).finally(() => {
            isLoading = false;
          });
        }
      });
    });
  });
