class Endereco {
  Endereco({
    required this.cidade,
    required this.uf,
  });
  late final String cidade;
  late final String uf;

  Endereco.fromJson(Map<String, dynamic> json) {
    cidade = json['cidade'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cidade'] = cidade;
    _data['uf'] = uf;
    return _data;
  }
}
