import 'package:flutter/cupertino.dart';
import 'package:hive1/db/model/datamodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

final studentListNotifier = ValueNotifier<List<StudentModel>>([]);
 List<StudentModel> originalStudentList = [];
 




Future<void> addStudent(StudentModel value) async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  await studentDb.add(value);

  studentListNotifier.value.add(value);
 
  studentListNotifier.notifyListeners();
 
  
}


Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int index, {String? searchQuery}) async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  await studentDb.deleteAt(index);

  if (searchQuery != null) {
    searchStudents(searchQuery);
  } else {
    getAllStudents();
  }
}

Future<void> updateStudent(StudentModel updatedStudent) async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  final index = studentListNotifier.value.indexWhere((student) => student.id == updatedStudent.id);

  if (index != -1) {
    await studentDb.putAt(index, updatedStudent);
    studentListNotifier.value[index] = updatedStudent;
    studentListNotifier.notifyListeners();
  }
}


void searchStudents(String query) async {
  final studentDb = await Hive.openBox<StudentModel>('Student_db');
  final searchResults = studentDb.values.where((student) =>
      student.name.toLowerCase().contains(query.toLowerCase()) ||
      student.age.toLowerCase().contains(query.toLowerCase()) ||
      student.place.toLowerCase().contains(query.toLowerCase()));

  studentListNotifier.value = searchResults.toList();
  studentListNotifier.notifyListeners();  
}
