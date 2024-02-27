import 'package:dream_book/features/alarm_clock/view/widgets/time_picker/time_picker_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const ITEM_EXTENT = 80;

class TimePickerWheel extends StatelessWidget {
  final int childCount;
  final FixedExtentScrollController scrollController =
      FixedExtentScrollController();
  final String instanceName;

  TimePickerWheel({required this.childCount, required this.instanceName});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TimePickerVM>(tag: instanceName);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scrollController.jumpToItem(controller.selectedTime.value);
    });

    scrollController.addListener(() {
      int offset = scrollController.offset.round();

      if (offset == 0) {
        controller.changeSelectedTime(0);
      } else {
        controller.changeSelectedTime((offset / ITEM_EXTENT).round());
      }
    });

    return Stack(
      children: [
        Positioned(
            top: 70,
            left: 25,
            child: Container(width: 50, height: 2, color: Colors.blue)),
        Positioned(
            bottom: 90,
            left: 25,
            child: Container(width: 50, height: 2, color: Colors.blue)),
        SizedBox(
            height: 240,
            child: ListWheelScrollView.useDelegate(
              controller: scrollController,
              physics: const FixedExtentScrollPhysics(),
              itemExtent: ITEM_EXTENT.toDouble(),
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  return Obx(() => Text(
                        (index % childCount).toString().padLeft(2, "0"),
                        style: TextStyle(
                          fontSize: 40,
                          color: index == controller.selectedTime.value
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ));
                },
                childCount: childCount * 100,
              ),
            ))
      ],
    );
  }
}
