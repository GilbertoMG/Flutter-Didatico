import 'package:flutter/material.dart';
import 'package:rotas/models/Auth.dart';
import 'package:rotas/models/Validar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _senha = TextEditingController();

  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PÁGINA DE LOGIN'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Informe seus dados de acesso',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
                controller: _email,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "Email Address")),
            TextFormField(
                controller: _senha,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password")),
            RaisedButton(
                child: Text("-- L O G I N --"),
                onPressed: () {
                  Validar validar =
                      Validar(email: _email.text, senha: _senha.text);
                  validar.login().then((res) {
                    if (res['status'] == 401 ||
                        res['status'] == 404 ||
                        res['status'] == 500) {
                      print(res);
                    }
                    if (res['status'] == 201) {
                      // CREDENCIAIS VERIFICADAS
                      // redireciona para dashboard
                      _auth.setToken(
                          res['data']['token'], res['data']['userName']);
                      Navigator.pushNamed(context, '/dashboard');
                      // print(res['data']);
                      //Navigator.of(context).pop();
                      // Auth.criaToken(res);
                    }
                  });

                  /*
                  _auth.chk(_email.text, _senha.text).then((res) {
                    //Navigator.of(context).pop();
                    if (res['status'] == 401 || res['status'] == 404) {
                      print(res);
                    }
                    if (res['status'] == 200) {
                      // CREDENCIAIS VERIFICADAS
                      // redireciona para dashboard
                      _auth.setToken(res['token'], res['userName']);
                      Navigator.pushNamed(context, '/dashboard');
                      print(res);
                      //Navigator.of(context).pop();
                      // Auth.criaToken(res);
                    }
                  });
                  */

                  //var ok = Auth.chk(_email.text, _senha.text);
                  //print(ok);
                  /* Auth.loginUser(_email.text, _senha.text);
                 */
                  // var ok = Auth.vai(_email.text, _senha.text);

                  //print();
                  /*
                  Auth.chk(_email.text, _senha.text).then((res) {
                    //Navigator.of(context).pop();
                    if (res['status'] == 401 || res['status'] == 404) {
                      print(res);
                    } else {
                      print(res);
                      //Navigator.of(context).pop();
                      // Auth.criaToken(res);
                    }
                  });
*/
                  //.then((resposta) {
                  //print(resposta);
                  //});
                }),
          ],
        ),
      ),
    );
  }
}
