import 'dart:math';
enum GuessResult{
  correct, tooHigh, tooLow;
}

class Game {
  late final int answer;
  int totalGuess = 0;
  static List<int> guessesList=[];
  // constructor
  Game({required int maxRandom}) {
    answer = Random().nextInt(maxRandom)+1;
    //print('Answer is $answer');
  }

  GuessResult doGuess(int guess) {
    totalGuess++;

    if (guess < answer) {
    return GuessResult.tooLow;
    } else if (guess > answer) {
    return GuessResult.tooHigh;
    } else {
      return GuessResult.correct;
    }
  }

  void addTotalGuessList(){
    guessesList.add(totalGuess);
  }
  int countListLength(){
    return guessesList.length;
  }
  int lookList(int list){
    list--;
    return guessesList[list];
  }
}
