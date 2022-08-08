// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:straightforwardclasses/quiz/screens/main_menu.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/ignou/assignments.dart';
import 'package:straightforwardclasses/screen/ignou/councelling.dart';
import 'package:straightforwardclasses/screen/privacy.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'package:straightforwardclasses/screen/terms.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../dashboard.dart';
import 'notification/notiscreen.dart';

// ignore: use_key_in_widget_constructors
class quiz extends StatefulWidget {
  @override
  _quizScreenState createState() => _quizScreenState();
}

class CustomBorder {
  static var enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.grey));

  static var focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: ThemeData.light().primaryColor, width: 1));

  static var errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.red, width: 1));
}

class _quizScreenState extends State<quiz> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
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
      backgroundColor: Color.fromARGB(255, 226, 197, 197),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 1',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 2',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 3',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 4',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 5',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 6',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 7',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 8',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 9',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
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
                        width: 30,
                      ),
                      Text(
                        'Mock Test 10',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainMenu()),
                  );
                },
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: InkWell(
            //     child: Container(
            //       height: 80.0,
            //       color: Color.fromARGB(255, 238, 162, 75),
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             width: 20,
            //           ),
            //           Icon(Icons.library_books),
            //           SizedBox(
            //             width: 30,
            //           ),
            //           Text(
            //             'Quiz',
            //             style:
            //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => MainMenu()),
            //       );
            //     },
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.all(10.0),
            // //   child: InkWell(
            // //     child: Container(
            // //       height: 80.0,
            // //       color: Color.fromARGB(255, 238, 162, 75),
            // //       child: Row(
            // //         children: [
            // //           SizedBox(
            // //             width: 20,
            // //           ),
            // //           Icon(Icons.library_books),
            // //           SizedBox(
            // //             width: 30,
            // //           ),
            // //           Text(
            // //             'Time Based Test',
            // //             style:
            // //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // //           ),
            // //         ],
            // //       ),
            // //     ),
            // //     onTap: () {
            // //       Navigator.push(
            // //         context,
            // //         MaterialPageRoute(builder: (context) => councelling()),
            // //       );
            // //     },
            // //   ),
            // // ),
            // // SizedBox(
            // //   height: 20,
            // // ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: InkWell(
            //     child: Container(
            //       height: 80.0,
            //       color: Color.fromARGB(255, 238, 162, 75),
            //       child: Row(
            //         children: [
            //           SizedBox(
            //             width: 20,
            //           ),
            //           Icon(Icons.library_books),
            //           SizedBox(
            //             width: 30,
            //           ),
            //           Text(
            //             'Notes',
            //             style:
            //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //           ),
            //         ],
            //       ),
            //     ),
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => councelling()),
            //       );
            //     },
            //   ),
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
}
