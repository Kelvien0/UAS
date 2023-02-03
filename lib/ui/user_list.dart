import 'package:flutter/material.dart';
import 'package:uts/db/db_helper.dart';
import 'package:uts/model/user.dart';
import 'package:uts/ui/detail_user.dart';
import 'regis_user.dart';

class ListUserPage extends StatefulWidget {
  const ListUserPage({Key? key}) : super(key: key);

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  List<User> listUser = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    _getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar User'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              _openFormCreate();
            }, 
            icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: listUser.length,
          itemBuilder: (context, index) {
            User user = listUser[index];

            return ListTile(
              onTap: () {
                //edit
                _openFormEdit(user);
              },
              contentPadding: EdgeInsets.all(16),
              title: Text(
                '${user.fullName}',
                style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.blue),
              ),
              subtitle: Text('${user.email}'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  AlertDialog hapus = AlertDialog(
                    title: Text('Information'),
                    content: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                              'Delete ${user.email}?'),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ya'),
                        onPressed: () {
                          //delete
                          _deleteUser(user, index);
                          Navigator.pop(context);
                        },
                      ),
                      TextButton(
                        child: Text('Tidak'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                  showDialog(context: context, builder: (context) => hapus);
                },
              ),
              leading: IconButton(
                onPressed: () {
                  //detail
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(user)));
                },
                icon: Icon(Icons.visibility),
              ),
            );
          }),
    );
  }

  Future<void> _getAllUser() async {
    var list = await db.getAllUser();
    setState(() {
      listUser.clear();
      list!.forEach((user) {
        listUser.add(User.fromMap(user));
      });
    });
  }

  Future<void> _deleteUser(User user, int position) async {
    await db.deleteUser(user.id!);

    setState(() {
      listUser.removeAt(position);
    });
  }

  Future<void> _openFormCreate() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormUser()));
    if (result == 'save') {
      await _getAllUser();
    }
  }

  Future<void> _openFormEdit(User user) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormUser(user: user)));
    if (result == 'update') {
      await _getAllUser();
    }
  }
}
