import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:straightforwardclasses/dashboard.dart';
import 'package:straightforwardclasses/screen/about_us.dart';
import 'package:straightforwardclasses/screen/bihar%20teacher/subscription.dart';
import 'package:straightforwardclasses/screen/contact.dart';
import 'package:straightforwardclasses/screen/crash_course/carsh_course.dart';
import 'package:straightforwardclasses/screen/cuet/cuet.dart';
import 'package:straightforwardclasses/screen/home.dart';
import 'package:straightforwardclasses/screen/ignou.dart';
import 'package:straightforwardclasses/screen/privacy.dart';
import 'package:straightforwardclasses/screen/refund.dart';
import 'package:straightforwardclasses/screen/terms.dart';
import 'package:url_launcher/url_launcher.dart';

import '../notification/notiscreen.dart';

final FirebaseAuth auth = FirebaseAuth.instance;
final User? user = auth.currentUser;
final myUid = user?.uid;

class subscriptioncuet extends StatefulWidget {
  @override
  _subscriptionState createState() => _subscriptionState();
}

class _subscriptionState extends State<subscriptioncuet> {
  static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;
  late String name = "";
  String phone = "";
  String email = "";
  final cities = FirebaseFirestore.instance.collection("Delhi_Principal_Exam");
  late final data = <String, dynamic>{
    "Name": name,
    "Phone Number": phone,
    "Email": email
  };

  f() async {
    try {
      // _razorpay.open(options);
      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('app_users')
          .doc(myUid)
          .get();
      name = variable['Name'];
      email = variable['Email'];
      phone = variable['Phone Number'];
      print("tapped" + name + "-" + phone + "-" + email);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229, 57, 53),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Straightforward Classes")],
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
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 40,
                child: Text(
                  'UPSC Delhi Principal Exam',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 40,
                child: Text(
                  '₹4999',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset('assets/images/1.png'),
              // Image.network(
              // 'https://firebasestorage.googleapis.com/v0/b/straightforwardclasses-2779a.appspot.com/o/Head%20Teacher.jpg?alt=media&token=792c7ca4-fc4d-4022-a14f-8959c4dd1e62'),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 238, 162, 75)),
                  onPressed: openCheckout,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'PAY NOW',
                      style: TextStyle(
                        fontFamily: 'Sacramento',
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              SizedBox(
                height: 50,
              ),
            ],
          )
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //   ElevatedButton(onPressed: openCheckout, child: Text('Open'))
              // ])
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

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_PzhMLswWdpxOrd',
      'amount': 499900,
      'name': name,
      'description': 'Payment',
      'prefill': {'contact': phone, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('app_users')
          .doc(myUid)
          .get();
      name = variable['Name'];
      email = variable['Email'];
      phone = variable['Phone Number'];
      // print("WORKING" + name + "-" + phone + "-" + email);
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
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
    // openCheckoutt();
    cities.doc(myUid).set(data);

    print('Success Response: $response');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => cuet()),
      (Route<dynamic> route) => false,
    );
    Fluttertoast.showToast(msg: "SUCCESS!!!! ", timeInSecForIosWeb: 60);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    // Fluttertoast.showToast(
    //     msg: "EXTERNAL_WALLET: " + response.walletName!,
    //     toastLength: Toast.LENGTH_SHORT);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const platform = const MethodChannel("razorpay_flutter");

  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Razorpay Sample App'),
        ),
        body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              ElevatedButton(onPressed: openCheckout, child: Text('Open'))
            ])),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print('Success Response: $response');
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }
}

void f() async {}
