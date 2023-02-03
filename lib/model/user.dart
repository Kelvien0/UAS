class User {
  int? id;
  String? fullName;
  String? mobileNo;
  String? email;

  User({this.id, this.fullName, this.mobileNo, this.email});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['fullName'] = fullName;
    map['mobileNo'] = mobileNo;
    map['email'] = email;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.fullName = map['fullName'];
    this.mobileNo = map['mobileNo'];
    this.email = map['email'];
  }
}
