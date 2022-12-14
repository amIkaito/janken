import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const goo = 'â';
const choki = 'âï¸';
const paa = 'ð';

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
  String myHand = 'â';
  String computerHand = 'â';
  String result = 'å¼ãåã';

  // é¢æ°ã®å®ç¾©ããState ã® {} ã®ä¸­ã§è¡ãã¾ãã
  void selectHand(String selectedHand) {
    myHand = selectedHand; // myHand ã« å¼æ°ã¨ãã¦åãã¨ã£ã selectedHand ãä»£å¥ãã¾ãã
    print(myHand);
    generateComputerHand();
    judge(); // ã³ã³ãã¥ã¼ã¿ã¼ã®æãæ±ºããã
    setState(() {});
  }

  void generateComputerHand() {
    // randomNumberã«ä¸æçã«å¤ãæ ¼ç´ãã¾ãã
    final randomNumber = Random().nextInt(3);
    // çæãããã©ã³ãã ãªæ°å­ã â, âï¸, ð ã«å¤æãã¦ãã³ã³ãã¥ã¼ã¿ã¼ã®æã«ä»£å¥ãã¾ãã
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    // () ã®ãªãã«ã¯æ¡ä»¶ã¨ãªãå¤ãæ¸ãã¾ãã
    switch (randomNumber) {
      case 0: // å¥ã£ã¦ããå¤ããã 0 ã ã£ããã
        return goo; // âãè¿ãã
      case 1: // å¥ã£ã¦ããå¤ããã 1 ã ã£ããã
        return choki; // ï¸âãè¿ãã
      case 2: // å¥ã£ã¦ããå¤ããã 2 ã ã£ããã
        return paa; // ðãè¿ãã
      default: // ä¸ã§æ¸ãã¦ããä»¥å¤ã®å¤ãå¥ã£ã¦ãããã
        return goo; // âãè¿ããï¼0, 1, 2 ä»¥å¤ãå¥ããã¨ã¯ãªããå¿µã®ããï¼
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = 'å¼ãåã';
      // åã¡ã®å ´å
    } else if (myHand == goo && computerHand == choki ||
        myHand == choki && computerHand == paa ||
        myHand == paa && computerHand == goo) {
      result = 'åã¡';
      // è² ãã®å ´å
    } else {
      result = 'è² ã';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ããããã'),
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
            // ä½ç½ãè¿½å 
            SizedBox(height: 48),

            /// åæãè¡¨ç¤ºãããããã® Text
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
                    selectHand(goo); // ä½ã£ãé¢æ°ãå¼ã³åºãã¨ãã¯ãã®ããã«æ¸ãã¾ãã
                  },
                  child: Text(goo),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(choki); // ä½ã£ãé¢æ°ãå¼ã³åºãã¨ãã¯ãã®ããã«æ¸ãã¾ãã
                  },
                  child: Text(choki),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand(paa); // ä½ã£ãé¢æ°ãå¼ã³åºãã¨ãã¯ãã®ããã«æ¸ãã¾ãã
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
