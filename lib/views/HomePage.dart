import 'package:flutter/material.dart';

import 'drawer2.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer2(),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
            //Route route = MaterialPageRoute(builder: (context) => SecondHome());
            // Navigator.push(context, route);
          },
          child: Text('PAGINA PRINCIPAL'),
        ),
      ),
    );
  }
}
