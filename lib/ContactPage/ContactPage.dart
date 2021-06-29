import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unicode_project/ContactPage/ContactList.dart';

void main() {
  runApp(MaterialApp(
    home: ContactPage(),
  ));
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Contacts(),
    );
  }
}
