import 'package:hive/hive.dart';
part 'datamodel.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String place;


  
  StudentModel(
      {required this.name,
      required this.age,
      required this.place,
      int? id, 
     
      });
}
