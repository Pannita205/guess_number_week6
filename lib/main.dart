
import 'dart:ui';
import 'package:flutter/material.dart';
import 'game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GUESS THE NUMBER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _controller = TextEditingController();
  var game = Game();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),

          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/guess_logo.png',
                        width: 100,
                        height: 100,
                        //fit: BoxFit.fill,
                      ),

                    ),

                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text('GUESS',
                            style: TextStyle(
                                fontSize: 70.0,
                                color: Colors.purple.shade200)),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.purple.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextField(

                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(),
                      hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),

              child: ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: () {
                    var input = _controller.text;
                    var number = int.tryParse(input);
                    String title = "RESULT";
                    String content="";
                    if(number == null) {
                      title = "ERROR";
                      content = "กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น";
                    }
                    else {
                      var result = game.doGuess(number);
                      if (result == 1) {
                        content = "$number มากเกินไป กรุณาลองใหม่" ;
                      } else if (result == -1) {
                        content = "$number น้อยเกินไป กรุณาลองใหม่" ;
                      } else if (result == 0) {
                        content = "🎊 $number ถูกต้องค่ะ 🎊 \nคุณทายทั้งหมด ${game.guessCount} ครั้ง" ;

                      }

                    }

                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(title),
                          content: Text(content),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}