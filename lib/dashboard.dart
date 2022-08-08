import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/bihar_teacher.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/notification/notiscreen.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/subscription.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/video.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/video_screen.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/privacy.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'package:straightforwardclasses/screen/terms.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:straightforwardclasses/pages/login.dart';
import 'package:straightforwardclasses/pages/user/user_main.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final myUid = user?.uid;
final storage = new FlutterSecureStorage();

late String name = "";
late String phone = "";
late String email = "";

class dash extends StatefulWidget {
  const dash({Key? key}) : super(key: key);

  @override
  State<dash> createState() => _dashState();
}

class _dashState extends State<dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 57, 53),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dashboard"),
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
            Container(
              margin: EdgeInsets.only(top: 18),
              height: 40,
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
              width: 150,
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(top: 20),
            //   height: 80,
            //   child: Text(
            //     'Select any option.',
            //     style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/pp.png"),
              backgroundColor: Color.fromARGB(255, 226, 197, 197),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                        'My Profile',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () async {
                  try {
                    // _razorpay.open(options);
                    DocumentSnapshot variable = await FirebaseFirestore.instance
                        .collection('app_users')
                        .doc(myUid)
                        .get();
                    name = variable['Name'];
                    email = variable['Email'];
                    phone = variable['Phone Number'];
                  } catch (e) {
                    debugPrint('Error: e');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => dashboard()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
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
}

void openCheckout() async {
  try {
    // _razorpay.open(options);
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('app_users')
        .doc(myUid)
        .get();
    name = variable['Name'];
    email = variable['Email'];
    phone = variable['Phone Number'];
  } catch (e) {
    debugPrint('Error: e');
  }
}

class dashboard extends StatefulWidget {
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<dashboard> {
  static const platform = const MethodChannel("razorpay_flutter");

  bool paymentDone = false;

  @override
  void initState() {
    // openCheckout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                // ElevatedButton(
                //   onPressed: openCheckout,
                //   style: ElevatedButton.styleFrom(
                //     elevation: 0.0,
                //     shadowColor: Colors.transparent,
                //     primary:
                //         Color.fromARGB(255, 255, 255, 255), // Background color
                //   ),
                //   child: null,
                // ),
                SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/images/pp.png"),
                  backgroundColor: Color.fromARGB(255, 226, 197, 197),
                  // ba
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Sacramento',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                // Text(
                //   "Flutter Developer",
                //   style: TextStyle(fontSize: 15, fontFamily: 'EBGaramond'),
                // ),
                SizedBox(
                  height: 10,
                  width: 150,
                  child: Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  color: Color.fromARGB(255, 238, 162, 75),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: Text(
                      phone,
                      style: TextStyle(
                        fontFamily: 'Sacramento',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  color: Color.fromARGB(255, 238, 162, 75),
                  child: ListTile(
                    leading: Icon(
                      Icons.mail,
                      color: Colors.black,
                    ),
                    title: Text(
                      email,
                      style: TextStyle(
                        fontFamily: 'Sacramento',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () async => {
                    await FirebaseAuth.instance.signOut(),
                    await storage.delete(key: "uid"),
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                        (route) => false)
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: 'Sacramento',
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
            ),
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
      ),
    );
  }
}
