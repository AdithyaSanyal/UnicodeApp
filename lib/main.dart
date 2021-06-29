import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'nextpage.dart';

void main() {
  runApp(
    MaterialApp(
      home: Application(),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
    ),
  );
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  TextEditingController controller = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  DateTime selectedDate;
  bool _enabled = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    read();
    read1();
    read2();
    read3();
  }

  save() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/my_file.txt');
    final text = controller.text;
    await file.writeAsString(text);
    print('saved');
  }

  save1() async {
    final directory1 = await getApplicationDocumentsDirectory();
    final file1 = File('${directory1.path}/my_file1.txt');
    final text1 = _date.text;
    await file1.writeAsString(text1);
    print('saved');
  }

  save2() async {
    final directory2 = await getApplicationDocumentsDirectory();
    final file2 = File('${directory2.path}/my_file2.txt');
    final text2 = _phone.text;
    await file2.writeAsString(text2);
    print('saved');
  }

  save3() async {
    final directory3 = await getApplicationDocumentsDirectory();
    final file3 = File('${directory3.path}/my_file3.txt');
    final text3 = _email.text;
    await file3.writeAsString(text3);
    print('saved');
  }

  read() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/my_file.txt');
      String text = await file.readAsString();
      controller.text = text;
    } catch (e) {
      print("Couldn't read file");
    }
  }

  read1() async {
    try {
      final directory1 = await getApplicationDocumentsDirectory();
      final file1 = File('${directory1.path}/my_file1.txt');
      String text1 = await file1.readAsString();
      _date.text = text1;
    } catch (e) {
      print("Couldn't read file");
    }
  }

  read2() async {
    try {
      final directory2 = await getApplicationDocumentsDirectory();
      final file2 = File('${directory2.path}/my_file2.txt');
      String text2 = await file2.readAsString();
      _phone.text = text2;
    } catch (e) {
      print("Couldn't read file");
    }
  }

  read3() async {
    try {
      final directory3 = await getApplicationDocumentsDirectory();
      final file3 = File('${directory3.path}/my_file3.txt');
      String text3 = await file3.readAsString();
      _email.text = text3;
    } catch (e) {
      print("Couldn't read file");
    }
  }

  yourCallback() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          'UnicodeApp',
          style:
              TextStyle(color: Color(0xFF000080), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF6db105),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.userCircle,
                  size: 150,
                  color: Color(0xFF6db105),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: controller..text = '',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'This is a required textfield';
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (_formKey.currentState.validate()) {
                        controller.text = value;
                        save();
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.perm_identity),
                      labelText: 'Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _date..text = '',
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      DateFormat formatter = DateFormat("dd-MM-yyyy");
                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      _date.text = formatter.format(date);
                      save1();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today),
                      labelText: 'Date of Birth',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _phone..text = '',
                    validator: (value) {
                      if (value.length != 10) {
                        return 'Mobile number must contain 10 digits';
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (val) {
                      if (_formKey.currentState.validate()) {
                        _phone.text = val;
                        save2();
                      }
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Phone',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _email..text = '',
                    validator: (value) {
                      var flag = 0;
                      for (var i = 0; i < value.length; i++) {
                        if (value[i] == '@') {
                          flag = 1;
                          print('Present');
                          break;
                        }
                      }
                      if (flag == 0) {
                        return 'Entered Email is Invalid';
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (_formKey.currentState.validate()) {
                        _email.text = value;
                        save3();
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 75,
                  buttonColor: Color(0xFF6db105),
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => nextPage(),
                        ),
                      );
                    },
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
