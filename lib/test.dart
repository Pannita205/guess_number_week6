// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:guess_number/game.dart';



void main(){
  var r = Random();
  var answer = r.nextInt(100);
  var isCorrect = false;
  var count = 0;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  while(true){
    stdout.write('Please guess the number between 1 and 100: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }
    count++;
    if (guess > answer) {
      print("║ $guess is TOO HIGH!");
      print('╟────────────────────────────────────────');
    } else if(guess<answer) {
      print("║ $guess is TOO LOW!");
      print('╟────────────────────────────────────────');
    } else{
      print('║ $guess is CORRECT ❤, total guesses: $count');
      print('╟────────────────────────────────────────');
      isCorrect = true;
      break;
    }
  }while(!isCorrect);

      print('║                 THE END                ');
      print('╚════════════════════════════════════════');

  var get = "";
  while(true){
    stdout.write('play again? (Y/N): ');
    get = stdin.readLineSync()!;
    if(get.toUpperCase()=='Y'){
      break;
    }
    else if(get.toUpperCase()=='N'){
      exit (0);
    }
  }
  r = Random();
}



