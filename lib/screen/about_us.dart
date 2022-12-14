// import 'package:flutter/material.dart';

// /// Represents Homepage for Navigation
// class privacy extends StatefulWidget {
//   @override
//   _privacy createState() => _privacy();
// }

// class _privacy extends State<privacy> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Center(
//             child: Text('sdasjdsnd'
//                 // 'At certain points in the straightforwardclassescom website navigation, you may be asked to share your email address or other personal identifying information with us. As provided in these Terms and Conditions, such information will never be distributed to a third party and it will never be publicly visible without your express written consent. Your email address will only be used to send you the straightforwardclasses.com newsletter and/or to alert you to any information that you have specifically requested you be notified about. Use of the Site The www.straightforwardclasses.com website hosts a blog and a public forum, both of which are equipped with commenting facilities. While we invite you to share your opinions and questions in this way, they must not be used to distribute spam messages, post commercial advertisements, or spread links to malicious or dangerous websites. We do retain the right to moderate any comment or written content submitted to the MySite.com website and to remove any content we deem to have violated our policies. Disclaimer All of the content contained on the straightforwardclasses.com is edited, checked, and verified for accuracy as much as it is possible to do so. However, we cannot guarantee either its accuracy or the safety of any external links it might contain. MySite.com, as well as its owners, affiliates, and contributing authors can therefore not be held responsible for any problems or damage that occurs as a result of making use of material contained on our site. Copyright Any and all of the content presented on the straightforwardclasses.com website is, unless explicitly stated otherwise, subject to a copyright held by www.straightforwardclasses.com. It is permissible to link to content from this site as long as the original source is clearly stated, but the wholesale reproduction or partial modification of content is not permitted. Exceptions are granted only if you receive prior written consent from straightforwardclasses.com. Contacts Should you have any further questions, concerns, or queries about these Terms and Conditions, or if you encounter difficulties while navigating and using the site, please contact info@straightforwardclasses.com.',
//                 )),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:straightforwardclasses/dashboard.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/privacy.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'package:straightforwardclasses/screen/terms.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/login.dart';
import 'home.dart';
import 'notification/notiscreen.dart';

// ignore: use_key_in_widget_constructors
class about extends StatefulWidget {
  @override
  _aboutScreenState createState() => _aboutScreenState();
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

class _aboutScreenState extends State<about> {
  final storage = new FlutterSecureStorage();
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
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 50,
              child: Text(
                'About Us',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  'StraightforwardClasses are Industry Experts in the field of Higher Education. We have had the privilege of mentoring more than a million students for the past 13 years to seek admission and crack college examinations of different universities like IGNOU, DU, JAMIA, BHU etc.\n\n\nOur Unique Offerings:- \n * Curriculum-based crash course to crack the exam in the optimal period.\n * Learn Online at Your Own Pace Pre-recorded content to learn anywhere-anytime at your convenience.\n * Learn from Industry Experts Learn the tips and tricks from industry leaders who have an excellent track record of highest selections.',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),

      //),
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
