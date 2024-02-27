import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final IconData icon;

  const CustomSwitch({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.dual(
      loading: false,
      current: true,
      first: true,
      second: false,
      spacing: 0.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 0.5),
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 30,
      onChanged: (b) => {},
      styleBuilder: (b) =>
          ToggleStyle(indicatorColor: b ? Colors.blue : Colors.grey),
      indicatorTransition: ForegroundIndicatorTransition.fading(),
      indicatorSize: Size.fromWidth(25.0),
      iconBuilder: (value) => value
          ? Icon(
              icon,
              size: 15.0,
            )
          : Icon(icon, size: 15.0),
    );
  }
}
