import 'package:assignment_3/home_page.dart';
import 'package:assignment_3/login.dart';
import 'package:assignment_3/slider_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }

  runApp(MaterialApp(
    theme: ThemeData(canvasColor: const Color.fromARGB(255, 255, 253, 228)),
    home: isLogin == false ? LogIn() : HomePage(),
    routes: {
      'SliderScreen': (context) => SliderScreen(),
    },
  ));
}
