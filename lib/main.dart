import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceleft = 1;
  int diceright = 1;
  String total = '';
  int scoreleft = 0;
  int scoreright = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0
              ),
              child: Text(
                'Score: ' + '$scoreleft', style: const TextStyle(
                fontSize: 25.0,
              ),
              ),
            )),
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0
              ),
              child: Text(
                'Score: ' + '$scoreright', style: const TextStyle(
                fontSize: 25.0,
              ),
              ),
            ))
          ],
        ),
        Center(
          child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        stful();
                        totals();

                      });
                    },
                    child: Image.asset('images/dice$diceleft.png')),
              )),
              Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: (){
                        setState(() {
                          stful();
                          totals();
                        });
                      },
                      child: Image.asset('images/dice$diceright.png'))
              )),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [Text(
                '$total',
                style: TextStyle(
                    fontSize: 25.0
                )
            )],
          ),
        ),
        Center(
          child: Row(
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        Reset();
                      });
                    },
                    child: Image.asset('images/RES.png')),
              )),
            ],
          ),
        ),
      ],
    );

  }
  void stful(){
    diceright = 1 + Random().nextInt(6);
    diceleft = 1 + Random().nextInt(6);
  }
  void totals(){
    if(diceleft > diceright){
      total = 'Dice Left WINS!';
      scoreleft += 1;
    }else if(diceleft < diceright){
      total = 'Dice Right WINS!';
      scoreright += 1;;
    }else{
      total = 'Tie';
    }
  }
  void Reset(){
    scoreleft = 0;
    scoreright = 0;
  }
}



