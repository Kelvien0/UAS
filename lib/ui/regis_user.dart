import 'package:flutter/material.dart';
import 'package:uts/db/db_helper.dart';
import 'package:uts/model/user.dart';

class FormUser extends StatefulWidget {
  final User? user;

  FormUser({this.user});

  @override
  _FormUserState createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  DbHelper db = DbHelper();

  TextEditingController? fullName;
  TextEditingController? mobileNo;
  TextEditingController? email;

  @override
  void initState() {
    fullName = TextEditingController(
        text: widget.user == null ? '' : widget.user!.fullName);
    mobileNo = TextEditingController(
        text: widget.user == null ? '' : widget.user!.mobileNo);
    email = TextEditingController(
        text: widget.user == null ? '' : widget.user!.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: fullName,
            decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: mobileNo,
            decoration: InputDecoration(
                labelText: 'Mobile No',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: email,
            decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            child: (widget.user == null)
                ? Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
            style: style,
            onPressed: () {
              upsertUser();
            },
          )
        ],
      ),
    );
  }

  Future<void> upsertUser() async {
    if (widget.user != null) {
      //insert

      await db.updateUser(User.fromMap({
        'id': widget.user!.id,
        'fullName': fullName!.text,
        'mobileNo': mobileNo!.text,
        'email': email!.text,
      }));
      Navigator.pop(context, 'update');
    } else {
      //update
      await db.saveUser(User(
        fullName: fullName!.text,
        mobileNo: mobileNo!.text,
        email: email!.text,
      ));
      Navigator.pop(context, 'save');
    }
  }
}
