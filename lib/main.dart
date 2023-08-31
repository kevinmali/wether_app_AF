import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Provider/themeprovider.dart';
import 'Views/Screens/Splace_screen.dart';
import 'Views/Screens/Wether_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider<themeprovider>(create: (context) => themeprovider()),
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: {
        '/': (context) => Splash(),
        'home': (context) => home(),
      },
    ),
  ));
}
