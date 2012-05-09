/**
MouseBlocker
Permits infinte scroll and memorizes absolute coordinates.
Works best with the trackpad.
*/

import java.awt.AWTException; 
import java.awt.Robot; 
import java.awt.MouseInfo;
import java.awt.Point;

public class MouseBlocker {  
  Robot robot;
  boolean blocked = true;
  private PVector absolute, pabsolute;  
  private PVector relative; 

  MouseBlocker(PApplet parent) { 
    reset();
    try { 
      robot = new Robot();
    } 
    catch (AWTException e) { 
      e.printStackTrace();
    }
    if (robot != null) {
      robot.mouseMove(screenWidth/2, screenHeight/2);
      parent.registerMouseEvent(this);
    }
  }

  public PVector getRelative() {
    PVector r = relative.get();
    //relative = new PVector(0,0);
    return r;
  }
  
  public PVector getPosition() {
    return absolute.get();
  }
  
  public PVector getDelta(){
    PVector r = PVector.sub(absolute, pabsolute);
    pabsolute = absolute.get();
    return r;
  }

  public void reset() {
    absolute = new PVector();
    pabsolute = new PVector();
    relative = new PVector();
  }

  public void block() {
    blocked = true;
  }

  public void release() {
    blocked = false;
  }
  
  public void mouseEvent(MouseEvent e) {
    if (blocked) {
      if (e.getID() == MouseEvent.MOUSE_DRAGGED || e.getID() == MouseEvent.MOUSE_MOVED) {
        Point p = MouseInfo.getPointerInfo().getLocation();
        relative.x = p.x - screenWidth/2;
        relative.y = p.y - screenHeight/2;
        absolute.add(relative);
        robot.mouseMove(screenWidth/2, screenHeight/2);
      }
    }
  }
}
