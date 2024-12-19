import 'dart:io';

void main() {
  List<List<String>> board = [
    ['-', '-', '-'],
    ['-', '-', '-'],
    ['-', '-', '-']
  ];

  String currentPlayer = 'X';
  bool gameWon = false;

  while (!gameWon && !isBoardFull(board)) {
    printBoard(board);
    print("Player $currentPlayer's turn. Enter row and column (1-3): ");

    int row = int.parse(stdin.readLineSync()!) - 1;
    int col = int.parse(stdin.readLineSync()!) - 1;

    if (row >= 0 && row < 3 && col >= 0 && col < 3 && board[row][col] == '-') {
      board[row][col] = currentPlayer;
      if (checkWin(board, currentPlayer)) {
        gameWon = true;
        printBoard(board);
        print("Player $currentPlayer wins!");
      } else {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      }
    } else {
      print("Invalid move. Try again.");
    }
  }

  if (!gameWon) {
    print("It's a draw!");
  }
}

void printBoard(List<List<String>> board) {
  for (var row in board) {
    print(row.join(' '));
  }
}

bool isBoardFull(List<List<String>> board) {
  for (var row in board) {
    if (row.contains('-')) return false;
  }
  return true;
}

bool checkWin(List<List<String>> board, String player) {
  // Check rows, columns, and diagonals
  for (int i = 0; i < 3; i++) {
    if ((board[i][0] == player &&
            board[i][1] == player &&
            board[i][2] == player) ||
        (board[0][i] == player &&
            board[1][i] == player &&
            board[2][i] == player)) {
      return true;
    }
  }
  if ((board[0][0] == player &&
          board[1][1] == player &&
          board[2][2] == player) ||
      (board[0][2] == player &&
          board[1][1] == player &&
          board[2][0] == player)) {
    return true;
  }
  return false;
}
