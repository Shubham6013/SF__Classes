// // ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_print, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:straightforwardclasses/screen/signup.dart';
import 'package:url_launcher/url_launcher.dart';

import 'auth.dart';
import 'home.dart';

import 'home.dart';

class LoginScreeen extends StatefulWidget {
  @override
  _LoginScreeenState createState() => _LoginScreeenState();
}

class _LoginScreeenState extends State<LoginScreeen> {
  late Future<FirebaseApp> _firebaseApp;
  bool isLoggedIn = false;
  late String name;

  @override
  void initState() {
    super.initState();
    _firebaseApp = Firebase.initializeApp();
  }

  void _signOut() async {
    await FirebaseAuth.instance.signOut();
    setState(() {
      isLoggedIn = false;
      name = '';
    });
  }

  void _googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final signInAccount = await googleSignIn.signIn();

    final googleAccountAuthentication = await signInAccount!.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAccountAuthentication.accessToken,
        idToken: googleAccountAuthentication.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    if (FirebaseAuth.instance.currentUser != null) {
      print('Google Authentication Successful');

      print('${FirebaseAuth.instance.currentUser!.displayName} signed in.');

      setState(() {
        isLoggedIn = true;
        // userSetup();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
        name = FirebaseAuth.instance.currentUser!.displayName!;
      });
    } else {
      print('Unable to sign in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                child: CircularProgressIndicator(),
              );

            return ListView(
              padding: EdgeInsets.all(8.0),
              children: <Widget>[
                // logo
                Column(
                  children: [
                    SizedBox(height: 30),
                    Text('Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 60)),
                    SizedBox(height: 30),
                    GestureDetector(
                      child: Container(
                        child: Image.asset("assets/images/loginimg.jpg"),
                      ),
                    ),

                    SizedBox(height: 30),

                    isLoggedIn ? Text('$name signed in.') : Text(''),
                    // customButton(size, "Google", "assets/images/google.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          // margin: const EdgeInsets.only(left: 10.0),
                          // color: Color.fromARGB(255, 231, 91, 91),
                          // height: size.height / 3,
                          height: 50,
                          width: 50,
                          // width: size.width,
                          decoration: const BoxDecoration(
                            // color: Color.fromARGB(255, 231, 91, 91),
                            image: DecorationImage(
                                image: AssetImage("assets/images/google.png"),
                                // height: 150,
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Container(
                          // width: 50,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 231, 91, 91),
                                // padding: EdgeInsets.symmetric(
                                //     horizontal: 50, vertical: 20),
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            // onPressed: _googleSignIn, child: null,
                            onPressed: isLoggedIn ? _signOut : _googleSignIn,
                            child: isLoggedIn
                                ? Text('Sign out')
                                : Text('Sign In with Google Account'),
                            // ignore: prefer_const_constructors
                            // child: Text('Sign In with Google Account')
                            //   child: isLoggedIn
                            //       ? Text('Sign out')
                            //       : Text('Sign In with Google Account'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // SizedBox(
                //   height: 25,
                // ),
                // Text('Click here to login',
                //     style:
                //         TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'OR',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 11,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LoginForm(),
                ),

                SizedBox(height: 15),

                Row(
                  children: <Widget>[
                    SizedBox(width: 30),
                    Text('New here ? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, '/signup');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                      child: Text('Get Registered Now!!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 231, 91, 91),
                          )),
                    )
                  ],
                ),

                // Row(
                //   children: <Widget>[
                //     SizedBox(width: 30),
                //     Text('New here ? ',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 20)),
                //     GestureDetector(
                //       onTap: () {
                //         // Navigator.pushNamed(context, '/signup');
                //         Navigator.push(context,
                //             MaterialPageRoute(builder: (context) => Signup()));
                //       },
                //       child: Text('Get Registered Now!!',
                //           style: TextStyle(
                //               fontSize: 20,
                //               color: Color.fromARGB(255, 14, 13, 13))),
                //     )
                //   ],
                // ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _makingPhoneCall,
        backgroundColor: Color.fromARGB(255, 231, 91, 91),
        tooltip: 'Increment',
        child: const Icon(Icons.phone),
      ),
    );
  }
}

_makingPhoneCall() async {
  const url = 'tel:+918800740094';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget customButton(Size size, String title, String path) {
  return Container(
    height: size.height / 14,
    width: size.width / 2.3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height / 25,
          width: size.height / 25,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        )
      ],
    ),
  );
}

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            // initialValue: 'Input text',
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(100.0),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 231, 91, 91),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
