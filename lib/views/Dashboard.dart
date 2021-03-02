import 'package:flutter/material.dart';
import 'package:rotas/models/Auth.dart';
import 'package:rotas/services/MyConstants.dart';
import 'package:rotas/views/drawer2.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String nomeUser = 'xxx';
  List lista = ['/', '/login', '/second', '/dashboard'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer2(), //this will just add the Navigation Drawer Icon
      appBar: AppBar(
        title: Text('DASHBOARD'),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              })
        ],
      ),
      body: Center(
        child: Text(' PAINEL GERAL DO USUÁRIO: ' + nomeUser),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //The location is selected by default

        //item click callback
        onTap: (int index) {
          setState(() {
            print(hashCode);
            Navigator.pushNamed(context, '' + lista[index] + '');
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dangerous), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Login"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "-- Restrito --"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Configurações"),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_camera_mic), label: "Meu Perfil"),
          BottomNavigationBarItem(icon: Icon(Icons.api), label: "Dash"),
        ],
        //Icon size
        iconSize: 26,
        //Select the color
        fixedColor: Colors.red,
        //Configure more than 3 buttons at the bottom
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Or call your function here
  }
}
