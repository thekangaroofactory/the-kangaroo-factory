
$(document).ready(function() {
  
  // Enregistrement du gestionnaire de message personnalisé
  Shiny.addCustomMessageHandler('type_bot_message', function(message) {
    
    const textElement = document.getElementById('bot-text');
    const cursorElement = document.querySelector('.cursor');
    
    // Réinitialisation du conteneur
    textElement.textContent = '';
    cursorElement.style.display = 'inline-block';
    
    let index = 0;
    const speed = 15; // Vitesse de frappe (ms)

    function type() {
      
      if (index < message.text.length) {
        textElement.textContent += message.text.charAt(index);
        index++;
        setTimeout(type, speed);
        
      } else {
        
        // Cache le curseur à la fin de la frappe
        cursorElement.style.display = 'none';
        
      }
      
    }
    
    // Lancement de l'effet de frappe
    type();
    
  });
});
