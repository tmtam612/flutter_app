import 'package:flutter/cupertino.dart';

class Email {
  final int id;
  final String email;

  Email({
    @required this.email,
    @required this.id,
  });

  int getId() {
    return this.id;
  }

  String getEmail() {
    return this.email;
  }

  factory Email.fromJson(Map<String, dynamic> json) {
    return Email(
      email: json['email'] as String,
      id: int.parse(json['id']),
    );
  }
}
