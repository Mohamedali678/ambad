import 'package:ambad/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //const LoginScreen({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  var username;

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
                  username = value;
                },
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  prefixIcon: const Icon(
                    Icons.person,
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
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
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
                  setState(() {
                    isLoading = true;
                  });

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
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
                  "Sign up",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have accont?",
                  style: TextStyle(fontSize: 16),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Login Here",
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
