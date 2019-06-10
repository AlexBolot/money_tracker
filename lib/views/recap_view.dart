import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "/HomeView";

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Accueil'),
      ),
    );
  }
}
