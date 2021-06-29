import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicode_project/WeatherPage/screens/loading_screen.dart';
import 'package:unicode_project/ContactPage/ContactPage.dart';

class nextPage extends StatefulWidget {
  @override
  _nextPageState createState() => _nextPageState();
}

class _nextPageState extends State<nextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFffd602),
        title: Text(
          'CHOOSE AN OPTION',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF0A0E21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => contactPage(),
                    ),
                  );
                },
                child: Container(
                  child: Card(
                    color: Color(0xFF0A0E21),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.addressBook,
                        color: Colors.white,
                        size: 150,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(),
                    ),
                  );
                },
                child: Container(
                  child: Card(
                    color: Color(0xFFEB1555),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.thermometerHalf,
                        color: Colors.white,
                        size: 150,
                      ),
                      onPressed: null,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
