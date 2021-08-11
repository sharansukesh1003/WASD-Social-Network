import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_custom_ui/constants/constants.dart';
import 'package:flutter_instagram_custom_ui/views/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

ConstantColors constantColors = ConstantColors();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.secondaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(children: <Widget>[
                  Image(
                    image: AssetImage(
                      'assets/images/login_background.jpg',
                    ),
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Opacity(
                    opacity: 0.3,
                    child: Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'W',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ASD.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white24),
                    hintText: 'Username',
                    prefixIcon: Icon(
                      Icons.account_circle,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.white24),
                    hintText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HomeScreen(),
                  ),
                ),
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(children: <Widget>[
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Divider(
                          thickness: 1.0,
                          color: Colors.white,
                          height: 10,
                        )),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  Expanded(
                    child: new Container(
                      margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.white,
                        height: 10,
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't remember your password? ",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    "Reset Password.",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
