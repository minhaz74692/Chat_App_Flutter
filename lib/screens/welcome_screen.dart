//ignore_for_file: prefer_const_constructors
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quick_chat/components/reusable_button.dart';
import 'package:quick_chat/screens/login_screen.dart';
import 'package:quick_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 60,
                    child: Image(image: AssetImage('images/logo.png'),),
                  ),
                ),
                SizedBox(
                  child: DefaultTextStyle(
                    style: TextStyle(color:
                        Colors.black87,
                        fontSize: 45,
                        fontWeight: FontWeight.w900
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                            "Quick Chat",
                            speed: Duration(milliseconds: 200),
                        ),
                      ],
                      totalRepeatCount: 1,
                      // pause: const Duration(seconds: 10),
                      // stopPauseOnTap: true,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ReusableButton(
              buttonText: 'Log In',
              buttonColor: Colors.lightBlueAccent,
              onPress: () {
                Navigator.pushNamed(context, LoginScreen.id);
                //Go to login screen.
              },
            ),
            ReusableButton(
              buttonText: 'Register',
              buttonColor: Colors.blueAccent,
              onPress: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
                //Go to login screen.
              },
            )
            // SizedBox(
            //   width: 250.0,
            //   child: DefaultTextStyle(
            //     style: const TextStyle(
            //       fontSize: 30.0,
            //       fontFamily: 'Bobbers',
            //     ),
            //     child: AnimatedTextKit(
            //       animatedTexts: [
            //         TyperAnimatedText('Minhazul Islam'),
            //         // TyperAnimatedText('you must know what to do,'),
            //         // TyperAnimatedText('and then do your best'),
            //         // TyperAnimatedText('- W.Edwards Deming'),
            //       ],
            //       onTap: () {
            //         print("Tap Event");
            //       },
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}


// animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
// controller.reverse(from: 1);
// animation.addStatusListener((status) {
//   if(status == AnimationStatus.completed) {
//     controller.reverse(from: 1);
//   }else if(status == AnimationStatus.dismissed){
//     controller.forward();
//   }
// });