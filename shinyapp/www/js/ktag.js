
// -- button with class ktag
$(document).on('click', '.ktag', function(event) {
  
  console.log(event.currentTarget.id);
  Shiny.setInputValue('ktag_event', {when: Date.now(), what: event.currentTarget.id});
  
});
