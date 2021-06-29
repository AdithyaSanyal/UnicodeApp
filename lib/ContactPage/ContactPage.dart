import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicode_project/ContactPage/ContactList.dart';

void main() {
  runApp(MaterialApp(
    home: contactPage(),
  ));
}

class contactPage extends StatefulWidget {
  @override
  _contactPageState createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: contacts(),
    );
  }
}
