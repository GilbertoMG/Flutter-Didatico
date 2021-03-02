import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rotas/services/Rest.dart';

class Auth {
  var storage = FlutterSecureStorage();
  Rest rest = Rest();

  chk(String email, String senha) async {
    Map dados = {'email': email, 'senha': senha};
    return await rest.post_('auth', dados);

    // return Auth.fromJson(await Rest.post('auth', dados));
  }

  // grava o token
  setToken(token, name) {
    // var storage = FlutterSecureStorage();
    storage.write(key: "token-x", value: token);
    storage.write(key: "nome-x", value: name);
  }

  getToken() async {
    //var storage = FlutterSecureStorage();
    var token = await storage.read(key: "token-x");
    var nome = await storage.read(key: "nome-x");
    return {'token': token, 'nome': nome};
  }

  sair() async {
    await storage.read(key: "nome-x");
    await storage.delete(key: "token-x");
  }
}
