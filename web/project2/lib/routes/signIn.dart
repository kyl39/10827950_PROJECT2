import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project2/firebase/services.dart';
import 'signup.dart';
import 'spinkit.dart';
import 'dashboard.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final email = new TextEditingController();
  final password = new TextEditingController();

  final AuthService _auth = new AuthService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                          "SIGN IN",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: email,
                                validator: (val) =>
                                    val.isEmpty ? 'Email is required' : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
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
                            SizedBox(height: 20),

                            //Password Field
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: password,
                                validator: (val) =>
                                    val.isEmpty ? 'Password is required' : null,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
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
                            SizedBox(height: 20),

                            //Sign In Button
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  dynamic result = await _auth.signIn(
                                      email.text, password.text);
                                  if (result != null) {
                                    Navigator.pushReplacement(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) => Dashboard()));
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
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
                                          "SIGN IN",
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
                            SizedBox(height: 20),

                            //Alternative
                            Text(
                              "OR",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[600],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Sign In With",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),

                            Container(
                              width: 50,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.black,
                              ),
                            ),
                            //Twitter Lottie
                            Container(
                              width: double.infinity,
                              height: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: size.width * 0.45,
                                    height: 90,
                                    child: Lottie.asset(
                                        "assets/lottie/social-media2.json"),
                                  ),

                                  //Facebook Lottie
                                  Container(
                                    width: size.width * 0.45,
                                    height: 90,
                                    child: Lottie.asset(
                                        "assets/lottie/social-media1.json"),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: <Widget>[
                                  Text("Don't have an account?"),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: FlatButton(
                                      child: Text(
                                        "Register Here",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp()));
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
