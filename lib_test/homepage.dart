import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Appbar'),
        ),
        body: Material(
          child: Center(
            child: Text('This is our Homepage'),
          ),
        ),
        drawer: Drawer(),
      ),
    );
  }
}
