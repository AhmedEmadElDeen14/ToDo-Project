import 'package:flutter/material.dart';

class AddTaskSheet extends StatefulWidget {
  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final _formKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now();

  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(45),
      child: Column(
        children: [
          Text(
            "Add new Task",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your task",
                        hintStyle: TextStyle(color: Color(0xffA9A9A9))),
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
                      decoration: InputDecoration(
                          hintText: "Enter your description",
                          hintStyle: TextStyle(color: Color(0xffA9A9A9))),
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Add"),
                )
              ],
            ),
          ),
        ],
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
