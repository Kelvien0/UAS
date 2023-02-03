import 'package:flutter/material.dart';
import 'package:uts/ui/accessibility.dart';
import 'package:uts/ui/notification_screen.dart';
import 'package:uts/ui/permission.dart';
import 'package:uts/ui/login.dart';
import 'package:uts/ui/user_list.dart';
import 'package:uts/ui/sharedPreverence.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UAS'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            const Text('UTS', style: TextStyle(fontWeight: FontWeight.bold),),
            const Divider(thickness: 2,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ListUserPage()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                width: 1 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 214, 214, 214),
                ),
                child: Row(
                  children: [
                     Text(
                      '1. SQFlite',
                      style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 85, 85, 85)),
                      )
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                width: 1 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 214, 214, 214),
                ),
                child: Row(
                  children: [
                    Text(
                      '2. Firebase',
                      style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 85, 85, 85)),
                      )
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SharedPreverenceExample())); //Nanti ganti ListUserPage() dengan class page Shared Reference.
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(10),
                width: 1 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 214, 214, 214),
                ),
                child: Row(
                  children: [
                    Text(
                      '3. Shared Preference',
                      style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 85, 85, 85)),
                      )
                  ],
                ),
              )
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text('Firebase menggunakan UI yang disediakan dari firebase dengan menambah depedency firebase_ui_auth: ^1.0.5 pada file pubspec'),),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Akun Demo (uji coba login)'),
                  Text('Email : abc@gmail.com, bcd@gmail.com, cde@gmail.com'),
                  Text('Password : 12345678')
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            const Text('UAS', style: TextStyle(fontWeight: FontWeight.bold),),
            const Divider(thickness: 2,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PermissionHandle()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                width: 1 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 214, 214, 214),
                ),
                child: Row(
                  children: [
                     Text(
                      '1. Permission',
                      style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 85, 85, 85)),
                      )
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccessibilityFeature()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                width: 1 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 214, 214, 214),
                ),
                child: Row(
                  children: [
                     Text(
                      '2. Accessibility',
                      style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 85, 85, 85)),
                      )
                  ],
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ShowNotification()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                width: 1 * MediaQuery.of(context).size.width,
                height: 0.1 * MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 214, 214, 214),
                ),
                child: Row(
                  children: [
                     Text(
                      '3. Notification',
                      style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 85, 85, 85)),
                      )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}