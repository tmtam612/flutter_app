import 'package:flutter/material.dart';
import 'Email.dart';
import 'http_service.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test '),
          backgroundColor: Colors.blue,
        ),
        body: DemoPage(),
      ),
    ),
  );
}

class DemoPage extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<DemoPage> {
  final emailController = TextEditingController();
  List<Email> emails = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ListView(
          padding: const EdgeInsets.only(top: 10.0),
          children: emails
              .map((Email item) => ListTile(
                    title: Text(item.email),
                  ))
              .toList(),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextField(
          controller: emailController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(30),
              ),
            ),
            labelText: "Enter your Name",
          ),
        ),
      ),
      RaisedButton(
        onPressed: () {
          Email email = Email(
            email: emailController.text,
            id: 1,
          );
          this.setState(() {
            emails.add(email);
          });
        },
        child: Text('Submit'),
      )
    ]);
  }
}
