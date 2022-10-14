import 'package:assignment_3/home_page.dart';
import 'package:assignment_3/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  var myemail, mypassword;
  GlobalKey<FormState> _key = new GlobalKey<FormState>();

  Login() async {
    var formdata = _key.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      }
    } else {
      print('eee');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogIn'),
      ),
      body: Center(
        child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  onSaved: (val) {
                    myemail = val;
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty || !v.contains('@')) {
                      return 'invalid email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'enter email'),
                ),
                TextFormField(
                  onSaved: (val) {
                    mypassword = val;
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty || v.length < 6) {
                      return 'invalid password';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'enter password'),
                ),
                ElevatedButton(
                    onPressed: () async {
                      var user = await Login();
                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => HomePage()));
                      } else {
                        print('error');
                      }
                    },
                    child: const Text('Log In')),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => SignUp()));
                    },
                    child: const Text('signUp'))
              ],
            )),
      ),
    );
  }
}
