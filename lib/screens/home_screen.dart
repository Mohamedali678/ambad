import 'package:ambad/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //const HomeScreen({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [test(), test(), test()];

    return Scaffold(
      appBar: AppBar(
        title: Text("Heoo"),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: "Add Post"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.pinkAccent,
            height: 300,
            width: double.infinity,
            //alignment: Alignment.topCenter,
            child: Column(
              children: const [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 60,
                  child: Text("User"),
                ),
                Text(
                  "Mohamed Ali",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
