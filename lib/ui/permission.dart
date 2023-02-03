import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandle extends StatefulWidget {
  @override
  State<PermissionHandle> createState() => _PermissionHandleState();
}

class _PermissionHandleState extends State<PermissionHandle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expandable Listview"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              checkSMSPermission();
            },
            child: Text("Ask Permission"),
          ),
        ));
  }

  void checkSMSPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      PermissionStatus permissionStatus = await Permission.camera.request();
      print("permissionStatus ${permissionStatus.isGranted}");
    } else {
      // access the resoruce
    }
  }
}