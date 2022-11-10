import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const goo = '✊';
const choki = '✌️';
const paa = '🖐';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: janken_page(),
    );
  }
}

class janken_page extends StatefulWidget {
  const janken_page({super.key});

  @override
  State<janken_page> createState() => janken_pageState();
}

class janken_pageState extends State<janken_page> {
  String myHand = '✊';
  String computerHand = '✊';
  String result = '引き分け';

  // 関数の定義も、State の {} の中で行います。
  void selectHand(String selectedHand) {
    myHand = selectedHand; // myHand に 引数として受けとった selectedHand を代入します。
    print(myHand);
    generateComputerHand();
    judge(); // コンピューターの手を決める。
    setState(() {});
  }

  void generateComputerHand() {
    // randomNumberに一時的に値を格納します。
    final randomNumber = Random().nextInt(3);
    // 生成されたランダムな数字を ✊, ✌️, 🖐 に変換して、コンピューターの手に代入します。
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    // () のなかには条件となる値を書きます。
    switch (randomNumber) {
      case 0: // 入ってきた値がもし 0 だったら。
        return goo; // ✊を返す。
      case 1: // 入ってきた値がもし 1 だったら。
        return choki; // ️✌を返す。
      case 2: // 入ってきた値がもし 2 だったら。
        return paa; // 🖐を返す。
      default: // 上で書いてきた以外の値が入ってきたら。
        return goo; // ✊を返す。（0, 1, 2 以外が入ることはないが念のため）
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
      // 勝ちの場合
    } else if (myHand == goo && computerHand == choki ||
        myHand == choki && computerHand == paa ||
        myHand == paa && computerHand == goo) {
      result = '勝ち';
      // 負けの場合
    } else {
      result = '負け';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              computerHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            // 余白を追加
            SizedBox(height: 48),

            /// 勝敗を表示されるための Text
            Text(
              result,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 48),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand(goo); // 作った関数を呼び出すときはこのように書きます。
                  },
                  child: Text(goo),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(choki); // 作った関数を呼び出すときはこのように書きます。
                  },
                  child: Text(choki),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(paa); // 作った関数を呼び出すときはこのように書きます。
                  },
                  child: Text(paa),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
