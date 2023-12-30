import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:product_list/app/my_app/my_app_view.dart';
import 'package:product_list/screens/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //var directory = await getApplicationDocumentsDirectory();
  //Hive.init(directory.path);

  //Hive.registerAdapter(NoteAdapter());
  //await Hive.openBox<Note>(kNoteBox);
  await Hive.initFlutter();
  await Hive.openBox('open_note');
  runApp( MyAppPage());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}