import 'package:flutter/material.dart';
import 'package:rotas/models/Clientes.dart';

class FormularioClientes extends StatefulWidget {
  @override
  _FormularioClientesState createState() => _FormularioClientesState();
}

class _FormularioClientesState extends State<FormularioClientes> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> dados = {};

  void loadFormData(Clientes cli) {
    if (cli != null) {
      dados['id'] = cli.id;
      dados['name'] = cli.name;
      dados['address'] = cli.address;
      dados['email'] = cli.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Clientes dadosForm = ModalRoute.of(context).settings.arguments;

    loadFormData(dadosForm);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Clientes'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_form.currentState.validate()) {
                  _form.currentState.save();
                  Clientes().add(dados).then((res) {
                    print(res['status']);
                    if (res['status'] != 201) {
                      print(res);
                      //Navigator.pushNamed(context, '/login');
                    }
                    //  Navigator.pushNamed(context, '/second');
                  });
                }

                // Navigator.pushNamed(context, '/second');
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: dados['name'],
                decoration: InputDecoration(labelText: "Nome"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Prencha o nome';
                  }
                },
                onSaved: (value) => dados['name'] = value,
              ),
              TextFormField(
                initialValue: dados['address'],
                decoration: InputDecoration(labelText: "Endereco"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Prencha o Endereco';
                  }
                },
                onSaved: (value) => dados['address'] = value,
              ),
              TextFormField(
                initialValue: dados['email'],
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Prencha o email';
                  }
                },
                onSaved: (value) => dados['email'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initState() {
    super.initState();
  }
}
