import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temp_mail/utils/appearance.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const Text('Flutter Demo Home Page'),
    );
  }
}
