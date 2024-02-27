import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget{

  String title="";
  String description="";

  TaskCard({super.key,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 5,
                decoration: BoxDecoration(
                    color: Color(0xff5D9CEC),
                    borderRadius: BorderRadius.circular(25)
                ),

              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${title}",style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff5D9CEC),
                    ),),
                    Text("${description}"),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: 15
            ),
            padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 3
            ),
            decoration: BoxDecoration(
                color: Color(0xff5D9CEC),
                borderRadius: BorderRadius.circular(10)
            ),
            child: Icon(Icons.check,color: Colors.white,size: 30,),
          ),
        ],
      ),
    );
  }

}