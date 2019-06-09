import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String routeName = "/Home";

  final String title;

  const Home({this.title = 'Home page'});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Container(
        child: Center(
          child: Text(widget.title),
        ),
      ),
    );
  }
}