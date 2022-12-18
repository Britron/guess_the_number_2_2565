import 'dart:io';
import 'dart:math';
import 'game.dart';

void main() {
  //ignore_for_file: avoid_print
  var game = Game();
  late GuessResult guessResult;
  bool wrong_answer = true;
  while(wrong_answer){

    break;
  }
  void drawLine(int currentLine) {
    if (currentLine == 1) {
      print("╔═════════════════════════════════════════"); // 1 = Start
      print("║           GUESS THE NUMBER              "); // 2 = wall
      print("╟─────────────────────────────────────────"); // 3 = middle line
    } else if (currentLine == 2) {
      // 4 = End
      stdout.write("║ ");
    } else if (currentLine == 3) {
      print("╟─────────────────────────────────────────");
    } else if (currentLine == 4) {
      print("╟─────────────────────────────────────────");
      print("║                THE END                  ");
      print("╚═════════════════════════════════════════");
    }
  }
}
