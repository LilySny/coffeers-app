import 'dart:developer';
import 'package:coffers_app/src/modules/home/view/widgets/home_custom_button_widget.dart';
import 'package:coffers_app/src/modules/recipes/view/pages/recipes_page.dart';
import 'package:coffers_app/src/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final channelName = 'com.example.coffers_app/coffees-location';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBrown,
      appBar: AppBar(
        backgroundColor: primaryDarkBrown,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: lightBrown),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: _content(),
        ),
      ),
    );
  }

  Widget _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/home-wallpaper.jpg"),
        const Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 35.0),
          child: Text(
            "Bem vindo ao Coffers App!",
            style: TextStyle(
                color: lightBrown, fontWeight: FontWeight.w600, fontSize: 26.0),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Text(
            "Aqui você pode encontrar receitas que usam café e as melhores cafeterias perto de você.",
            style: TextStyle(
              color: secondaryLightBrown,
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(
          height: 30.sp,
        ),
        HomeCustomButtonWidget(
            title: "Receitas",
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RecipesPage()))),
        const SizedBox(
          height: 15,
        ),
        HomeCustomButtonWidget(title: "Cafeterias", onPressed: accessLocation),
        SizedBox(
          height: 60.sp,
        ),
      ],
    );
  }

  Future accessLocation() async {
    try {
      final methodChannel = MethodChannel(channelName);
      final String result =
          await methodChannel.invokeMethod("coffees-location");
      log(result);
    } on PlatformException catch (err) {
      log("Error invoking method $err");
    }
  }
}
