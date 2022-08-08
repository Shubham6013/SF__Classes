import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confetti/confetti.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/bihar_teacher.dart';
import 'package:straightforwardclasses/screen/home.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final myUid = user?.uid;

class details extends StatefulWidget {
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  static const platform = const MethodChannel("razorpay_flutter");

  late String name = "";
  String phn = "";
  String email = "";
  bool paymentDone = false;

  late ConfettiController _centerController;

  @override
  void initState() {
    super.initState();

    // initialize confettiController
    _centerController =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    // dispose the controller
    _centerController.dispose();
    super.dispose();
  }

  final cities = FirebaseFirestore.instance.collection("app_users");
  late final data = <String, dynamic>{
    "Name": name,
    "Phone Number": phn,
    "Email": email
  };

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 197, 197),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 80,
                    child: Text(
                      'Welcome!',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            // initialValue: 'Your Good Name',

                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Phone Number';
                              }
                              return null;
                            },
                            // initialValue: 'Phone Number',
                            decoration: InputDecoration(
                              // fillColor: Colors.white,
                              labelText: 'Phone Number (eg. +9176950****)',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              phn = value;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                            // initialValue: 'Email',
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _centerController.play();
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text(
                                //       'Welcome',
                                //       style: TextStyle(
                                //         fontFamily: 'Poppins',
                                //       ),
                                //     ),
                                //     backgroundColor: Colors.green,
                                //   ),
                                // );
                                try {
                                  // _razorpay.open(options);
                                  cities.doc(myUid).set(data);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ),
                                  );
                                  Stack(
                                    children: <Widget>[
                                      // align the confetti on the screen
                                      Align(
                                        alignment: Alignment.center,
                                        child: ConfettiWidget(
                                          confettiController: _centerController,
                                          blastDirection: pi / 2,
                                          maxBlastForce: 5,
                                          minBlastForce: 1,
                                          emissionFrequency: 0.03,

                                          // 10 paticles will pop-up at a time
                                          numberOfParticles: 10,

                                          // particles will pop-up up
                                          gravity: 0,
                                        ),
                                      ),
                                    ],
                                  );
                                } catch (e) {
                                  debugPrint('Error: e');
                                }
                              }
                            },
                            // onPressed: openCheckout,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 238, 162, 75)),
                          )
                        ],
                      ))
                ],
              )
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //   ElevatedButton(onPressed: openCheckout, child: Text('Open'))
                  // ])
                  ),
            ),
          ),
        ),
      ),
    );
  }

  void openCheckout() async {
    try {
      // _razorpay.open(options);
      cities.doc(myUid).set(data);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      debugPrint('Error: e');
    }
  }
}
