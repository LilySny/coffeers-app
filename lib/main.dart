import 'package:coffers_app/core/dependencies.dart';
import 'package:coffers_app/modules/home/view/pages/home_page.dart';
import 'package:coffers_app/shared/colors.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryDarkBrown,
      ),
      home: const HomePage(),
    );
  }
}
