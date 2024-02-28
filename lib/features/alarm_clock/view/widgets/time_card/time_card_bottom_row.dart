import 'package:dream_book/shared/widgets/text_checkbox.dart';
import 'package:flutter/material.dart';

class TimeCardBottomRow extends StatelessWidget {


  
  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        TextCheckbox(text: "Пн", onChange: (value) {}, checked: true,),
        const SizedBox(width: 12,),
        TextCheckbox(text: "Вт", onChange: (value) {}, checked: true,),
        const SizedBox(width: 12,),
        TextCheckbox(text: "Ср", onChange: (value) {}, checked: true,),
        const SizedBox(width: 12,),
        TextCheckbox(text: "Чт", onChange: (value) {}, checked: true,),
        const SizedBox(width: 12,),
        TextCheckbox(text: "Пт", onChange: (value) {}, checked: true,),
        const SizedBox(width: 12,),
        TextCheckbox(text: "Сб", onChange: (value) {}, checked: false,),
        const SizedBox(width: 12,),
        TextCheckbox(text: "Вс", onChange: (value) {}, checked: false,),
      ],
    );
  }
}
