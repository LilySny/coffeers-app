import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
