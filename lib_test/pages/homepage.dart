import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final appName = 'Catalog App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Material(
        child: Center(
          child: Text('This is our Homepage'),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
