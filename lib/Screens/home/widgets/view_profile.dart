import 'package:flutter/material.dart';
import 'package:hive1/db/functions/dbfunctions.dart';
import 'package:hive1/db/model/datamodel.dart';
import 'update_student.dart';

class ViewProfilePage extends StatefulWidget {
  final StudentModel student;

  const ViewProfilePage({Key? key, required this.student}) : super(key: key);

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('YOUR PROFILE')),
        backgroundColor: Colors.redAccent,
        actions: [
        
          IconButton(
  onPressed: () {
    deleteStudent(widget.student.id!);
    Navigator.pop(context);
  },
  icon: const Icon(Icons.delete),
),

        ],
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 600,
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Name: ${widget.student.name}'),
              Text('Place: ${widget.student.place}'),
              Text('Age: ${widget.student.age}'),
            ],
          ),
        ),
      ),
    );
  }
}
