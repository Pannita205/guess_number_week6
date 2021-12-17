//top-lever fuonction

import 'dart:io';
import 'dart:math';

void main(){
  var check = true;
  var count = 0;
  var r = Random();
  var answer = r.nextInt(100);

  while(check){
    stdout.write('Please guess the number between 1 and 100: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if(guess == answer){
      count++;
      print('CORRECT , Total guesses: $count');
      break;
    }else {
      if (guess == null) {
        continue;
      } else {
        if (guess > answer) {
          print("$guess is TOO HIGH!");
        } else {
          print("$guess is TOO LOW!");
        }
      }
    }
     count++;
  }
}