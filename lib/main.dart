import 'package:flutter/material.dart';
import 'package:rotas/views/Dashboard.dart';
import 'package:rotas/views/FormularioClientes.dart';
import 'package:rotas/views/HomePage.dart';
import 'package:rotas/views/Login.dart';
import 'package:rotas/views/SecondHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomePage(),
        '/second': (context) => SecondHome(),
        '/login': (context) => Login(),
        '/dashboard': (context) => Dashboard(),
        '/formulario_clientes': (context) => FormularioClientes(),
      },
    );
  }
}
