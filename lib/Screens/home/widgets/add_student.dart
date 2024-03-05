
import 'package:flutter/material.dart';


import 'package:hive1/db/functions/dbfunctions.dart';
import 'package:hive1/db/model/datamodel.dart';

class AddStudent extends StatefulWidget {
 const AddStudent({Key? key}) : super(key: key);

  @override
  AddStudentState createState() => AddStudentState();
}

class AddStudentState extends State<AddStudent> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _placeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
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
    onAddStudentButtonClicked();
  },
  icon: const Icon(Icons.add),
  label: const Text('Add Student'),
),

        ],
      ),
    );
  }

  Future<void> onAddStudentButtonClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final place = _placeController.text.trim();

    if (name.isEmpty || age.isEmpty || place.isEmpty ) {
      return;
    }

    final student = StudentModel(
      name: _nameController.text,
      age: _ageController.text,
      place: _placeController.text,
     
    );

     addStudent(student);

   
    _nameController.clear();
    _ageController.clear();
    _placeController.clear();
   
  }
}
