import 'dart:io';
import 'game.dart';

void main() {
  //ignore_for_file: avoid_print
  var playing = true;
  while (playing) {
    stdout.write('Enter a maximum number to random: ');
    var inputMaxRandom = stdin.readLineSync();
    if (inputMaxRandom == null) {
      return;
    }

    var maxRandom = int.tryParse(inputMaxRandom);
    if (maxRandom == null) {
      continue;
    }
    var game = Game(maxRandom: maxRandom);

    bool wrongAnswer = true;
    drawLine(1);
    while (wrongAnswer) {
      drawLine(2);
      stdout.write(' Guess the number between 1 and $maxRandom: ');
      var inputGuess = stdin.readLineSync();
      if (inputGuess == null) {
        return;
      }

      var guess = int.tryParse(inputGuess);
      if (guess == null) {
        continue;
      }
      var doGuess = game.doGuess(guess);
      if (doGuess == GuessResult.tooLow) {
        drawLine(2);
        print('➜ $guess is TOO LOW! ▼');
        drawLine(3);
      } else if (doGuess == GuessResult.tooHigh) {
        drawLine(2);
        print('➜ $guess is TOO HIGH! ▲');
        drawLine(3);
      } else if (doGuess == GuessResult.correct) {
        drawLine(2);
        int totalGuess = game.totalGuess;
        game.addTotalGuessList();
        print('➜ $guess is CORRECT ❤, total guesses: $totalGuess');
        drawLine(4);
        wrongAnswer = false;
      }
    }
    while (true) {
      stdout.write('Play again? (Y/N): ');
      var play = stdin.readLineSync();
      if (play == 'Y' || play == 'y') {
        break;
      }else if (play == 'N' || play == 'n') {
        var countList = game.countListLength();
        print('You have played $countList games');
        for(int i = 1 ; i <= countList;i++) {
          var wonTime = game.lookList(i);
          print('🚀 Game#$i: $wonTime guesses');
        }
        return;
      }
    }
  }
}

void drawLine(int currentLine) {
  if (currentLine == 1) {
    print("╔═════════════════════════════════════════"); // 1 = Start
    print("║           GUESS THE NUMBER              "); // 2 = wall
    print(
        "╟─────────────────────────────────────────"); // 3 = middle line , 4 = End
  } else if (currentLine == 2) {
    stdout.write("║ ");
  } else if (currentLine == 3) {
    print("╟─────────────────────────────────────────");
  } else if (currentLine == 4) {
    print("╟─────────────────────────────────────────");
    print("║                THE END                  ");
    print("╚═════════════════════════════════════════");
  }
}
