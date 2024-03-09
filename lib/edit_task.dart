import 'package:flutter/material.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "EditTask";

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final _formKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 45, vertical: 60),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: ListView(
          children: [
            Column(
              children: [
                Text("Edit Task",style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),),
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "This is title",
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

                                hintText: "Task details",
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
                        onPressed: () {},
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
