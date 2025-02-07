

// -- button with class gtag
$(document).on('click', 'button.gtag', function(event) {
  
  console.log(event.currentTarget.id);
  
  /*gtag('event', 'button', { action: 'update plot' });*/
  
});


// -- a elements (they need to have a "data-value" attribute set)
$(document).on('click', 'a', function(event) {
  
  console.log($(event.currentTarget).data().value);
  
  /*gtag('event', 'button', { action: 'update plot' });*/
  
});


// -- accordion (button with class button.accordion-button)
$(document).on('click', 'button.accordion-button', function(event) {
  
  // -- check if they have been collapsed
  if(!$(event.currentTarget).hasClass("collapsed")){
    
    console.log($(event.currentTarget).closest("div.accordion-item").data().value)
  
  }
  
  /*gtag('event', 'button', { action: 'update plot' });*/
  
});


// -- check for changes on select items
$(document).on('change', 'select', function(event) {
  
  console.log($(event.currentTarget).val());
  
  /*gtag('event', 'button', { action: 'update plot' });*/
  
});

