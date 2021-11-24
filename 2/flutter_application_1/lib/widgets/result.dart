// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final count;
  final total;

  const Result({Key? key, this.count, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = '';
    Widget img;

    if (0 <= count && count <= 2) {
      message = 'Нубас';
      img = Image.asset('assets/images/noob.png');
    } else if (2 <= count && count <= 4) {
      message = 'Среднячок';
      img = Image.asset('assets/images/steve.png');
    } else {
      message = 'Херобрин';
      img = Image.asset('assets/images/herobrine.png');
    }

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 15,
              spreadRadius: 0,
              offset: Offset(
                2,
                5,
              ))
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: FittedBox(
              fit: BoxFit.contain,
              child: img,
            ),
          ),
          Container(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Text(
            'Ответил верно на $count из $total',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
