import 'package:sqflite/sqflite.dart';

Future<User> createUser(User user) async {
  final db = await database;
  final id = await db.insert('users', user.toMap());
  return user.copy(id: id);
}

class User {
  final int id;
  final String username;
  final String password;
  final String email;

  User({this.id, this.username, this.password, this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email
    };
  }

  User copy({int id, String username, String password, String email}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }
}
