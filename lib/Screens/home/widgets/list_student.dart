import 'package:flutter/material.dart';
import 'package:hive1/Screens/home/widgets/view_profile.dart';
import 'package:hive1/db/functions/dbfunctions.dart';
import 'package:hive1/db/model/datamodel.dart';
import 'update_student.dart';

class ListStudentWidget extends StatefulWidget {
  const ListStudentWidget({super.key});

  @override
  ListStudentWidgetState createState() => ListStudentWidgetState();
}

class ListStudentWidgetState extends State<ListStudentWidget> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    originalStudentList = studentListNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              filterStudents(value);
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (BuildContext ctx, List<StudentModel> studentList,
                Widget? child) {
              return ListView.builder(
                itemBuilder: (ctx, index) {
                  final data = studentList[index];
                  return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.age),
                    leading: const CircleAvatar(),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewProfilePage(student: data),
                        ),
                      );
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdateStudent(index, student: data),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteStudent(data.id!);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: studentList.length,
              );
            },
          ),
        ),
      ],
    );
  }

  void filterStudents(String query) {
    if (query.isEmpty) {
      setState(() {
        studentListNotifier.value = originalStudentList;
      });
    } else {
      final List<StudentModel> filteredList = originalStudentList
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()) ||
              student.age.toLowerCase().contains(query.toLowerCase()) ||
              student.place.toLowerCase().contains(query.toLowerCase()))
          .toList();

      setState(() {
        studentListNotifier.value = filteredList;
      });
    }
  }
}
