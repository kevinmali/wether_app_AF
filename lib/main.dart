import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Provider/themeprovider.dart';
import 'Views/Screens/Splace_screen.dart';
import 'Views/Screens/Wether_page.dart';
import 'Views/Screens/intro_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isvisited = preferences.getBool("isIntroVisited") ?? false;
  runApp(MultiProvider(
    providers: [
      ListenableProvider<themeprovider>(create: (context) => themeprovider()),
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: (isvisited) ? 'Splash' : '/',
      routes: {
        '/': (context) => intro_page(),
        'Splash': (context) => Splash(),
        'home': (context) => home(),
      },
    ),
  ));
}
