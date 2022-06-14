import 'package:dietapp/pages/homepage.dart';
import 'package:dietapp/pages/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dietapp/pages/profile.dart';

class ListViewDietapp extends StatelessWidget {
  const ListViewDietapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [SafeArea(child: TopBarList())],
    ));
  }
}

class TopBarList extends StatelessWidget {
  const TopBarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Llistat",
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
