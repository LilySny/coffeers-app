import 'package:coffers_app/src/core/dependencies.dart';
import 'package:coffers_app/src/modules/home/view/pages/home_page.dart';
import 'package:coffers_app/src/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Coffeers App',
          theme: ThemeData(
            primaryColor: primaryDarkBrown,
          ),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
      child: const HomePage(),
    );
  }
}
