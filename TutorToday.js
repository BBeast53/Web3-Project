document.addEventListener('DOMContentLoaded', function () {
  const tutorCheckbox = document.getElementById('tutor');
  const studentCheckbox = document.getElementById('student');

  // Get all direct children of the container
  const allFormRows = Array.from(document.querySelectorAll('.container > div'));

  // Find the index of the row with both tutor and student checkboxes
  const checkboxRowIndex = allFormRows.findIndex((row) =>
    row.innerHTML.includes('id="tutor"') && row.innerHTML.includes('id="student"')
  );

  // Slice only the rows after the checkbox row, except the final submit row
  const tutorOnlyRows = allFormRows.slice(checkboxRowIndex + 1, allFormRows.length - 1);

  function toggleTutorFields() {
    const showFields = tutorCheckbox.checked;

    tutorOnlyRows.forEach((row) => {
      row.style.display = showFields ? 'grid' : 'none';
    });
  }

  // Initial setup
  toggleTutorFields();

  // Listen for changes
  tutorCheckbox.addEventListener('change', toggleTutorFields);
  studentCheckbox.addEventListener('change', toggleTutorFields);
});
