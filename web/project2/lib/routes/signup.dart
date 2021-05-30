import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/firebase/services.dart';
import 'signIn.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';
import 'spinkit.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = new AuthService();
  final _formKey = GlobalKey<FormState>();

  //Text Editing Controllers
  final fname = new TextEditingController();
  final lname = new TextEditingController();
  final email = new TextEditingController();
  final pass1 = new TextEditingController();
  final pass2 = new TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = Provider.of<FirebaseUser>(context);

    return SafeArea(
      child: isLoading
          ? Loading()
          : Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //First Name
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: fname,
                                validator: (val) => val.isEmpty
                                    ? 'First name is required'
                                    : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "First Name",
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),

                            //Last Name
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: lname,
                                validator: (val) => val.isEmpty
                                    ? 'Last name is required'
                                    : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person, size: 30),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),

                            //Email
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: email,
                                validator: (val) =>
                                    val.isEmpty ? 'E-mail is required' : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email, size: 30),
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),

                            //Password Field
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: pass1,
                                validator: (val) =>
                                    val.isEmpty ? 'Password is required' : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),

                            //Confirm password
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: pass2,
                                validator: (val) => val.isEmpty
                                    ? 'This field is required'
                                    : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: "Confrim Password",
                                  labelStyle: TextStyle(color: Colors.black),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[100],
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.deepPurple[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),

                            //Sign Up Button
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  if (pass1.text == pass2.text) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    //register user
                                    dynamic result = await _auth.register(
                                        email.text, pass1.text);
                                    //Store details
                                    if (result != null) {
                                      await _auth.userInfo(
                                          fname.text, lname.text);
                                      Navigator.pushReplacement(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  Dashboard()));
                                    } else {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "SIGN UP",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(Icons.exit_to_app,
                                            color: Colors.white, size: 30),
                                      ],
                                    ),
                                  ),
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Already have an account?"),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: FlatButton(
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignIn()));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
