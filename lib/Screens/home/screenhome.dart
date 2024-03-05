import 'package:flutter/material.dart';
import 'package:hive1/Screens/home/widgets/add_student.dart';
import 'package:hive1/Screens/home/widgets/list_student.dart';
import 'package:hive1/db/functions/dbfunctions.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  ScreenHomeState createState() => ScreenHomeState();
}

class ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
    getAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudent(),
            Expanded(child: ListStudentWidget()),
          ],
        ),
      ),
    );
  }
}
