
$(document).ready(function() {
  
  // register custom handler
  Shiny.addCustomMessageHandler('type_bot_message', function(message) {
    
    const textElement = document.getElementById('bot-text');
    const cursorElement = document.querySelector('.cursor');
    
    // re-init content
    textElement.textContent = '';
    cursorElement.style.display = 'inline-block';
    
    let index = 0;
    const speed = 15; // delay (ms)

    function type() {
      
      if (index < message.text.length) {
        textElement.textContent += message.text.charAt(index);
        index++;
        setTimeout(type, speed);
        
      } else {
        
        // hide cursor after typing
        cursorElement.style.display = 'none';
        
      }
      
    }
    
    // start typing
    type();
    
  });
});
