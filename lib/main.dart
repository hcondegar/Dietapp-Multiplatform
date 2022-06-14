import 'package:dietapp/pages/homepage.dart';
import 'package:dietapp/pages/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dietapp/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));
}

void createData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setBool('signedIn', false);
  await prefs.setDouble('hidratsDeCarboni', 0);
  await prefs.setDouble('fibra', 0);
  await prefs.setDouble('proteines', 0);
  await prefs.setDouble('lipids', 0);
  await prefs.setDouble('ferro', 0);
  await prefs.setDouble('calci', 0);
  await prefs.setDouble('calories', 0);
}

void initState() {
  createData();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dietapp',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Dietapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedTabItem = 0;
  final pages = [
    const HomePage(),
    const ListViewDietapp(),
    const ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedTabItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: pages[selectedTabItem],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.eco_outlined),
              label: 'Nutrició',
              selectedIcon: Icon(Icons.eco)),
          NavigationDestination(
              icon: Icon(Icons.checklist_outlined),
              label: 'Llistat',
              selectedIcon: Icon(Icons.checklist)),
          NavigationDestination(
              icon: Icon(Icons.face_outlined),
              label: 'Perfil',
              selectedIcon: Icon(Icons.face)),
        ],
        selectedIndex: selectedTabItem,
        onDestinationSelected: _onItemTapped,
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

class FoodCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const FoodCard(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
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
        child: Row(
          children: [
            Image.network(imageUrl, height: 59, fit: BoxFit.cover),
            const SizedBox(
              width: 15,
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const Spacer(),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
