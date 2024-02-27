import 'package:flutter/material.dart';

class AnimatedColon extends StatefulWidget {
  const AnimatedColon({Key? key}) : super(key: key);

  @override
  _AnimatedColonState createState() => _AnimatedColonState();
}

class _AnimatedColonState extends State<AnimatedColon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: const Text(":", style: TextStyle(fontSize: 36)),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
