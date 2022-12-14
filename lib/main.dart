//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:quick_chat/screens/chat_screen.dart';
import 'package:quick_chat/screens/login_screen.dart';
import 'package:quick_chat/screens/modalProgressHud.dart';
import 'package:quick_chat/screens/registration_screen.dart';
import 'package:quick_chat/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quick Chat",
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54, fontFamily: 'monserate'),
        ),
      ),
      // home: WelcomeScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context)=> WelcomeScreen(),
      //   '/register': (context)=> RegistrationScreen(),
      //   '/login': (context)=> LoginScreen(),
      //   '/chat': (context)=> ChatScreen()
      // },
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ModalHud.id: (context) => ModalHud(),
      },
    );
  }
}
