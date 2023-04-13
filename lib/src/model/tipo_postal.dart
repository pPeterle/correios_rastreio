class TipoPostal {
  TipoPostal({
    required this.categoria,
    required this.descricao,
    required this.sigla,
  });
  late final String categoria;
  late final String descricao;
  late final String sigla;

  TipoPostal.fromJson(Map<String, dynamic> json) {
    categoria = json['categoria'];
    descricao = json['descricao'];
    sigla = json['sigla'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoria'] = categoria;
    _data['descricao'] = descricao;
    _data['sigla'] = sigla;
    return _data;
  }
}
