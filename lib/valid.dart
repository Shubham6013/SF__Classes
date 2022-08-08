import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:straightforwardclasses/pages/login.dart';
import 'package:straightforwardclasses/pages/user/user_main.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';

class Valid extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final storage = new FlutterSecureStorage();

  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: "uid");
    if (value == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return
              // title: 'Flutter Firebase EMail Password Auth',
              // theme: ThemeData(
              //   primarySwatch: Colors.deepPurple,
              // ),
              // debugShowCheckedModeBanner: false,
              FutureBuilder(
                  future: checkLoginStatus(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> snapshot) {
                    if (snapshot.data == false) {
                      return Login();
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                          color: Colors.white,
                          child: Center(child: CircularProgressIndicator()));
                    }
                    return Home();
                  });
        });
  }
}
