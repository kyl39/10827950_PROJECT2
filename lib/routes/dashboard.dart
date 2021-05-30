import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_2/firebase/services.dart';
import 'package:provider/provider.dart';
import 'signIn.dart';
import 'spinkit.dart';
import 'package:lottie/lottie.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final AuthService _auth = new AuthService();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return isLoading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              title: Text("Project 2"),
            ),
            body: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: size.width * 0.7,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(),
                    child: Container(),
                  ),
                ),
                Container(
                  width: size.width * 0.9,
                  height: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        "Signed In",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[600],
                        ),
                      ),
                      Center(
                        child: RaisedButton(
                          child: Text("Sign Out",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            setState(() {
                              isLoading = false;
                            });
                            await _auth.signOut();
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => SignIn()));
                          },
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ));
  }
}
