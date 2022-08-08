// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:straightforwardclasses/dashboard.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/bihar_teacher.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/subscription.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BAVAE-181/BEVAE-181.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BEGAE-182/BEGAE-182.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BEGLA-135/BEGLA-135.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BHDAE-182/BHDAE-182.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BHDL-135/BHDL-135.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BHIC-131/BHIC-131.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BHIE-141/BHIE-141.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BHIE-143/BHIE-143.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BHIE-145/BHIE-145.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BPSC-131/BPSC-131.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BPSC-187/BPSC-187.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BSOS-184/BSOS-184.dart';
import 'package:straightforwardclasses/screen/crash_course/bag.dart/BSOS-185/BSOS-185.dart';
import 'package:straightforwardclasses/screen/crash_course/carsh_course.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/ignou.dart';
import 'package:straightforwardclasses/screen/privacy.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'package:straightforwardclasses/screen/terms.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:straightforwardclasses/pages/login.dart';
import 'package:straightforwardclasses/pages/user/change_password.dart';
import 'package:straightforwardclasses/pages/user/dashboard.dart';
import 'package:straightforwardclasses/pages/user/profile.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/privacy.dart';
import 'package:straightforwardclasses/screen/terms.dart';
import 'package:url_launcher/url_launcher.dart';

import '../notification/notiscreen.dart';
import 'bag.dart/BHDS-184/BHDS-184.dart';

