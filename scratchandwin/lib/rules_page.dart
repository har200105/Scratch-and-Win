import 'package:flutter/material.dart';


class Rulespage extends StatefulWidget {
  @override
  _RulespageState createState() => _RulespageState();
}

class _RulespageState extends State<Rulespage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rules"
        ),
      ),
      body: Center(child: Text("The Rules of the Game are :"),),
    );
  }
}