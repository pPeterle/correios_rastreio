import 'package:correios_rastreio/src/model/endereco.dart';

class Unidade {
  Unidade({
    required this.endereco,
    required this.nome,
  });
  late final Endereco? endereco;
  late final String nome;

  Unidade.fromJson(Map<String, dynamic> json) {
    if (json['endereco'] != null && json['endereco']['cidade'] != null) {
      endereco = Endereco.fromJson(json['endereco']);
    } else {
      endereco = null;
    }

    final tipo = json['tipo'];

    final descricao = json['nome'];
    if (descricao != null) {
      nome = '$tipo - $descricao';
    } else {
      nome = tipo;
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['endereco'] = endereco?.toJson();
    _data['tipo'] = nome;
    return _data;
  }
}
