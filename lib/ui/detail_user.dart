import 'package:flutter/material.dart';
import 'package:uts/model/user.dart';

class DetailPage extends StatelessWidget {
  final User? user;

  DetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.person,size: 200,),
            Text('Name', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('${user!.fullName}', style: TextStyle(fontSize: 30),),
            SizedBox(height: 20,),
            Text('Mobile No', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('${user!.mobileNo}', style: TextStyle(fontSize: 30)),
            SizedBox(height: 20,),
            Text('Email', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('${user!.email}', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
