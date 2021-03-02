import 'package:flutter/material.dart';
import 'package:rotas/models/Clientes.dart';

class SecondHome extends StatefulWidget {
  @override
  _SecondHomeState createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  var clientes = List<Clientes>();
  //List clientes = List<Clientes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Clientes'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/formulario_clientes');
              })
        ],
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text(clientes[index].id + ' ' + clientes[index].name),
              subtitle: Text(clientes[index].address),
              trailing: Container(
                width: 100,
                child: Row(children: [
                  IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        print(clientes[index]);
                        //Navigator.pushNamed(context, '' + lista[index] + '');
                        Navigator.of(context).pushNamed('/formulario_clientes',
                            arguments: clientes[index]);
                      },
                      color: Colors.blue),
                  IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Clientes().excluir(clientes[index].id).then((res) {
                          if (res['status'] == 200) {
                            //Navigator.pushNamed(context, '/second');
                            this._getCli();
                          }
                        });
                      },
                      color: Colors.red)
                ]),
              ));
        },
      ),
    );
  }

  void initState() {
    super.initState();
    this._getCli();
  }

  _getCli() {
    Clientes().getAll().then((response) {
      setState(() {
        if (response['status'] != 401) {
          Iterable list = response['data'];
          clientes = list.map((model) => Clientes.fromJson(model)).toList();
        } else {
          Navigator.pushNamed(context, '/login');
        }
      });
    });
  }
}
