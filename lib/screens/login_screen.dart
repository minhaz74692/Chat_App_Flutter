//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:quick_chat/components/reusable_button.dart';
import 'package:quick_chat/constants.dart';
import 'package:quick_chat/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kInputDecoration.copyWith(hintText: "Enter your Email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                textAlign: TextAlign.center ,
                onChanged: (value) {
                  password = value;
                },
              decoration: kInputDecoration.copyWith(hintText: "Enter Password")
            ),
            SizedBox(
              height: 24.0,
            ),
            ReusableButton(
                buttonText: 'Log In',
                buttonColor: Colors.blueAccent,
                onPress: (){
                  Navigator.pushNamed(context, ChatScreen.id);
                },
            ),
          ],
        ),
      ),
    );
  }
}
