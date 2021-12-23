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
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpService.fetchEmail(),
        builder: (BuildContext context, AsyncSnapshot<List<Email>> snapshot) {
          List<Email> emails = snapshot.hasData ? snapshot.data : [];
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
                    labelText: "Enter your Name"),
                onSubmitted: (value) {},
              ),
            ),
            RaisedButton(
              onPressed: () => {},
              child: Text('Submit'),
            )
          ]);
        });
  }
}
