import 'dart:developer';
import 'package:coffers_app/modules/recipes/view/widgets/recipe_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const RecipeListWidget(),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  accessLocation();
                },
                child: const Text("Abrir Mapa")),
          )
        ],
      ),
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
