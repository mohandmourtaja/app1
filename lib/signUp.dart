import 'package:assignment_3/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  var username, email, password;
  GlobalKey<FormState> _key = new GlobalKey<FormState>();

  Signup() async {
    var formdata = _key.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return credential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } else {
      print('eee');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sign Up'),
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
                    username = val;
                  },
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'invalid username';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: 'enter username'),
                ),
                TextFormField(
                  onSaved: (val) {
                    email = val;
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
                    password = val;
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
                      var response = await Signup();
                      if (response != null) {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => LogIn()));
                      } else {
                        // ignore: avoid_print
                        print('error');
                      }
                    },
                    child: const Text('Sign Up')),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => LogIn()));
                    },
                    child: const Text('Login'))
              ],
            )),
      ),
    );
  }
}
