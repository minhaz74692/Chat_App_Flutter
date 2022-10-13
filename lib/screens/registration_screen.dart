//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:quick_chat/constants.dart';
import 'package:quick_chat/screens/welcome_screen.dart';

import '../components/reusable_button.dart';
import '/firebase_options.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
// );

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
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
            SizedBox(
              height: 200.0,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset('images/logo.png'),
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
              decoration: kInputDecoration.copyWith(hintText: "Enter Your Email")
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
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              onPress: () async{

                try{
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  print(email + password);

                  void didPushButton() {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                  didPushButton();

                }catch(e){
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
