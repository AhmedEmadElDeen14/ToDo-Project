import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo_app/widgets/task_card.dart';

class HomeTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          height: 100,
          selectedTextColor: const Color(0xff5D9CEC),
          selectionColor: Colors.white,
        ),
        TaskCard(title: "Play Basketball",description: "At 6am",),
        TaskCard(title: "English Course",description: "At 8am",),
      ],

    );
  }
}