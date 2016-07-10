Square player1;
Square player2;
int startX = 100;
int startY = 300;
int size = 50;
int startSpeed = 10;
int state;
int score = 0;

// return null if neither is on top
Square squareOnTop(Square player, Square enemy) {
    if (Math.abs(player.y - enemy.y) < size / 2) {
      return null;  
    }
    if (player.y < enemy.y) {
      return player;
    } 
    else {
      return enemy;
    }
}

void resetPositions() {
  player1.x = startX;
  player1.y = startY;
  player1.xSpeed = startSpeed;
  player2.x = width - startX;
  player2.y = startY;  
  player2.xSpeed = -startSpeed;
}

void setup() {
  size(1000, 400);
  player1 = new Square(startX, startY, size, startSpeed, 'w', 0, 255, 0);
  player2 = new Square(width - startX, startY, size, startSpeed * -1, 'e', 0, 0, 255);
  state = 0;
}

void draw() {
  switch (state) {
    
    case 0: // start screen
      background(0, 0, 255);
      textSize(25);
      fill(255);
      text("START GAME", width / 2, height / 2);
      if (mousePressed) {
        state = 1;  
      }
      break;
      
    case 1: // game  
      background(0);
      
      // floor
      fill(255, 0, 0);
      rect(0, 350, 1000, 100);
      
      // score text
      fill(255);
      text(score, width / 2, height - 10);
      
      // movements
      player1.move(player2);
      player2.move(player1);
      if (player1.checkCollision(player2)) {
        Square winner = squareOnTop(player1, player2);
        if (winner != null) {
          if (winner.equals(player1)) {
            score++;
          }  
          else {
            score--;  
          }
          resetPositions();
        }
        else {
          player1.reverse();
          player2.reverse();      
        }
      }
      
      
      break;
      
    case 2: // game over screen
      background(0, 0, 255);
      textSize(25);
      fill(255);
      text("GAME OVER", width / 2, height / 2);
      if (mousePressed) {
        state = 0;  
      }
      break;
  }
  
}
