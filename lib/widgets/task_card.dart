import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/edit_task.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/task-model.dart';

class TaskCard extends StatefulWidget {
  TaskModel taskModel;

  TaskCard({super.key, required this.taskModel});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: .3,
          motion: BehindMotion(),
          children: [
            Container(
              child: SlidableAction(
                onPressed: (context) {
                  FirebaseFunctions.deleteTask(widget.taskModel.id);
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25)),
              ),
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: .3,
          motion: BehindMotion(),
          children: [
            Container(
              child: SlidableAction(
                onPressed: (context) {
                  Navigator.of(context).pushNamed(
                    EditTask.routeName,
                    arguments: widget.taskModel.id,
                  );
                },
                backgroundColor: Color(0xFF5D9CEC),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 5,
                    decoration: BoxDecoration(
                        color: widget.taskModel.isDone
                            ? Color(0xff61E757)
                            : Color(0xff5D9CEC),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.taskModel.title}",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: widget.taskModel.isDone
                                ? Color(0xff61E757)
                                : Color(0xff5D9CEC),
                          ),
                        ),
                        Text("${widget.taskModel.description}"),
                      ],
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  widget.taskModel.isDone = true;
                  FirebaseFunctions.editTask(widget.taskModel);
                  setState(() {});
                },
                child: widget.taskModel.isDone
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Done!",
                          style: TextStyle(
                            color: Color(0xff61E757),
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                            color: Color(0xff5D9CEC),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
