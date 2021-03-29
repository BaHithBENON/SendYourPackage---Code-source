import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ryp/database/database.dart';
import 'package:ryp/house_cp/splash_screen.dart';

Future<List<Box>> _openBox() async{
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  return openAllBox();
}

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await _openBox();
  initDatabaseData();
  getUser();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RYP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
