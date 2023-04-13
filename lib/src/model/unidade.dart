import 'package:correios_rastreio/src/model/endereco.dart';

class Unidade {
  Unidade({
    required this.endereco,
    required this.tipo,
  });
  late final Endereco endereco;
  late final String tipo;

  Unidade.fromJson(Map<String, dynamic> json) {
    endereco = Endereco.fromJson(json['endereco']);
    tipo = json['tipo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['endereco'] = endereco.toJson();
    _data['tipo'] = tipo;
    return _data;
  }
}
