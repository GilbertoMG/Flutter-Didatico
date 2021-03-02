class Usuarios {
  String _id;
  String _nome;
  String _status;

  Usuarios({String id, String nome, String status}) {
    this._id = id;
    this._nome = nome;
    this._status = status;
  }

  String get id => _id;
  set id(String id) => _id = id;
  String get nome => _nome;
  set nome(String nome) => _nome = nome;
  String get status => _status;
  set status(String status) => _status = status;

  Usuarios.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nome'] = this._nome;
    data['status'] = this._status;
    return data;
  }
}
