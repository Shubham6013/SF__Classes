// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:straightforwardclasses/dashboard.dart';
import 'package:straightforwardclasses/screen/cuet/Test2.dart';
import 'package:straightforwardclasses/screen/cuet/dpe.dart';
import 'package:straightforwardclasses/screen/four.dart/fourhome.dart';
import 'package:straightforwardclasses/screen/four.dart/foursub.dart';
import 'package:straightforwardclasses/screen/notification/notification.dart';
import 'package:straightforwardclasses/screen/notification/notiscreen.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/bihar_teacher.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/subscription.dart';
import 'package:straightforwardclasses/screen/contact.dart';
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
import 'cuet/cuet.dart';

final List<String> imgList = [
  'assets/images/Head_Teacher.png',
  'assets/images/app.png',
  'assets/images/123.png',
  'assets/images/345.png',
  'assets/images/777.png',
  'assets/images/888.png',

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
    var collectionRef = FirebaseFirestore.instance.collection('users');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsCUET(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef =
        FirebaseFirestore.instance.collection('Delhi_Principal_Exam');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

Future<bool> checkIfDocExistsDEL(String docId) async {
  try {
    // Get reference to Firestore collection
    var collectionRef = FirebaseFirestore.instance.collection('DELED_BED');

    var doc = await collectionRef.doc(docId).get();
    return doc.exists;
  } catch (e) {
    throw e;
  }
}

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home> {
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
                  color: Color.fromARGB(255, 226, 197, 197),
                ),
                child: Image(image: AssetImage('assets/images/lg.png'))),
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
            // Container(
            //     child: Align(
            //         alignment: FractionalOffset.bottomCenter,
            //         child: Row(
            //           children: <Widget>[
            //             ExpandIcon(onPressed: onPressed))

            //             // Divider(),
            //             // ListTile(
            //             //     leading: Icon(Icons.settings),
            //             //     title: Text('Facebook')),
            //             // ListTile(
            //             //     leading: Icon(Icons.help), title: Text('Instagram'))
            //           ],
            //         ))),
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
      // backgroundColor: Color.fromARGB(255, 174, 232, 196),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
                child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                pageViewKey: const PageStorageKey<String>('carousel_slider'),
              ),
              items: imageSliders,
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 8),
            //   height: MediaQuery.of(context).size.height * 0.16,
            //   child: Text(
            //     'Categories',
            //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          shadowColor: Color.fromARGB(255, 255, 0, 0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/ignou.png',
                              )
                              //  Image.assets(
                              //  'https://straightforwardclasses.in/wp-content/uploads/2022/04/3-300x300.png'),
                              ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ignou()),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'IGNOU',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                VerticalDivider(width: 1.0),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          shadowColor: Color.fromARGB(255, 255, 0, 0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child:
                                  Image.asset('assets/images/headteacher.png')
                              //Image.network(
                              //'https://straightforwardclasses.in/wp-content/uploads/2022/04/4-300x300.png'),
                              ),
                        ),
                        onTap: () async {
                          String? k = myUid;
                          if (k == null) {
                            Fluttertoast.showToast(
                                msg: "ERROR : Try again later",
                                toastLength: Toast.LENGTH_SHORT);
                          } else {
                            bool docExists = await checkIfDocExists(myUid!);
                            String s = docExists.toString();
                            if (s == "true") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => biharTeacher()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => subscription()),
                              );
                            }
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bihar Teacher',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          shadowColor: Color.fromARGB(255, 255, 0, 0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: Image.asset('assets/images/dpe.png')
                              //Image.network(
                              //'https://straightforwardclasses.in/wp-content/uploads/2022/04/4-300x300.png'),
                              ),
                        ),
                        onTap: () async {
                          String? k = myUid;
                          if (k == null) {
                            Fluttertoast.showToast(
                                msg: "ERROR : Try again later",
                                toastLength: Toast.LENGTH_SHORT);
                          } else {
                            bool docExists = await checkIfDocExistsCUET(myUid!);
                            String s = docExists.toString();
                            if (s == "true") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => dpe()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => subscriptioncuet()),
                              );
                            }
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'UPSC Delhi Principal Exam',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                VerticalDivider(width: 1.0),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          shadowColor: Color.fromARGB(255, 255, 0, 0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: Image.asset('assets/images/del.png')
                              //Image.network(
                              //'https://straightforwardclasses.in/wp-content/uploads/2022/04/4-300x300.png'),
                              ),
                        ),
                        onTap: () async {
                          String? k = myUid;
                          if (k == null) {
                            Fluttertoast.showToast(
                                msg: "ERROR : Try again later",
                                toastLength: Toast.LENGTH_SHORT);
                          } else {
                            bool docExists = await checkIfDocExistsDEL(myUid!);
                            String s = docExists.toString();
                            if (s == "true") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => fourhome()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => foursub()),
                              );
                            }
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'D.EL.ED /\nB.E.D',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          shadowColor: Color.fromARGB(255, 255, 0, 0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: Image.asset('assets/images/soon.png')
                              //Image.network(
                              //'https://straightforwardclasses.in/wp-content/uploads/2022/04/4-300x300.png'),
                              ),
                        ),
                        onTap: () async {
                          // String? k = myUid;
                          // if (k == null) {
                          //   Fluttertoast.showToast(
                          //       msg: "ERROR : Try again later",
                          //       toastLength: Toast.LENGTH_SHORT);
                          // } else {
                          //   bool docExists = await checkIfDocExistsCUET(myUid!);
                          //   String s = docExists.toString();
                          //   if (s == "true") {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => dpe()),
                          //     );
                          //   } else {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => subscriptioncuet()),
                          //     );
                          //   }
                          // }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Coming Soon...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
                VerticalDivider(width: 1.0),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 10,
                          shadowColor: Color.fromARGB(255, 255, 0, 0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              decoration: BoxDecoration(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                              child: Image.asset('assets/images/soon.png')
                              //Image.network(
                              //'https://straightforwardclasses.in/wp-content/uploads/2022/04/4-300x300.png'),
                              ),
                        ),
                        onTap: () async {
                          // String? k = myUid;
                          // if (k == null) {
                          //   Fluttertoast.showToast(
                          //       msg: "ERROR : Try again later",
                          //       toastLength: Toast.LENGTH_SHORT);
                          // } else {
                          //   bool docExists = await checkIfDocExistsCUET(myUid!);
                          //   String s = docExists.toString();
                          //   if (s == "true") {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => dpe()),
                          //     );
                          //   } else {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => subscriptioncuet()),
                          //     );
                          //   }
                          // }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Coming Soon...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
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
