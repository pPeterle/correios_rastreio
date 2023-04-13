import 'package:correios_rastreio/src/model/unidade.dart';

class Eventos {
  Eventos({
    required this.codigo,
    required this.descricao,
    required this.data,
    required this.tipo,
    required this.unidade,
    required this.urlIcone,
  });
  late final String codigo;
  late final String descricao;
  late final DateTime data;
  late final String tipo;
  late final Unidade unidade;
  late final Unidade? unidadeDestino;
  late final String? urlIcone;

  Eventos.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    descricao = json['descricao'];
    data = DateTime.parse(json['dtHrCriado']);
    tipo = json['tipo'];
    unidade = Unidade.fromJson(json['unidade']);

    if (json['unidadeDestino'] != null) {
      unidadeDestino = Unidade.fromJson(json['unidadeDestino']);
    }

    urlIcone = json['urlIcone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['codigo'] = codigo;
    _data['descricao'] = descricao;
    _data['dtHrCriado'] = data.toIso8601String();
    _data['tipo'] = tipo;
    _data['unidade'] = unidade.toJson();

    if (unidadeDestino != null) {
      _data['unidadeDestino'] = unidade.toJson();
    }

    _data['urlIcone'] = urlIcone;
    return _data;
  }
}
