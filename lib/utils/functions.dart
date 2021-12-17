import 'package:flutter/cupertino.dart';
import 'package:temp_mail/view/splash_screen.view.dart';

Route onGenerateRoute(settings) {
  Widget _nextPage;

  switch (settings.name) {
    case SplashScreen.routeName:
      _nextPage = const SplashScreen();
      break;
    default:
      _nextPage = const SplashScreen();
  }

  return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => _nextPage,
      transitionsBuilder: (_, anim1, __, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.easeInSine;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: anim1.drive(tween),
          child: child,
        );
      });
}
