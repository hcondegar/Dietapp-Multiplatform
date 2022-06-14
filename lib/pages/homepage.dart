// ignore: unused_import
import 'package:dietapp/main.dart';
import 'package:dietapp/pages/homepage.dart';
import 'package:dietapp/pages/list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dietapp/pages/profile.dart';
import 'package:dietapp/pages/createReg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TypesList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateReg()));
        },
        label: const Text('Crear'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Dietapp",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class TotalLabel extends StatefulWidget {
  final String typeOf;
  final String subtitle;
  final Function() onPressed;
  final double fillBar;

  const TotalLabel(
      {required this.typeOf,
      required this.subtitle,
      required this.onPressed,
      required this.fillBar,
      Key? key})
      : super(key: key);

  @override
  State<TotalLabel> createState() => _TotalLabelState();
}

class _TotalLabelState extends State<TotalLabel> {
  Color getColor(double fillBar) {
    if (fillBar < 0.5) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 350,
        height: 125,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Text(widget.typeOf,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            LinearPercentIndicator(
              width: 300,
              lineHeight: 10,
              barRadius: const Radius.circular(50),
              backgroundColor: Colors.black12,
              progressColor: getColor(widget.fillBar),
              percent: widget.fillBar,
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class TypesList extends StatefulWidget {
  const TypesList({Key? key}) : super(key: key);

  @override
  State<TypesList> createState() => _TypesListState();
}

class _TypesListState extends State<TypesList> {
  Future<double> getValue(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double total = prefs.getDouble(type) ?? 0;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 10),
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40),
          child: TopBar(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(children: [
            TotalLabel(
                typeOf: 'Hidrats de carboni',
                subtitle: 'Range',
                onPressed: () {},
                fillBar: 0.2 //gets result from function
                ),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TotalLabel(
                    typeOf: 'Fibra',
                    subtitle: 'Range',
                    onPressed: () {},
                    fillBar: 0.5)),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TotalLabel(
                    typeOf: 'Proteïnes',
                    subtitle: 'Range',
                    onPressed: () {},
                    fillBar: 0.7)),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TotalLabel(
                    typeOf: 'Lípids',
                    subtitle: 'Range',
                    onPressed: () {},
                    fillBar: 0.3)),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TotalLabel(
                    typeOf: 'Ferro',
                    subtitle: 'Range',
                    onPressed: () {},
                    fillBar: 0.9)),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TotalLabel(
                    typeOf: 'Calci',
                    subtitle: 'Range',
                    onPressed: () {},
                    fillBar: 0.4)),
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TotalLabel(
                    typeOf: 'Caloríes',
                    subtitle: 'Range',
                    onPressed: () {},
                    fillBar: 0.1)),
          ]),
        ),
      ],
    );
  }
}
