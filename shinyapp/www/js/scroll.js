
$(document).ready(function() {
  
  // register custom handler
  Shiny.addCustomMessageHandler('scroll_to_tag', function(message) {

    // extract variables
    const id = message.id;
    const delay = message.delay;
  
    // run with delay
    setTimeout(function() {
      var el = document.getElementById(id);
      if (el) {
        el.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    }, delay);

  })

})
