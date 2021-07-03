import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = 'AlterLink';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Catalog App'),
        ),
        body: Center(
          child: Container(
            child: Text("Welcome to $days days of $name"),
          ),
        ),
        drawer: Drawer(),
      ),
    );
  }
}
