

/* -----------------------------------------------------------------------------

This is the definition file for the Google Analytics tags

Rules on elements:
- button with class gtag
- button with class button.accordion-button (for accordion)
- a elements with "data-value" attribute set

Rules on behaviors:
- change on select items (was implemented for selectizeInput)

----------------------------------------------------------------------------- */


// -- button with class gtag
$(document).on('click', 'button.gtag', function(event) {
  
  console.log(event.currentTarget.id);
  var target = event.currentTarget.id;
  
  gtag('event', 'button', { click: target });
  
});


// -- a elements (they need to have a "data-value" attribute set)
$(document).on('click', 'a', function(event) {
  
  console.log($(event.currentTarget).data().value);
  var target = $(event.currentTarget).data().value;
  
  gtag('event', 'link', { click: target });
  
});


// -- accordion (button with class button.accordion-button)
$(document).on('click', 'button.accordion-button', function(event) {
  
  // -- check if they have been collapsed
  if(!$(event.currentTarget).hasClass("collapsed")){
    
    console.log($(event.currentTarget).closest("div.accordion-item").data().value)
    var target = $(event.currentTarget).closest("div.accordion-item").data().value
    
    gtag('event', 'accordion', { active: target });
  
  }
  
});


// -- check for changes on select items
$(document).on('change', 'select', function(event) {
  
  console.log($(event.currentTarget).val());
  var target = $(event.currentTarget).val();
  
  gtag('event', 'select', { action: target });
  
});

