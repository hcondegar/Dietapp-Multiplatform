import 'package:dietapp/pages/homepage.dart';
import 'package:dietapp/pages/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dietapp/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future saveDate(type, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
}

/*
void main() {
  if (signedIn == false) {
    runApp(const SignIn());
  } else {
    runApp(const UserInfo());
  }
}
*/

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [SafeArea(child: TopBarProfile())]),
    );
  }
}

class TopBarProfile extends StatelessWidget {
  const TopBarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "El teu perfil",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
          )
        ],
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('Sign in'),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (() {}),
          label: Text('Validate'),
          icon: Icon(Icons.check),
        ));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('User info'));
  }
}
