// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Scaffold(
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 33),
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/signup.svg",
                            width: 288,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: 266,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.purple[800],
                                  ),
                                  hintText: "Your Email :",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 23,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius: BorderRadius.circular(66),
                            ),
                            width: 266,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffix: Icon(
                                    Icons.visibility,
                                    color: Colors.purple[900],
                                  ),
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.purple[800],
                                    size: 19,
                                  ),
                                  hintText: "Password :",
                                  border: InputBorder.none),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.purple),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 106, vertical: 10)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(27))),
                            ),
                            child: Text(
                              "sign up",
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have account ?  "),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: Text(
                                  "log in",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 230,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 0.8,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  "OR",
                                  style: TextStyle(color: Colors.purple[900]),
                                ),
                                Expanded(
                                  child: Divider(
                                    thickness: 0.8,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.purple, width: 1)),
                                    child: SvgPicture.asset(
                                      "assets/icons/facebook.svg",
                                      color: Colors.purple[400],
                                      height: 27,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 22,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.purple, width: 1)),
                                    child: SvgPicture.asset(
                                      "assets/icons/google-plus.svg",
                                      color: Colors.purple[400],
                                      height: 27,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 22,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.purple, width: 1)),
                                    child: SvgPicture.asset(
                                      "assets/icons/twitter.svg",
                                      color: Colors.purple[400],
                                      height: 27,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: Image.asset(
                        "assets/images/signup_top.png",
                        width: 111,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/login_bottom.png",
                        width: 111,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
