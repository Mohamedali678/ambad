import 'package:ambad/screens/home_screen.dart';
import 'package:ambad/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //const LoginScreen({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  var email;

  var password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabled: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: MaterialButton(
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minWidth: double.infinity,
                color: Colors.pinkAccent,
                onPressed: () async {
                  setState(
                    () {
                      isLoading = true;
                    },
                  );
                  try {
                    final loggedUser = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    if (loggedUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have accont yet?",
                  style: TextStyle(fontSize: 16),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignupScreen(),
                      ),
                    );
                    // setState(() {
                    //   isLoading = false;
                    // });
                  },
                  child: const Text(
                    "Sign up here",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
