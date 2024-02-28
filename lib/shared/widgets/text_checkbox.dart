import 'package:flutter/material.dart';

class TextCheckbox extends StatelessWidget {
  final String text;
  bool checked;
  void Function(bool value) onChange;

  TextCheckbox({
    required this.text,
    required this.onChange,
    this.checked = false
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
        color: checked ? Colors.blue[900] : Colors.black26,
        boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(1, 5),
            ),
          ],
        
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.0,
            color: checked ? Colors.white : Colors.white
          )
        ),
      ),
    );
  }
}