import 'package:flutter/material.dart';
import 'package:hive1/db/functions/dbfunctions.dart';
import 'package:hive1/db/model/datamodel.dart';

class UpdateStudent extends StatefulWidget {
  final StudentModel student;

  const UpdateStudent(int index, {Key? key, required this.student}) : super(key: key);

  @override
  State<UpdateStudent> createState() => UpdateStudentState();
}

class UpdateStudentState extends State<UpdateStudent> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _placeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.name);
    _ageController = TextEditingController(text: widget.student.age);
    _placeController = TextEditingController(text: widget.student.place);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age',
              ),
            ),
            TextFormField(
              controller: _placeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Place',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: () {
                editStudent();
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Student'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editStudent() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final place = _placeController.text.trim();

    if (name.isEmpty || age.isEmpty || place.isEmpty) {
      return;
    }

    final updatedStudent = StudentModel(
      id: widget.student.id,
      name: name,
      age: age,
      place: place,
    );

    updateStudent(updatedStudent);

    Navigator.pop(context);
  }
}
