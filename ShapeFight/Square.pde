class Square {
  float x;
  float y;
  int r;
  int g;
  int b;
  int size;
  int xSpeed = 10;
  int ySpeed = 10;
  boolean inAir;  
  boolean goingUp;
  boolean hasJumpAvailable = true;
  final int MAX_HEIGHT = 0;
  final float FLOOR;
  float rotationSpeed = 49;
  float angle = 0;
  char assignedKey;
  
  public Square(float x, float y, int size, int speed, char assignedKey, int r, int g, int b) {
    this.x = x;
    this.y = y;
    FLOOR = y;
    xSpeed = speed;
    this.size = size;
    this.r = r;
    this.g = g;
    this.b = b;
    inAir = false;
    goingUp = false;
    this.assignedKey = assignedKey;
  }
  
  public void reverse() {
    xSpeed *= -1;  
  }
  
  // check if squares collide
  public boolean checkCollision(Square s) {
    return dist(x, y, s.x, s.y) < size;
//      xSpeed *= -1;
  }
  
  public void checkKeys() {
    if (keyPressed) {
      if (key == assignedKey && hasJumpAvailable) {
//        inAir = true;
        goingUp = true;
      }   
    }
    else {
      hasJumpAvailable = (y == FLOOR);
      goingUp = false;
    }     
    jump();
  }
  
  public void jump() {
      if (goingUp) {
        y -= ySpeed;  
      }
      else {
        y+= ySpeed;
      }
      if (y < MAX_HEIGHT) {
        goingUp = false;
        hasJumpAvailable = false;  
      }
      if (y > FLOOR) {
        y = FLOOR;
        hasJumpAvailable = true;
//        inAir = false;  
      }
  }
  
  public void move(Square opponent) {
    show();
//    checkCollision(opponent);
    x += xSpeed;
    checkKeys();
    if (isOutOfBounds()) {
      reverse();
    }
  }
  
  public boolean isOutOfBounds() {
    return (x < 0 || x > width - size);
  }
  
  public void show() {
    fill(r, g, b);
    /*
    * rotation if in air
    */
//    if (inAir) {
//      pushMatrix();
//      translate(x, y);
//      rotate(radians(angle));
//      angle += rotationSpeed;
//      imageMode(CENTER);
//      rect(0, 0, size, size);
//      popMatrix();      
//    }
//    else {
    rect(x, y, size, size);
//    }
    
  }
  
}

