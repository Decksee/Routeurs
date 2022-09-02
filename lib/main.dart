import 'package:flutter/material.dart';
import 'package:routeur/screens/Home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart/';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(MyApp());

}
class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF9F9FB)),
      home: Home(),
    );
  }
}

