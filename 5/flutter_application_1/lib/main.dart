import 'dart:math';

import 'package:flutter/material.dart';

import 'items.dart';

void main() {
  runApp(const RockPaperScissors());
}

class RockPaperScissors extends StatefulWidget {
  const RockPaperScissors({Key? key}) : super(key: key);

  @override
  State<RockPaperScissors> createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  bool _isWin = false;
  Items _enemyItem = Items.paper;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RockPaperScissors'),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: Text(_isWin ? 'Победа' : 'Не-победа')),
                      const Text('Ответ соперника: '),
                      Icon(iconsItems[_enemyItem]),
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          play(Items.rock);
                        },
                        icon: const Icon(Icons.brightness_1)),
                    IconButton(
                        onPressed: () {
                          play(Items.paper);
                        },
                        icon: const Icon(Icons.bookmark)),
                    IconButton(
                        onPressed: () {
                          play(Items.scissors);
                        },
                        icon: const Icon(Icons.cut)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void play(Items item) {
    var random = Random();
    num enemyRandom = random.nextInt(3);
    Items enemyItem;
    switch (enemyRandom) {
      case 1:
        enemyItem = Items.rock;
        break;
      case 2:
        enemyItem = Items.paper;
        break;
      default:
        enemyItem = Items.scissors;
        break;
    }

    _enemyItem = enemyItem;
    _isWin = isWin(item, enemyItem);
    setState(() {});
  }

  bool isWin(Items player, Items enemy) {
    if (player == Items.rock && enemy == Items.scissors) {
      return true;
    }
    if (player == Items.paper && enemy == Items.rock) {
      return true;
    }
    if (player == Items.scissors && enemy == Items.paper) {
      return true;
    }
    return false;
  }

  Map<Items, IconData> iconsItems = <Items, IconData>{
    Items.rock: Icons.brightness_1,
    Items.paper: Icons.bookmark,
    Items.scissors: Icons.cut
  };
}
