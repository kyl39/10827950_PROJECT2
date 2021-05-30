import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'signIn.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("INTRO TO SOFTWARE ENGINEERING",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  )),
              SizedBox(height: 20),
              Text("PROJECT 2",
                  style: TextStyle(color: Colors.black, fontSize: 30)),
              SizedBox(height: 20),
              Container(
                width: size.width * 0.8,
                height: size.width * 0.9,
                child: Lottie.asset(
                  "assets/lottie/user-profile.json",
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Container(
                  width: size.width * 0.8,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward, color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
