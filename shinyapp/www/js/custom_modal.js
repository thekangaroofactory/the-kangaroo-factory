
// open button << replace this by toggle from server side after insert UI
$(document).on('click', '#open_modal', function() {
  $('#modal-overlay').addClass('active');
});

// close button
$(document).on('click', '#close_modal', function() {
  $('#modal-overlay').removeClass('active');
  
  const element = document.getElementById("custom-modal-placeholder");
  while (element.firstChild) {
    element.removeChild(element.firstChild);
  }
  
});

// close on click on overlay area
$(document).on('click', '#modal-overlay', function(e) {
  if (e.target === this) {
$('#modal-overlay').removeClass('active');
  }
});
