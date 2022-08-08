// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:straightforwardclasses/screen/welcome.dart';

class splash extends StatefulWidget {
  @override
  _splash createState() => _splash();
}

class _splash extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
