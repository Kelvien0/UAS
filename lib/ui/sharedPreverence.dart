import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreverenceExample extends StatefulWidget {
  const SharedPreverenceExample({super.key});

  @override
  State<SharedPreverenceExample> createState() => _SharedPreverenceExampleState();
}

class _SharedPreverenceExampleState extends State<SharedPreverenceExample> {
    TextEditingController T_controller = new TextEditingController();
 
  late SharedPreferences s_prefs;
 
  String temp = '';
 
  _saveToShared_Preferences() async {
    s_prefs = await SharedPreferences.getInstance();
    s_prefs.setString("KEY_1", T_controller.text.toString());
  }
 
  _showSavedValue() async {
    s_prefs = await SharedPreferences.getInstance();
    setState(() {
      temp = s_prefs.getString("KEY_1").toString();
    });
  }
 
  _delete_Shared_Preferences() async {
    s_prefs = await SharedPreferences.getInstance();
    s_prefs.remove("KEY_1");
    setState(() {
      temp = " ";
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: TextField(
                          controller: T_controller,
                          decoration: const InputDecoration(
                            labelText: 'Enter Text Here....',
                            border: OutlineInputBorder(),
                          ))),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: ElevatedButton(
                        child: const Text('Store Value in Shared Preferences'),
                        onPressed: () => _saveToShared_Preferences(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ElevatedButton(
                        child: const Text(
                            'Display Value Stored in Shared Preferences'),
                        onPressed: () => _showSavedValue(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ElevatedButton(
                        child: const Text(
                            'Delete Value Stored in Shared Preferences'),
                        onPressed: () => _delete_Shared_Preferences(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        '${temp.toString()}',
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            )));
  }
}

/*
class Child extends StatefulWidget {
  SharedPreverenceExample createState() => SharedPreverenceExample();
}
 
class SharedPreverenceExample extends State<Child> {
  TextEditingController T_controller = new TextEditingController();
 
  late SharedPreferences s_prefs;
 
  String temp = '';
 
  _saveToShared_Preferences() async {
    s_prefs = await SharedPreferences.getInstance();
    s_prefs.setString("KEY_1", T_controller.text.toString());
  }
 
  _showSavedValue() async {
    s_prefs = await SharedPreferences.getInstance();
    setState(() {
      temp = s_prefs.getString("KEY_1").toString();
    });
  }
 
  _delete_Shared_Preferences() async {
    s_prefs = await SharedPreferences.getInstance();
    s_prefs.remove("KEY_1");
    setState(() {
      temp = " ";
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: TextField(
                          controller: T_controller,
                          decoration: const InputDecoration(
                            labelText: 'Enter Text Here....',
                            border: OutlineInputBorder(),
                          ))),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: ElevatedButton(
                        child: const Text('Store Value in Shared Preferences'),
                        onPressed: () => _saveToShared_Preferences(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ElevatedButton(
                        child: const Text(
                            'Display Value Stored in Shared Preferences'),
                        onPressed: () => _showSavedValue(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: ElevatedButton(
                        child: const Text(
                            'Delete Value Stored in Shared Preferences'),
                        onPressed: () => _delete_Shared_Preferences(),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      )),
                  Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        '${temp.toString()}',
                        style:
                            const TextStyle(fontSize: 25, color: Colors.black),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
            )));
  }
}*/
