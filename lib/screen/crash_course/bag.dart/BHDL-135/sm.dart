// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:straightforwardclasses/dashboard.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/ignou/assignmodel.dart';
import 'package:straightforwardclasses/screen/notification/notiscreen.dart';
import 'package:straightforwardclasses/screen/privacy.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'package:straightforwardclasses/screen/terms.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:url_launcher/url_launcher.dart';

class study_material_dpe extends StatefulWidget {
  @override
  _biharTeacherState createState() => _biharTeacherState();
}

class _biharTeacherState extends State<study_material_dpe> {
  final storage = new FlutterSecureStorage();
  late DatabaseReference _videoRef;
  @override
  void initState() {
    // ignore: deprecated_member_use
    final database = FirebaseDatabase();
    // ignore: deprecated_member_use
    _videoRef = database.reference().child('BHDL-135_Study_Material');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 57, 53),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Study Material"),
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
      backgroundColor: Color.fromARGB(255, 226, 197, 197),
      body: FirebaseAnimatedList(
        query: _videoRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          VideoModel videoModel =
              VideoModel.fromJson(json.decode(json.encode(snapshot.value)));
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 60.0,
                      color: Color.fromARGB(255, 238, 162, 75),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.library_books),
                          SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                videoModel.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Expanded(
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //
                  //         style: TextStyle(
                  //           fontSize: 17.5,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  onTap: () async {
                    if (await canLaunch(videoModel.url))
                      await launch(videoModel.url);
                  },
                )
              ],
            ),
          );
        },
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
}
