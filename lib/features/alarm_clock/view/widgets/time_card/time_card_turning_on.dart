import 'package:dream_book/features/alarm_clock/view/logic/time_card_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimeCardTurningOn extends StatelessWidget {
  final TimeCardVM vmTimeCard;

  TimeCardTurningOn({required this.vmTimeCard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: InkWell(
              onTap: () => vmTimeCard.changeIsEnabledTime(true),
              child: Obx(
                () => Center(
                    child: Icon(
                  Icons.check,
                  size: 16.0,
                  color:
                      vmTimeCard.isEnabled.value ? Colors.green : Colors.white,
                )),
              )),
        ),
        Expanded(
            child: InkWell(
          onTap: () => vmTimeCard.changeIsEnabledTime(false),
          child: Obx(() => Center(
                child: Icon(
                  Icons.close,
                  size: 16.0,
                  color: vmTimeCard.isEnabled.value ? Colors.white : Colors.red,
                ),
              )),
        ))
      ],
    );
  }
}