final List<String> imgList = [
  'assets/images/Head_Teacher.png',
  'assets/images/ignou.png',
  'assets/images/headteacher.png',
  'assets/images/cuet.png',
  // 'https://straightforwardclasses.in/wp-content/uploads/2022/04/5-300x300.png',
  // 'https://straightforwardclasses.in/wp-content/uploads/2022/04/4-300x300.png',
  // 'https://straightforwardclasses.in/wp-content/uploads/2022/04/6-removebg-preview-300x300.png',
  // 'https://straightforwardclasses.in/wp-content/uploads/2022/04/7-removebg-preview.png',
  // 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final myUid = user?.uid;

Future<bool> checkIfDocExists(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BAVAE-181');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBHDL135(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHDL-135');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsone(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHDL-135');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBEGLA135(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BEGLA-135');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBHIC131(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHIC-131');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBPSC131(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BPSC-131');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBEGAE182(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BEGAE-182');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBHDAE182(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHDAE-182');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBSOS184(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BSOS-184');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBHDS184(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHDS-184');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBHIE141(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHIE-141');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBHIE143(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHIE-143');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBHIE145(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BHIE-145');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBSOS185(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BSOS-185');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsBPCS187(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('BPCS-187');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

// ignore: use_key_in_widget_constructors
class carsh_course extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<carsh_course> {
  List<Widget> _items = [
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Profile',
    ),
    Text(
      'Index 2: Shop',
    ),
    Text(
      'Index 3: Shop',
    ),
  ];
  int _selectedIndex = 0;

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: const [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          // child: Text(
                          //   'No. ${imgList.indexOf(item)} image',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20.0,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ),
                      ),
                    ],
                  )),
            ),
          ))
      .toList();

  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    Future<String> u;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 57, 53),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Straightforward Classes"),
            // ElevatedButton(
            //   onPressed: () async => {
            //     await FirebaseAuth.instance.signOut(),
            //     await storage.delete(key: "uid"),
            //     Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Login(),
            //         ),
            //         (route) => false)
            //   },
            //   child: Text('Logout'),
            //   style: ElevatedButton.styleFrom(
            //       primary: Color.fromARGB(255, 238, 162, 75)),
            // )
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 57, 53),
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Dashboard'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => dash()),
                );
              },
            ),
            InkWell(
              child: ListTile(
                title: const Text('Ignou Student Zone'),
              ),
              onTap: () async {
                if (await canLaunch(
                    'https://admission.ignou.ac.in/changeadmdata/admissionstatusnew.asp'))
                  await launch(
                      'https://admission.ignou.ac.in/changeadmdata/admissionstatusnew.asp');
              },
            ),
            InkWell(
              child: ListTile(
                title: const Text('Books & Guess Paper'),
              ),
              onTap: () async {
                if (await canLaunch('http://straightforwardpublishers.com/'))
                  await launch('http://straightforwardpublishers.com/');
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => about()),
                );
              },
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => privacy()),
                );
              },
            ),
            ListTile(
              title: const Text('Terms of use'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => terms()),
                );
              },
            ),
            ListTile(
              title: const Text('Cancellation/Refund Policy'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => refund()),
                );
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => contact()),
                );
              },
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //     backgroundColor: Color.fromRGBO(37, 40, 45, 255),
      //     title: Row(
      //       children: [
      //         Text(
      //           "Straightforward Classes",
      //           style: const TextStyle(
      //             color: Colors.white,
      //           ),
      //         ),
      //       ],
      //     )
      //     // ignore: prefer_const_constructors

      //     ),
      backgroundColor: Color.fromARGB(255, 226, 197, 197),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 197, 197),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Color.fromARGB(255, 238, 162, 75),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              DropdownButton(
                                // value: _selectedGender,
                                items: _dropDownItem(),
                                onChanged: (value) async {
                                  switch (value) {
                                    case "BEVAE-181":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHDL135(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => one()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ones()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BHDL-135":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHDL135(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => five()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => fives()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BEGLA-135":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBEGLA135(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => three()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => threes()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BHIC-131":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHIC131(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => seven()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => sevens()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BPSC-131":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBPSC131(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => eleven()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    elevens()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BEGAE-182":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBEGAE182(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => two()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => twos()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BHDAE-182":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHDAE182(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => four()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => fours()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BSOS-184":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBSOS184(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    thirteen()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    thirteens()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BHDS-184":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHDS184(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => six()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => sixs()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BHIE-141":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHIE141(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => eight()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => eights()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BHIE-143":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHIE143(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => nine()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => nines()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BHIE-145":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBHIE145(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => tenn()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => tenns()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BSOS-185":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBSOS185(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    fourteen()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    fourteens()),
                                          );
                                        }
                                      }
                                      break;
                                    case "BPCS-187":
                                      String? k = myUid;
                                      if (k == null) {
                                        Fluttertoast.showToast(
                                            msg: "ERROR : Try again later",
                                            toastLength: Toast.LENGTH_SHORT);
                                      } else {
                                        bool docExists =
                                            await checkIfDocExistsBPCS187(
                                                myUid!);
                                        String s = docExists.toString();
                                        if (s == "true") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => twelve()),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    twelves()),
                                          );
                                        }
                                      }
                                      break;
                                  }
                                },
                                hint: Text(
                                  '1. BAG/BAG(H)',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.5,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // child:
                        ),
                      ),
                    ),
                  ],
                ),
                // child: Image.asset('assets/images/ignou.png')
                //  Image.assets(
                //  'https://straightforwardclasses.in/wp-content/uploads/2022/04/3-300x300.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 197, 197),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Color.fromARGB(255, 238, 162, 75),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              DropdownButton(
                                // value: _selectedGender,
                                items: _dropDownItemComingSoon(),
                                onChanged: (value) async {
                                  switch (value) {
                                  }
                                },
                                hint: Text(
                                  '2. B.Com/B.Com(H)',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.5,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // child:
                        ),
                      ),
                    ),
                  ],
                ),
                // child: Image.asset('assets/images/ignou.png')
                //  Image.assets(
                //  'https://straightforwardclasses.in/wp-content/uploads/2022/04/3-300x300.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 197, 197),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Color.fromARGB(255, 238, 162, 75),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              DropdownButton(
                                // value: _selectedGender,
                                items: _dropDownItemComingSoon(),
                                onChanged: (value) async {
                                  switch (value) {
                                    case "BEVAE-181":
                                  }
                                },
                                hint: Text(
                                  '3. DIPLOMA/OTHERS',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.5,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // child:
                        ),
                      ),
                    ),
                  ],
                ),
                // child: Image.asset('assets/images/ignou.png')
                //  Image.assets(
                //  'https://straightforwardclasses.in/wp-content/uploads/2022/04/3-300x300.png'),
              ),
            ),

            // SizedBox(
            //   height: 10,
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 0.05),
            ),
            Padding(
              padding: const EdgeInsets.all(7.5),
              child: IconButton(
                icon: Icon(Icons.home),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.5),
              child: IconButton(
                icon: Icon(Icons.notifications),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => noti()),
                  );
                },
              ),
            ),
            //account_circle
            Padding(
              padding: const EdgeInsets.all(7.5),
              child: IconButton(
                icon: Icon(Icons.account_circle),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dash()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0.05),
            ),
          ],
        ),
        color: Color.fromARGB(255, 229, 57, 53),
      ),
    );
  }

  List<DropdownMenuItem<String>> _dropDownItem() {
    List<String> ddl = [
      "BEVAE-181",
      "BHDL-135",
      "BEGLA-135",
      "BHIC-131",
      "BPSC-131",
      "BEGAE-182",
      "BHDAE-182",
      "BSOS-184",
      "BHDS-184",
      "BHIE-141",
      "BHIE-143",
      "BHIE-145",
      "BSOS-185",
      "BPCS-187"
    ];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: 'Poppins',
                ),
              ),
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _dropDownItemComingSoon() {
    List<String> ddl = ["Coming Soon :)"];
    return ddl
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontFamily: 'Poppins', fontSize: 17),
              ),
            ))
        .toList();
  }

  Widget _showBottomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Color.fromARGB(255, 229, 57, 53),
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Bookmark',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color.fromARGB(255, 238, 162, 75),
      unselectedItemColor: Colors.grey,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
