import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextCheckbox extends StatelessWidget {
  final String text;
  final RxBool checked;
  final void Function(bool value) onChange;

  TextCheckbox({
    required this.text,
    required this.onChange,
    required this.checked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        checked.toggle();
        onChange(checked.value);
      },
      child: TweenAnimationBuilder<Color?>(
        duration: const Duration(milliseconds: 500),
        tween: ColorTween(
          begin: Colors.black26,
          end: checked.value ? Colors.blue[900] : Colors.black26,
        ),
        builder: (context, color, child) {
          return Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: color,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(1, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
