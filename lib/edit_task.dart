import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/task-model.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "EditTask";

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var taskModel = ModalRoute.of(context)!.settings.arguments as TaskModel;
    final taskId = ModalRoute
        .of(context)
        ?.settings
        .arguments as String?;


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "To Do List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Color(0xff5D9CEC),
      ),
      body: FutureBuilder<TaskModel?>(
        future: FirebaseFunctions.getTaskById(taskId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final task = snapshot.data!;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 45, vertical: 60),
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: ListView(
                children: [
                  Column(
                    children: [
                      Text(
                        "Edit Task",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight
                            .w700),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: TextFormField(
                                controller: titleController
                                  ..text = snapshot.data!.title,
                                decoration: InputDecoration(
                                    hintText: "Add your Title",
                                    hintStyle: TextStyle(
                                        color: Color(0xffA9A9A9))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter some text";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                child: TextFormField(
                                  controller: descriptionController
                                    ..text = snapshot.data!.description,
                                  decoration: InputDecoration(
                                      hintText: "Add your description",
                                      hintStyle:
                                      TextStyle(color: Color(0xffA9A9A9))),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter some text";
                                    }
                                    return null;
                                  },
                                )),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Select Time",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            InkWell(
                              onTap: () {
                                selectTaskDate();
                              },
                              child: Text(
                                "${selectedDate.toString().substring(0, 10)}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(
                                    0xffA9A9A9,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  TaskModel taskModel = TaskModel(
                                    userId: FirebaseAuth.instance.currentUser!.uid,
                                    id: taskId,
                                    title: titleController.text,
                                    description: descriptionController.text,
                                    date: DateUtils
                                        .dateOnly(selectedDate)
                                        .millisecondsSinceEpoch,);
                                  FirebaseFunctions.editTask(taskModel);
                                  Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route) => false,);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Color(0xff5D9CEC)),
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                    horizontal: 45,
                                    vertical: 15,
                                  ),
                                ),
                              ),
                              child: Text(
                                "Save Changes",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('Task not found'));
          }
        },

      ),
    );
  }

  selectTaskDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
