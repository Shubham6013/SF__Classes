import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:straightforwardclasses/dashboard.dart';
import 'package:straightforwardclasses/pages/login.dart';
import 'package:straightforwardclasses/screen/notification/notiscreen.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'package:url_launcher/url_launcher.dart';

import '../about_us.dart';
import '../contact.dart';
import '../home.dart';
import '../privacy.dart';
import '../terms.dart';

/// Represents Homepage for Navigation
class councelling extends StatefulWidget {
  @override
  _councelling createState() => _councelling();
}

class _councelling extends State<councelling> {
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 229, 57, 53),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Straightforward Classes"),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.05,
              child: Text(
                'Counselling',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling0.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Text(
                    "IGNOU Assignment: Tips to score 90 percent",
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                  )),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/H715RjMimeM'))
                  await launch('https://youtu.be/H715RjMimeM');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling1.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Text(
                    "IGNOU: Master of science counselling and family therapy-course code-MSCCFT",
                    // overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17.5,
                    ),
                  )),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/DIRUuHq2gb8'))
                  await launch('https://youtu.be/DIRUuHq2gb8');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling2.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "IGNOU: Master of Arts (Folklore and Culture Studies)",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/xwGxzof_8ts'))
                  await launch('https://youtu.be/xwGxzof_8ts');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling3.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "IGNOU: Master of Science (Environmental Science)",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/xjbWOpMTzsE'))
                  await launch('https://youtu.be/xjbWOpMTzsE');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling4.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "इग्नू द्वारा नए पीजी कोर्स ज्योतिष में एमए",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/BJDckPu6b_g'))
                  await launch('https://youtu.be/BJDckPu6b_g');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling5.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "IGNOU DECE REGULAR CLASS BY STRAIGHTFORWARD CLASSES DELHI",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/sDUUGvi5bhY'))
                  await launch('https://youtu.be/sDUUGvi5bhY');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling6.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "4 सबसे अधिक सैलरी वाले IGNOU PG DIPLOMA COURSES",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/YW10dgd61Xo'))
                  await launch('https://youtu.be/YW10dgd61Xo');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling7.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "IGNOU: 4 CERTIFICATE COURSES JIS SE GHAR BATHEY KAMAYE LAKHO",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/vpRCNUmWaw8'))
                  await launch('https://youtu.be/vpRCNUmWaw8');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling8.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "IGNOU : राजनीति विज्ञान ऑनर्स तृतीय वर्ष विषय चयन परामर्श",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/HFXxxwS4jQU'))
                  await launch('https://youtu.be/HFXxxwS4jQU');
              },
            ),
            InkWell(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: 170,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/councelling9.png')),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "IGNOU BAG 5th Semester Subject Selection.",
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 17.5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
              onTap: () async {
                if (await canLaunch('https://youtu.be/FKkRXJk-Zt0'))
                  await launch('https://youtu.be/FKkRXJk-Zt0');
              },
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
