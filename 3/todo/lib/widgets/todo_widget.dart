import 'package:flutter/material.dart';

class ToDoWidget extends StatelessWidget {
  final String text;
  final bool checked;

  ToDoWidget({Key? key, required this.text, required this.checked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.only(right: 12),
              child: Icon(
                checked ? Icons.check_box : Icons.check_box_outline_blank,
                color: checked ? Colors.blue : Colors.black,
              )),
          Flexible(child: Text(text)),
        ],
      ),
    );
  }
}
