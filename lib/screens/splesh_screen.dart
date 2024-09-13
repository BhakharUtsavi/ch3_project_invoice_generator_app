import 'dart:async';

import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed("home");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                "https://static.vecteezy.com/system/resources/previews/010/482/794/non_2x/kitchen-chef-logo-design-template-vector.jpg"),
          )),
    );
  }
}
