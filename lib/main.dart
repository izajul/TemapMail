import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temp_mail/utils/appearance.dart';
import 'package:temp_mail/utils/functions.dart';
import 'package:temp_mail/view/splash_screen.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.blueGrey,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      title: 'Temporary Mail',
      theme: theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
