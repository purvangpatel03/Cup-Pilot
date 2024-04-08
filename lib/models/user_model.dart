class UserModel{
  String name;
  int balance;
  String uid;
  String? docId;

  UserModel({required this.name, required this.uid, required this.balance, this.docId});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'balance': balance,
      'uid': uid,
    };
  }

}