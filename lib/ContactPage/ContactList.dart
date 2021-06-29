import 'package:flutter/material.dart';
import 'package:unicode_project/ContactPage/Avatarwidget.dart';
import 'package:unicode_project/ContactPage/ContactsData.dart';
import 'package:unicode_project/constants.dart';

class Contact extends StatelessWidget {
  Contact({@required this.name, @required this.style});
  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }
}

class Todo {
  final String name;
  final String description;
  final String phone;

  Todo(this.name, this.description, this.phone);
}

class Contacts extends StatelessWidget {
  final List<Todo> todos;
  Contacts({this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: AvatarWidget(
            text: contactNames[index].description,
          ),
          title: Contact(
            name: contactNames[index].name,
            style: kContactTextStyle,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDisplay(),
                  settings: RouteSettings(
                    arguments: contactNames[index],
                  ),
                ));
          },
        );
      },
    );
  }
}

class ContactDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
            title: Text('CONTACT DETAILS'),
            centerTitle: true,
            backgroundColor: Colors.teal),
        body: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.purple,
                maxRadius: 75,
                child: Text(
                  todo.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.perm_identity),
                title: Text(
                  todo.name,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  todo.phone,
                  style: TextStyle(fontSize: 25),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
