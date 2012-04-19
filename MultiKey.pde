/**
MultyKey
Permits multiple keystrokes.
*/

public class MultiKey {
  private boolean[] keys;
  PApplet parent;

  MultiKey(PApplet parent) {
    this.parent = parent;
    keys = new boolean[256];
    parent.registerKeyEvent(this);
    for (int i=0; i<keys.length; i++) {
      keys[i] = false;
    }
  }

  public boolean isDown(int keyCode) {
    if (keyCode < 0 || keyCode >= keys.length - 1) return false;
    return keys[keyCode];
  }

  public void keyEvent(KeyEvent e) {
    if (e.getID() == KeyEvent.KEY_PRESSED) {
      keys[e.getKeyCode()] = true;
    } 
    else if (e.getID() == KeyEvent.KEY_RELEASED) {
      keys[e.getKeyCode()] = false;
    }
  }
}
