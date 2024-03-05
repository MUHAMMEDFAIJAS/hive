import 'package:flutter/material.dart';
import 'package:hive1/db/model/datamodel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Screens/home/screenhome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter()); 
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenHome(),
    );
  }
}
