import 'package:dream_book/modules/alarm_clock/widgets/timePicker/types/time_picker_view_model_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const ITEM_EXTENT = 80;

class TimePickerWheel extends StatelessWidget {
  final TimePickerViewModelBase viewModel;
  final FixedExtentScrollController scrollController =
      FixedExtentScrollController();
  final int childCount;

  TimePickerWheel(
      {super.key, required this.viewModel, required this.childCount});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      scrollController.jumpToItem(viewModel.scrollControllerValue);
    });

    scrollController.addListener(() {
      int offset = scrollController.offset.round();
      // print(offset);
      if (offset == 0) {
        viewModel.changeSelectedTime(0);
      } else {
        viewModel.changeSelectedTime((offset / ITEM_EXTENT).round());
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
                        color: index == viewModel.scrollControllerValue
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ));
              },
              childCount: childCount * 100,
            ),
          ),
        )
      ],
    );
  }
}
