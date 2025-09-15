
/* -----------------------------------------------------------------------------

This file supports customer message handler to communicate css variable
update from Shiny

----------------------------------------------------------------------------- */

Shiny.addCustomMessageHandler("set_printable", set_printable);

function set_printable(colors) {
  
  console.log("Set printable colors")
  
  document.documentElement.style.setProperty('--tkf-color-light', colors.dark);
  document.documentElement.style.setProperty('--tkf-color-accent', colors.light);
  document.documentElement.style.setProperty('--tkf-color-accent', colors.light);
  document.documentElement.style.setProperty('--tkf-color-dark', colors.dark);
  document.documentElement.style.setProperty('--tkf-color-icon', colors.dark);

}
