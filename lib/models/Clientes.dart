import 'package:rotas/services/Rest.dart';

class Clientes {
  String id;
  String name;
  String address;
  String email;
  Rest rest = Rest();

  Clientes({this.id, this.name, this.address, this.email});

  Future getAll() async {
    return await rest.get_('clientes');
  }

  Future excluir(id) async {
    return await rest.delete_('clientes/$id');
  }

  // by id
  Future get(id) async {
    return await rest.get_('clientes/$id/edit');
  }

  Future add(dados) async {
    return await rest.post_('clientes', dados);
  }

  Clientes.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}
