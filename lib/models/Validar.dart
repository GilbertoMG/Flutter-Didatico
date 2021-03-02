import 'package:rotas/services/Rest.dart';

class Validar {
  String _email;
  String _senha;

  Validar({String email, String senha}) {
    this._email = email;
    this._senha = senha;
  }

  String get email => _email;
  set email(String email) => _email = email;
  String get senha => _senha;
  set senha(String senha) => _senha = senha;

  Validar.fromJson(Map<String, dynamic> json) {
    _email = json['email'];
    _senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this._email;
    data['senha'] = this._senha;
    return data;
  }

  login() async {
    Rest rest = Rest();
    return await rest.post_('auth', {'email': email, 'senha': senha});
  }
}
