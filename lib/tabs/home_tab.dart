import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/task-model.dart';
import 'package:todo_app/widgets/task_card.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: selectedDate,
          height: 100,
          selectedTextColor: const Color(0xff5D9CEC),
          selectionColor: Colors.white,
          onDateChange: (date) {
            selectedDate = date;
            setState(() {});
          },
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFunctions.getTasks(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(snapshot.error.toString()),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                );
              }
              List<TaskModel> tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

              if (tasks.isEmpty) {
                return Text("No Tasks");
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  return TaskCard(taskModel: tasks[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: tasks.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
