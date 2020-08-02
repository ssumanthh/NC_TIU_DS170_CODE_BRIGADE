
import 'package:fillme/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fillme/authentication/root_page.dart';
import 'widgets/RouteObserver.dart';
import 'authentication/auth.dart';
import 'authentication/root_page.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
        title: 'Fill Me',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[
          MyRouteObserver(), // this will listen all changes
        ],
        routes:<String, WidgetBuilder>{
          '/': (context) {
            return Welcome();
          },
          '/rootpage': (context) {
            return RootPage(
              auth: new Auth(),
              st: 'Register',
            );
          },
        });
  }
}
