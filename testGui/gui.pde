/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void button1_click1(GButton source, GEvent event) { //_CODE_:newLayerButton:744727:
  println("newLayerButton - GButton >> GEvent." + event + " @ " + millis());
  makeNewLayer();
} //_CODE_:newLayerButton:744727:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  newLayerButton = new GButton(this, 1041, 295, 100, 50);
  newLayerButton.setText("New Layer");
  newLayerButton.addEventHandler(this, "button1_click1");
}

// Variable declarations 
// autogenerated do not edit
GButton newLayerButton; 